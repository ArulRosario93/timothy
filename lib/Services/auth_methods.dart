import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timothy/Utils/show_snack_bar.dart';

class AuthMethods {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //Authenticate User
  Future <bool> authenticateUserWithMailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {

    bool isSuccess = false;

    try {
      
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      await sendMailVerification(context);


    } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message!);
    }

    return Future.value(isSuccess);
  }

  Future<void> sendMailVerification(BuildContext context) async {

    try {
      
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email Verification Sent");

    } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message!);
    }

  }


  // Future<void> createDataBase({
    
  // }){}


  // to check whether 200 users filled in DB
  Future<void> maintainDatabase({
    required String index,
  }) async {

      try {

        await _firestore.collection("Location").doc(index).collection("Users").where("isfilled", isEqualTo: false).get()
        .then((value) => {



            value.docs.first.reference.update({
              "isfilled": true,
            })
        });

        // await _firestore.collection("Location").doc(index).collection("Users").doc()

      } catch (e) {
        
        print(e);
      }
  }

  Future<void> registerUserForTheFirstTime({required String geohashCode,required String uid}) async {

    String index = geohashCode[0];
      
    bool res = await userAvailableInLocation(index);

    if (res) {

      // To Stote all the data from the DB
        late List datainlist = [];
        late Map newlist = {};

        // check isfilled is false
        await _firestore.collection("Location").doc(index).collection("Users").where("isfilled", isEqualTo: false).get()
        .then((value) async => {

          // Update the DB with the new user
          datainlist = value.docs.first["data"],


          // New geohashcode of the user
          newlist = {
            "uid": uid,
            "geohashcode": geohashCode,
          },


          value.docs.first.reference.update({
              // Add the user into the DB
              "data": [...datainlist, newlist],
          }),
        });

        // isSuccess = true;
      
    }else{

       // Create a new DB
        await _firestore.collection("Location").doc(index).collection("Users").doc().set({
          "data": [{
            "uid": uid, 
            "geohashcode": geohashCode,
          }],
          "count": 1,
          "isfilled": false,
        });

        // isSuccess = true;
      

    }

  }

  // Reegistering the User's Lcoation
  Future<bool> registerUserLocation({
    
    required String geohashCode,
    required String uid,

  }) async {

    bool isSuccess = false;

    try {

        // Getting the first index of the geohashcode
        String index = geohashCode[0];

        // To Stote all the data from the DB
        late List datainlist = [];
        late List removedlist = [];
        late Map newlist = {};

        // check isfilled is false
        await _firestore.collection("Location").doc(index).collection("Users").where("isfilled", isEqualTo: false).get()
        .then((value) async => {

          // Update the DB with the new user
          datainlist = value.docs.first["data"],

          // Removing the user previous data in the DB
          removedlist = datainlist.where((x) => x["uid"] == uid).toList(),

          // New geohashcode of the user
          newlist = {
            "uid": uid,
            "geohashcode": geohashCode,
          },


          value.docs.first.reference.update({
              // Add the user into the DB
              "data": [...removedlist, newlist],
          }),
        });

        isSuccess = true;

    } catch (e) {
      print("ERROR $e");
    }

    return Future.value(isSuccess);
  }

  // Check User Location Avilability
  Future <bool> userAvailableInLocation(String index) async {
    bool isSuccess = false;
    try {

      var res = await _firestore.collection("Location").doc(index).collection("Users").count().get();

      isSuccess = res.count! > 0;

    } catch (e) {
        print("ERROR FOUND");
    }

    return Future.value(isSuccess);
  }

  // Get User from paticular Location
  Future<Map<String, dynamic>?> getUserFromParticularLocation(String index, int int) async {

    try {
  
      var data = await _firestore.collection("Location").doc(index).collection("Users").doc("DB$int").get();

      return data.data();
    } catch (e) {

      print(e);
    }

    return null;
  }

  // To get the location where users are most used
  Future<String?> getThePeakLocation(int int) async {

    try {
      
      var data = await _firestore.collection("Peak Location").get();
      return data.docs.first["locations"][int];

    } catch (e) {

      print(e);
      return null;

    }
  }


  // Get user from all country
  Future<Map<String, dynamic>?> getUserFromAllCountry(int int) async {

    try {

      String? index = await getThePeakLocation(int);

      if(index!.isNotEmpty){

        var data = await getUserFromParticularLocation(index, 1);
        return data;

      }else{

        // Return Developer Profile

      }
    } catch (e) {
      print(e);
    }
      return null;
  }


  // Checking for another DB present in the Particular location
  Future <bool> checkForAnotherDBfromParticularLocation(String geohashcode, int int) async {

    bool isSuccess = false;

    try {
        _firestore.collection("Location").doc(geohashcode).collection("Users").where((element) => isSuccess = true);
    } catch (e) {
      print(e);
    }

    return Future.value(isSuccess);
  }

  // Getting User. IMP Function
  Future<Map<String, dynamic>?> getUsers(String geohashCode)async {

    // get the first index of the geohashcode
    String index = geohashCode[0];

    // Check if users available in the location
    bool res = await userAvailableInLocation(index); 
    
    // Get Users 
    if(res){

      // Get from DB1
      return await getUserFromParticularLocation(index, 1);

    } else{

      print("No User in your country");
      await getUserFromAllCountry(0);

    }  

    return null;
  }
}

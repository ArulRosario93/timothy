import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/Services/auth_methods.dart';
import 'package:timothy/Utils/show_snack_bar.dart';
import 'package:timothy/sample_data.dart';
import 'package:http/http.dart' as http;
import 'package:timothy/widgets/InfoContainer/info_container.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  double _height = 10.0;
  bool _isLoading = true;


  static const daata = {
    "name": "John Doe", 
    "image": "https://external-preview.redd.it/ZT4ic2-4DzUDhPeiVyk7Br7HMfF0z6hxD8LCP7l4zVA.jpg?width=1080&crop=smart&auto=webp&s=72023798bdf1f54c823c1bc56ae6ec77cf33de3d", 
    "location": "New York, USA",
    "verse": "The Lord is my shepherd; I shall not want. He maketh me to lie down in green pastures"
  };




  // void handlePostReq() async {

  //   try {      
  //     var response = await http.post(
  //       Uri.parse("http://localhost:3000/save"), 
  //       headers: {
  //         "Content-Type": "application/json"
  //       }, 
  //       body: jsonEncode(daata),
  //     );

  //     print(response.body);

  //   } catch (e) {
  //     print(e);        
  //   }
  // }

  handleFunction() async {

    var res = await AuthMethods().registerUserLocation(geohashCode: "ufo", uid: "123456",);
    print(res);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    handleFunction();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _height = 0;
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

            const SizedBox(height: 20,),

            Flexible(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(data[0]['image']),
                      )
                    ),
                  ),
                  
                  AnimatedContainer(
                    duration: Duration(seconds: 1), 
                    alignment: Alignment.bottomCenter, 
                    margin: EdgeInsets.only(bottom: _height), 
                    child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: _isLoading ? 0 : 1,
                    child: Text(data[0]['name'], textAlign: TextAlign.center, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 25, 25, 25), fontSize: 20),
                    ),
                  ),),
                ],
              ),
            ),

            const SizedBox(height: 10,),

            Text(data[0]["verse"], textAlign: TextAlign.center, style: GoogleFonts.poppins(color: Colors.black87, fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),),

            const SizedBox(height: 20,),

            Text("Personal Details", textAlign: TextAlign.left, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 160, 238, 76), fontSize: 14),),
            const SizedBox(height: 3,),
            InfoContainer(),
            InfoContainer(),

            Flexible(
              flex: 1,
              child: Container(),
            ),
        ],
      ),
    );
  }
}
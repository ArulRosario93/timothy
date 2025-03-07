import 'package:flutter/material.dart';
import 'package:timothy/Services/server_methods.dart';
import 'package:timothy/pages/ChatPage/chat_page.dart';
import 'package:timothy/pages/Timothy/Home/home_page.dart';
import 'package:timothy/pages/Timothy/Profile/profile_page.dart';
import 'package:timothy/widgets/BottomNavBtn/bottom_nav_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class TimothyApp extends StatefulWidget {
  const TimothyApp({super.key});

  @override
  State<TimothyApp> createState() => _TimothyAppState();
}

class _TimothyAppState extends State<TimothyApp> {

  // Selected Page
  int selectedpage = 0;

  // All the page in app
  List pages = [
      HomePage(),
      const SizedBox(),
      ProfilePage()
  ];

  void handlePageChange(int index){

    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChatPage(),
      ));
      return;
    }

    setState(() {
      selectedpage = index;
    });
  }

  void handleSpotifyLoginandGetData() async {
    // const URL = "https://accounts.spotify.com/api/token";
    const clientID = "21ccb265edf64f7b9a272cdf00292167";
    // const clientSecret = "2e3f75a122b54b14a0468f275ed00ad1";
    const redirectURL = "http://localhost:3000/auth/spotify/details";
    const String scope = "user-read-email user-read-private";


    Future.delayed(const Duration(seconds: 3), () async {
     final Uri url = Uri.parse("https://accounts.spotify.com/authorize?client_id=$clientID&response_type=code&redirect_uri=$redirectURL&scope=$scope");
      if(await canLaunchUrl(url)){
          print("Launching URL");
          await launchUrl(url);
      }else{
        print("Could not launch URL");
        throw "Could not launch $url";
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // handleSpotifyLoginandGetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: selectedpage == 0? AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Heyy, Arul"),
      ): null,
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 50,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Flexible(flex: 1, child: GestureDetector(
              onTap: () => handlePageChange(0),
              child: BottomNavBtn(selectedpage: 0, selectedPageIndex: selectedpage, icon: Icon(Icons.home_outlined, color: selectedpage == 0? Colors.white: Colors.black,),)
            )),
            
            Flexible(flex: 1, child: 
              GestureDetector(
                onTap: () => handlePageChange(1),
                child: BottomNavBtn(selectedpage: 1, selectedPageIndex: selectedpage, icon: Icon(Icons.message_outlined, color: selectedpage == 1? Colors.white: Colors.black,),),
              )
            ),
            
            Flexible(flex: 1, child: 
              GestureDetector(
                onTap: () => handlePageChange(2),
                child: BottomNavBtn(selectedpage: 2, selectedPageIndex: selectedpage, icon: Icon(Icons.person_outline, color: selectedpage == 2? Colors.white: Colors.black,),),
              )
            ),
            
          ],
        ),
      ),

      body: pages[selectedpage]
    );
  }
}
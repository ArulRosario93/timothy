import 'package:flutter/material.dart';
import 'package:timothy/pages/Timothy/Connect/connect_page.dart';
import 'package:timothy/pages/Timothy/Home/home_page.dart';
import 'package:timothy/pages/Timothy/Profile/profile_page.dart';
import 'package:timothy/widgets/BottomNavBtn/bottom_nav_btn.dart';

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
      ConnectPage(),
      ProfilePage()
  ];

  void handlePageChange(int index){
    setState(() {
      selectedpage = index;
    });
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
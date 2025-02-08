import 'package:flutter/material.dart';
import 'package:timothy/pages/Timothy/Connect/connect_page.dart';
import 'package:timothy/pages/Timothy/Home/home_page.dart';
import 'package:timothy/pages/Timothy/Profile/profile_page.dart';

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
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Heyy, Arul"),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              IconButton(onPressed: () => handlePageChange(0), icon: Icon(Icons.home_outlined)),
              
              IconButton(onPressed: () => handlePageChange(1), icon: Icon(Icons.message_outlined)),
              
              IconButton(onPressed: () => handlePageChange(2), icon: Icon(Icons.person_outlined)),
              
            ],
          ),
        ),
      ),

      body: pages[selectedpage]
    );
  }
}
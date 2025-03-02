import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: Stack(
                    children: [
                      Hero(
                        tag: "profile-image",
                        transitionOnUserGestures: true,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage("https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                // This was tough. But I did it good.
                                BoxShadow(
                                  color: const Color.fromARGB(209, 0, 0, 0),
                                  blurRadius: 40,
                                  spreadRadius: 20,
                                  offset: const Offset(0, 50),
                                  blurStyle: BlurStyle.normal
                                ),
                                BoxShadow(
                                  color: const Color.fromARGB(159, 0, 0, 0),
                                  blurRadius: 80,
                                  spreadRadius: 40,
                                  offset: const Offset(0, 0),
                                  blurStyle: BlurStyle.normal
                                ),
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 120,
                                  spreadRadius: 60,
                                  offset: const Offset(0, -50),
                                  blurStyle: BlurStyle.normal
                                ),
                              ]
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Arul Rosario", style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),),
                                        // Text("Arul Rosario mafaef", style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white), softWrap: true,),
                                        Text("Founder of the maja company", style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),),
                                      ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, color: const Color.fromARGB(234, 255, 255, 255), size: 14,),
                                    SizedBox(width: 5,),
                                    Text("Chennai", style: GoogleFonts.poppins(color: const Color.fromARGB(234, 255, 255, 255), fontSize: 12),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('Share your Testimony', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),)),
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}

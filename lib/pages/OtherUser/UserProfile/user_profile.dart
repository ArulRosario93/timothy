import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage("https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                          // color: Colors.black26,
                            boxShadow: [
                              // BoxShadow(
                              //   color: Colors.black26,
                              //   blurRadius: 10,
                              //   offset: const Offset(0, 5),
                              //   blurStyle: BlurStyle.outer
                              // ),
                            ]
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 50,
                                        offset: const Offset(0, 20),
                                        blurStyle: BlurStyle.normal
                                      ),
                                      BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 200,
                                        offset: const Offset(0, -50),
                                        blurStyle: BlurStyle.normal
                                      ),
                                    ]
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                      children: [
                                          Text("Arul Rosario", style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),),
                                          Text("Founder of the maja company", style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),),
                                      ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Text("Chat", style: GoogleFonts.poppins(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: const Color.fromARGB(244, 0, 0, 0),
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
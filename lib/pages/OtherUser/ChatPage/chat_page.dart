import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {

    List helperMsgList = [
      {
        "name": "verses",
        "value": "verses"
      },
      {
        "name": "rizz",
        "value": "rizz"
      },
      {
        "name": "starting line",
        "value": "startingline"
      },
      {
        "name": "silly gif",
        "value": "sillygif"
      },
      {
        "name": "parables",
        "value": "parables"
      },
      {
        "name": "pick up lines",
        "value": "pickuplines"
      },
      {
        'name': "80s tamil songs lyrics",
        'value': "80stamilsongs"
      }
    ];


    List msg = [
      {
        "name": " Arul Rosario",
        "msg": "Hello, how are you?",
      },
      {
        "name": "Rosh",
        "msg": "I am good, how are you?",
      },
      {
        "name": "Arul Rosario",
        "msg": "I am good too, thank you for asking.",
      },
      {
        "name": "Rosh",
        "msg": "What are you doing?",
      },
      {
        "name": "Arul Rosario",
        "msg": "I am just working on my project.",
      },
      {
        "name": "Rosh",
        "msg": "That's great, what is your project about?",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Arul Rosario', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: Colors.white),),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.more_vert_rounded, size: 18,),
          // )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(msg[index]['msg'], style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),)
                );
              }, 
              itemCount: msg.length,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 31, 31, 31),
              hintText: 'Send Message',
              hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                borderSide: BorderSide.none,
          
              ),
              focusedBorder: null,
              enabledBorder: null,
              errorBorder: null,
              disabledBorder: null,
          
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_rounded, size: 18, color: Colors.white,),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: const  Color.fromARGB(255, 31, 31, 31),
            height: 40,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding( 
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(helperMsgList[index]['name'], style: GoogleFonts.poppins(fontSize: 14, color: Colors.white60),)
                );
              }, 
              itemCount: helperMsgList.length, scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      )
    );
  }
}
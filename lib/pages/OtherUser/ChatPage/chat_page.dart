import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/widgets/ShowModalBottomSheet/show_modal_bottom_sheet.dart';

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

    void handleClick() {
      // Handle click event
      bottomSheetForMessage(context, {
        "title": "Verses",
        "data": [
          {
            "verse": "Blessed are the poor in spirit, for theirs is the kingdom of heaven",
            "reference": "- Matthew 5:3"
          },
          {
            "verse": "Blessed are those who mourn, for they will be comforted",
            "reference": "- Matthew 5:4"
          },
          {
            "verse": "Blessed are the meek, for they will inherit the earth",
            "reference": "- Matthew 5:5"
          },
          {
            "verse": "Blessed are those who hunger and thirst for righteousness, for they will be filled",
            "reference": "- Matthew 5:6"
          },
          {
            "verse": "Blessed are the merciful, for they will be shown mercy",
            "reference": "- Matthew 5:7"
          },
          {
            "verse": "Blessed are the pure in heart, for they will see God",
            "reference": "- Matthew 5:8"
          },
          {
            "verse": "Blessed are the peacemakers, for they will be called children of God",
            "reference": "- Matthew 5:9"
          },
          {
            "verse": "Blessed are those who are persecuted because of righteousness, for theirs is the kingdom of heaven",
            "reference": "- Matthew 5:10"
          },
          {
            "verse": "Blessed are you when people insult you, persecute you and falsely say all kinds of evil against you because of me",
            "reference": "- Matthew 5:11"
          },
          {
            "verse": "Rejoice and be glad, because great is your reward in heaven, for in the same way they persecuted the prophets who were before you",
            "reference": "- Matthew 5:12"
          }
        ]
      }); 
    }

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
                onPressed: handleClick,
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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/widgets/BottomSheetForSpotify/bottom_sheet_for_spotify.dart';
import 'package:timothy/widgets/OtherUserChatContainer/other_user_chat_container.dart';
import 'package:timothy/widgets/ShowModalBottomSheet/show_modal_bottom_sheet.dart';
import 'package:timothy/widgets/UserChatContainer/user_chat_container.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  TextEditingController msgController = TextEditingController();
  ScrollController scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  // For Bible Study Session
  bool bibleStudySession = false;

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
        "name": "bible study",
        "value": "biblestudy"
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
        "msg": "Hi",
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
        "msg": "What are you doing? How its going for you man? Seems like you are busy with your project.",
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

    Map bibleVerse = {
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
    };

    Map biblestudy = {
      "title": "Bible Study",
      "data": [
        {
          "verse": "The Parable of the Sower",
          "reference": "- Matthew 13:3-9"
        },
        {
          "verse": "The Parable of the Weeds",
          "reference": "- Matthew 13:24-30"
        },
        {
          "verse": "The Parable of the Mustard Seed",
          "reference": "- Matthew 13:31-32"
        },
        {
          "verse": "The Parable of the Yeast",
          "reference": "- Matthew 13:33"
        },
        {
          "verse": "The Parable of the Hidden Treasure",
          "reference": "- Matthew 13:44"
        },
        {
          "verse": "The Parable of the Pearl of Great Value",
          "reference": "- Matthew 13:45-46"
        },
        {
          "verse": "The Parable of the Net",
          "reference": "- Matthew 13:47-50"
        }
      ]
    };

    Map chatTheme = {
      "normal": {
        "user": {
          "backgroundColor": const Color.fromARGB(221, 234, 234, 234),
          "textColor": Colors.black,
        },
        "otherUser": {
          "backgroundColor": const Color.fromARGB(255, 31, 31, 31),
          "textColor": Colors.white,
        },
      },
      "dark": {
        "user": {
          "backgroundColor": const Color.fromARGB(255, 31, 31, 31),
          "textColor": Colors.white,
        },
        "otherUser": {
          "backgroundColor": const Color.fromARGB(221, 234, 234, 234),
          "textColor": Colors.black,
        },
      }
    };

    // Scroll to the bottom after the UI updates
    void scrollToBottom(bool wait) async {
      if(wait && _focusNode.hasFocus){
        await Future.delayed(const Duration(milliseconds: 300), () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 1),
            curve: Curves.easeOut,
          );
        });
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }

    void handleAddMsg(List msgs){
      msgs.asMap().forEach((index, value) {
        msg.add({
          "name": "Arul Rosario",
          "msg": value,
        });
      });

      setState(() {});

      // Scroll to the bottom after the UI updates
      scrollToBottom(false);
    }

    void handleSendMessage(){
      if(msgController.text.isNotEmpty){
        msg.add({
          "name": "Arul Rosario",
          "msg": msgController.text,
        });
        msgController.clear();
        setState(() {});

        //Scroll To Bottom
        scrollToBottom(false);
      }
    }

  void handleOpenHelperTexts({required String helperText}) async { {
    // Handle click event

    // switch

    // if(helperText == "verses") {
      // await ServerMethods().getRandomVersesFromBibleApi()!.then((value) {
      //   if(value != null){
      //     print(value["reference"]);
      //     print(value["verses"]);
      //   }
      // });  
      // await ServerMethods().getRandomVersesFromApiEsv(book: "mathew", chapter: "5", verses: "3-12")!.then((value) {
      //   if(value != null){
      //     print(value);
      //     print("BELOWWW");
      //     print(value["passages"]);
      //     print("BELOWW 6");
      //     print(value["passages"][0]);
      //   }
      // });
    // };

    if (helperText == "bible study") {
      
      bottomSheetForMessage(context: context, data: biblestudy, type: biblestudy["title"], handleAddMsg: handleAddMsg); 
      return;
    }
  
    bottomSheetForMessage(context: context, data: bibleVerse, type: bibleVerse["title"], handleAddMsg: handleAddMsg); 
  }}

  void handleSpotifyView(){
    bottomSheetForSpotify(context: context, image: "https://static.qobuz.com/images/covers/32/01/0190295710132_600.jpg", songName: "Perfect", atristName: "Ed Sheeran");
  }

  void handleChangeBibleStudySession(){

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        bibleStudySession = !bibleStudySession;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    handleChangeBibleStudySession();

    _focusNode.addListener(
      () => scrollToBottom(true),
    );
  }

  @override
  void dispose() {
    super.dispose();
    msgController.dispose();
    scrollController.dispose();
    _focusNode.dispose();
    // Dispose of the focus node
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        leadingWidth: 50,
        titleSpacing: 0,
        title: Text('Arul Rosario', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
        elevation: 0.0,
        centerTitle: false,
        toolbarHeight: 100,
        actionsIconTheme: IconThemeData(color: Colors.white),
        actions: [
          GestureDetector(
            onTap: handleSpotifyView,
            child: Container(
              width: 140,
              height: 70,
              margin: EdgeInsets.only(bottom: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage("https://image.shutterstock.com/image-vector/perfect-3d-style-editable-text-260nw-2332976895.jpg"), fit: BoxFit.cover,),
              ),
              child: Container(
                color: Colors.black26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Perfect", style: GoogleFonts.poppins(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
                    Text("Ed Sheeran", style: GoogleFonts.poppins(fontSize: 8, color: Colors.white, fontWeight: FontWeight.w600),),
                    const SizedBox(height: 5,),
                    // Image.network("https://www.figma.com/community/resource/0c2e9ce7-9ccc-4a64-bc58-591beae094f6/thumbnail", width: 10, height: 10, fit: BoxFit.cover,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        child: msg[index]['name'] == "Arul Rosario" ?
                          UserChatContainer(data: msg[index], theme: chatTheme["dark"]["user"],) : OtherUserChatContainer(data: msg[index], theme: chatTheme["dark"]["otherUser"],),
                      );
                    }, 
                    itemCount: msg.length,
                  ),
                ),
              ),
              TextField(
                autofocus: false,
                focusNode: _focusNode,
                // onTap: () => scrollToBottom(true),
                onSubmitted: (value) => handleSendMessage(),
                // textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 1,
                controller: msgController,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
                cursorColor: Colors.white,
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
                    onPressed: handleSendMessage,
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
                    return GestureDetector(
                      onTap: () => handleOpenHelperTexts(helperText: helperMsgList[index]['name']),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Text(helperMsgList[index]['name'], style: GoogleFonts.poppins(fontSize: 14, color: Colors.white60),)
                      ),
                    );
                  }, 
                  itemCount: helperMsgList.length, scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}

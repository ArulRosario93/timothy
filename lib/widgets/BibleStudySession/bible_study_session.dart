import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class BibleStudySession extends StatefulWidget {
  const BibleStudySession({super.key});

  @override
  State<BibleStudySession> createState() => _BibleStudySessionState();
}

class _BibleStudySessionState extends State<BibleStudySession> {

  bool started = false;
  int currentSlide = 0;

  // For the text input field
  TextEditingController message = TextEditingController();

  // For the list of messages
  List<Map> messages = [];

  // To scroll to the bottom of the screen when the keyboard pops up
  ScrollController scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();


  bool makeAvailable = false;
  bool loading = false;

  List headersforBibleStudy = [
      "ABOUT GOD",
      "SIN",
      "PROMISES",
      "EXAMPLE",
      "COMMAND",
      "TEACHING"
  ];


  void handleSessionStarted() async {
    setState(() {
      started = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        currentSlide = 1;
      });
    });

    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        makeAvailable = true;
      });
    });
  }

  void handleChangeSlide(){

    setState(() {
      currentSlide++;
      makeAvailable = false;
    });

    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        makeAvailable = true;
      });
    });
  }

  void handleSendMessage(){
    if(message.text.isNotEmpty){
      // Add the message to the list of messages
      messages.add({
        "message": message.text,
        "sender": "user",
      });

      // Clear the text field
      message.clear();

      // Scroll to the bottom of the screen
      scrollToBottom(false);
    }
  }

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
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 28),    
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [

            Column(
              children: [
                Expanded(
                  child: SafeArea(
                    child: SizedBox(
                      height: started? MediaQuery.of(context).size.height * 0.7: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Text("Bible Study", style: GoogleFonts.poppins(fontSize: 12, color: const Color.fromARGB(236, 255, 255, 255), fontWeight: FontWeight.w600),),
                          const SizedBox(height: 8),
                          Text("The Parable of the Sower", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),),
                          const SizedBox(height: 6),
                          Text("Matthew 13:3-9", style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),),  
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Text(
                                      "Then he told them many things in parables, saying: “A farmer went out to sow his seed. Then he told them many things in parables, saying: “A farmer went out to sow his seed. Then he told them many things in parables, saying: “A farmer went out to sow his seed. 4 As he was scattering the seed, some fell along the path, and the birds came and ate it up. 5 Some fell on rocky places, where it did not have much soil. It sprang up quickly, because the soil was shallow. 6 But when the sun came up, the plants were scorched, and they withered because they had no root. 7 Other seed fell among thorns, which grew up and choked the plants. 8 Still other seed fell on good soil, where it produced a crop—a hundred, sixty or thirty times what was sown. 9 Whoever has ears, let them hear.",
                                      style: GoogleFonts.poppins(fontSize: 16, wordSpacing: 2, color: Colors.white, fontWeight: FontWeight.w400),
                                    ),
                            
                              const SizedBox(height: 10),
                            
                              currentSlide == 0? GestureDetector(
                                onTap: handleSessionStarted,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: started? CircularProgressIndicator(color: Colors.white, strokeWidth: 2.0,):  Icon(Icons.arrow_forward, color: Colors.white, size: 20,),
                                ),
                              ): const SizedBox(), 
                            ],
                                                  ),
                            ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                currentSlide > 0? Expanded(flex: 1, child: 
                // Container(color: Colors.amberAccent,)
                Column(
                  children: [

                  const SizedBox(height: 12),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(width: makeAvailable? 50: 25),

                    Text("A", style: GoogleFonts.poppins(fontSize: 18, color: currentSlide == 1? Colors.amberAccent: Colors.white, fontWeight: FontWeight.normal),),
                    const SizedBox(width: 12),
                    Text("S", style: GoogleFonts.poppins(fontSize: 18, color: currentSlide == 2? Colors.amberAccent:  Colors.white, fontWeight: FontWeight.normal),),
                    const SizedBox(width: 12),
                    Text("P", style: GoogleFonts.poppins(fontSize: 18, color: currentSlide == 3? Colors.amberAccent : Colors.white, fontWeight: FontWeight.normal),),
                    const SizedBox(width: 12),
                    Text("E", style: GoogleFonts.poppins(fontSize: 18, color: currentSlide == 4? Colors.amberAccent: Colors.white, fontWeight: FontWeight.normal),),
                    const SizedBox(width: 12),
                    Text("C", style: GoogleFonts.poppins(fontSize: 18, color: currentSlide == 5? Colors.amberAccent: Colors.white, fontWeight: FontWeight.normal),),
                    const SizedBox(width: 12),
                    Text("T", style: GoogleFonts.poppins(fontSize: 18, color: currentSlide == 6? Colors.amberAccent: Colors.white, fontWeight: FontWeight.normal),),

                    const SizedBox(width: 25),

                    GestureDetector(
                      onTap: handleChangeSlide,
                      child: makeAvailable? Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: makeAvailable? Border.all(color: Colors.white): Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: makeAvailable? loading? CircularProgressIndicator(color: Colors.white, strokeWidth: 2.0,):  Icon(Icons.arrow_forward, color: Colors.white, size: 20,): const SizedBox(),
                        ): const SizedBox(),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(headersforBibleStudy[currentSlide-1], style: GoogleFonts.poppins(fontSize: 18, decoration: TextDecoration.underline, color: Colors.white, fontWeight: FontWeight.w600),),

                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Text(messages[index]["message"], textAlign: messages[index]["sender"] == "user"? TextAlign.left: TextAlign.right, style: GoogleFonts.poppins(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),);
                    },
                  ),
                ),

                TextField(
                  controller: message,
                  decoration: InputDecoration(
                    hintText: "Type your thoughts here...",
                    hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    suffixIcon: IconButton(onPressed: handleSendMessage, icon: Icon(Icons.send, color: Colors.white, size: 20,)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
                )
                  ],
                )
                ): const SizedBox(),
                  
              ],
            ),

            currentSlide == 0? AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: started? 0.0: 1.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.fastOutSlowIn,
                height: started? MediaQuery.of(context).size.height * 0.5: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 31, 31, 31),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                alignment: Alignment.center,
                child: SizedBox(
                          height: started? MediaQuery.of(context).size.height * 0.7: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              Text("Bible Study", style: GoogleFonts.poppins(fontSize: 12, color: const Color.fromARGB(236, 255, 255, 255), fontWeight: FontWeight.w600),),
                              const SizedBox(height: 8),
                              Text("The Parable of the Sower", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),),
                              const SizedBox(height: 6),
                              Text("Matthew 13:3-9", style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),),  
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                          Text(
                                          "Then he told them many things in parables, saying: “A farmer went out to sow his seed. Then he told them many things in parables, saying: “A farmer went out to sow his seed. Then he told them many things in parables, saying: “A farmer went out to sow his seed. 4 As he was scattering the seed, some fell along the path, and the birds came and ate it up. 5 Some fell on rocky places, where it did not have much soil. It sprang up quickly, because the soil was shallow. 6 But when the sun came up, the plants were scorched, and they withered because they had no root. 7 Other seed fell among thorns, which grew up and choked the plants. 8 Still other seed fell on good soil, where it produced a crop—a hundred, sixty or thirty times what was sown. 9 Whoever has ears, let them hear.",
                                          style: GoogleFonts.poppins(fontSize: 16, wordSpacing: 2, color: Colors.white, fontWeight: FontWeight.w400),
                                        ),
                                
                                ],
                                ),
                                ),
                                  ),
                              ),
                                  const SizedBox(height: 15),
                                
                                  currentSlide == 0? GestureDetector(
                                    onTap: handleSessionStarted,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: started? CircularProgressIndicator(color: Colors.white, strokeWidth: 2.0,):  Icon(Icons.arrow_forward, color: Colors.white, size: 20,),
                                    ),
                                  ): const SizedBox(), 
                            ],
                          ),),
              ),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
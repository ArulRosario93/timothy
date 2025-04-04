import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/pages/ChatPage/chat_page.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key});

  @override
  Widget build(BuildContext context) {

    void handleClick(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
    }

    return GestureDetector(
      onTap: handleClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,   
          borderRadius: BorderRadius.circular(12)     
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://www.itstactical.com/wp-content/uploads/2013/07/night-sky-jeff-m-1024.png"))
              ),
            ),
            const SizedBox(width: 12,),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ARUL ROSARIO", style: GoogleFonts.poppins(fontWeight: FontWeight.w600 ,fontSize: 14 ),),
                  Text("HIIII...", style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),)
                ],
              ),
            ),
            Text("2 hours", style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),)
          ],
        ),
      ),
    );
  }
}

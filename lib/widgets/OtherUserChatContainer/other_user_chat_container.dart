
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherUserChatContainer extends StatelessWidget {
  final Map data;
  final Map theme;
  const OtherUserChatContainer({super.key, required this.data, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 35,
          height: 35,
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(  
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
            minWidth: 50,
          ),
          decoration: BoxDecoration(
            color: theme["backgroundColor"],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16), // Space for timestamp
                child: Text(
                  data["msg"],
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: theme["textColor"],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Text(
                  "19:27",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
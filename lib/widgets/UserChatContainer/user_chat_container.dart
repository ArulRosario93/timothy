import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserChatContainer extends StatelessWidget {
  final Map data;
  final Map theme;
  const UserChatContainer({super.key, required this.data, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
            minWidth: 50,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: theme["backgroundColor"],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16), // Space for timestamp
                child: Text(
                  data["msg"],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: theme["textColor"],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text(
                  "19:27",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
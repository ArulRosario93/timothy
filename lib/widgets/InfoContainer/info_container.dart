import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/Utils/utils.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(157, 0, 0, 0),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Icon(Icons.email, size: 14,),
              const SizedBox(width: 5,),
              Text("Email", style: GoogleFonts.poppins(color: secondaryColor, fontSize: 12),)
            ],
          ),
          Spacer(),
          Text("itsarrowhere380@gmail.com", style: GoogleFonts.poppins(fontSize: 12, color: ternaryColor),)
        ],
      ),
    );
  }
}
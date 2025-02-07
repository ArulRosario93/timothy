import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() handleClick;
  const PrimaryButton({super.key, required this.text, required this.handleClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleClick,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 160, 238, 76)
        ),
        padding: EdgeInsets.all(18),
        alignment: Alignment.center,
        child: Text(text, style: GoogleFonts.poppins(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),),
      ),
    );
  }
}


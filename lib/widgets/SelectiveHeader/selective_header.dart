import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectiveHeader extends StatelessWidget {
  const SelectiveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 214, 214, 214),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1, 
            child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 1,
                    spreadRadius: 3,
                    // blurStyle: BlurStyl,
                  )
                ],
                borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.connected_tv, size: 14,),
                  const SizedBox(width: 5,),
                  Text("Messages", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12),),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1, 
            child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black12,
                //     offset: Offset(0, 0),
                //     blurRadius: 1,
                //     spreadRadius: 3,
                //     // blurStyle: BlurStyl,
                //   )
                // ],
                borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.connected_tv, size: 14,),
                  const SizedBox(width: 5,),
                  Text("Request", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
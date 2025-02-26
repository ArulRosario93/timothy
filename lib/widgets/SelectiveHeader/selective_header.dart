import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectiveHeader extends StatelessWidget {
  final int currentIndex;
  final Function(int) handlePageChange;
  const SelectiveHeader({super.key, required this.currentIndex, required this.handlePageChange});

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
            child: GestureDetector(
              onTap: () => handlePageChange(0),
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: currentIndex == 0? Colors.white: const Color.fromARGB(255, 214, 214, 214),
                  boxShadow: [
                    currentIndex == 0? BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 3,
                      // blurStyle: BlurStyl,
                    ): BoxShadow(),
                  ],
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.connected_tv, size: 14,),
                    const SizedBox(width: 5,),
                    Text("Messages", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12, color: currentIndex == 0? Colors.black :Colors.black87),),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1, 
            child: GestureDetector(
              onTap: () => handlePageChange(1),
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: currentIndex == 1? Colors.white :  const Color.fromARGB(255, 214, 214, 214),
                  boxShadow: [
                    currentIndex == 1? BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 3,
                      // blurStyle: BlurStyl,
                    ): BoxShadow(),
                  ],
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.connected_tv, size: 14,),
                    const SizedBox(width: 5,),
                    Text("Request", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: currentIndex == 1? Colors.black : Colors.black87 ),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
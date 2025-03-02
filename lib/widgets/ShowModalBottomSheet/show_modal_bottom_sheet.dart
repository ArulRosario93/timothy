import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:timothy/widgets/Slidable/slidable.dart";

Future<void> bottomSheetForMessage({required BuildContext context, required Map data, required Function(List msgs) handleAddMsg}){

  bool seleted = false;

  handleChange() {
    seleted = !seleted;
  }

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: const  Color.fromARGB(255, 31, 31, 31),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                data["title"],
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10), // Add spacing for better UI
              Expanded(
                child: SlidableWidget(data: data, seleted: seleted, handleAddMsg: handleAddMsg)
              ),
            ],
          ),
        ),
      );
    }
  );
}
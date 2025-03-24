import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/widgets/Slidable/slidable.dart';

class WidgetForBottomModalSheet extends StatelessWidget {

  final Map data;
  final bool seleted;
  final String type;
  final Function(List msgs) handleAddMsg;

  const WidgetForBottomModalSheet({super.key, required this.data, required this.seleted, required this.type, required this.handleAddMsg});

  @override
  Widget build(BuildContext context) {
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
                child: SlidableWidget(data: data, seleted: seleted, handleAddMsg: handleAddMsg, type: type,)
              ),
            ],
          ),
        ),
      );
  }
}

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_slidable/flutter_slidable.dart';
import "package:timothy/widgets/BibleStudySession/bible_study_session.dart";

class SlidableComponentForBibleStudy extends StatefulWidget {
  final Map data;
  final int index;
  final bool isSelected;
  final Function(int, SlidableController) handleClick;

  const SlidableComponentForBibleStudy({
    super.key,
    required this.data,
    required this.index,
    required this.isSelected,
    required this.handleClick,
  });

  @override
  _SlidableComponentStateForBibleStudy createState() => _SlidableComponentStateForBibleStudy();
}

class _SlidableComponentStateForBibleStudy extends State<SlidableComponentForBibleStudy> with TickerProviderStateMixin {
  late SlidableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SlidableController(this);
  }

  @override
  void didUpdateWidget(covariant SlidableComponentForBibleStudy oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isSelected) {
      _controller.close(); // Close if not selected
    } else {
      _controller.openEndActionPane(); // Open if selected
    }
  }

  void handleClick() async {
    
    
    _controller.close(); // Close the slidable
    // Navigate to bible study screen
    
    Future.delayed(const Duration(seconds: 1), () { // Delay to ensure the slidable is closed before navigating
    Navigator.push(context, MaterialPageRoute(builder: (context) => BibleStudySession())); // Assuming you have a BibleStudyScreen widget to navigate to
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose(); // Dispose of the controller
    // This is important to prevent memory leaks
    // and ensure that the controller is properly cleaned up.

  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.index),
      controller: _controller, // Each item gets its own controller
      endActionPane: ActionPane(
        extentRatio: 0.3, // Fixed ratio for smooth animation
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => handleClick(),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            borderRadius: BorderRadius.circular(10),
            label: 'Start',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => widget.handleClick(widget.index, _controller),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          decoration: BoxDecoration(
            color: widget.isSelected ? const Color.fromARGB(108, 55, 71, 79) : Colors.transparent, // Highlight selected item
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "title",
                child: Text(
                  widget.data["data"][widget.index]["verse"],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                widget.data["data"][widget.index]["reference"] ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
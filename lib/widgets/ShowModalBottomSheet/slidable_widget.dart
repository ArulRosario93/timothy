import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableComponent extends StatefulWidget {
  final Map data;
  final int index;
  final Function(int, SlidableController) handleClick;
  final Function(List msgs) handleSubmitMsg;
  final bool isSelected;

  const SlidableComponent({
    super.key,
    required this.data,
    required this.index,
    required this.handleClick,
    required this.isSelected,
    required this.handleSubmitMsg,
  });

  @override
  _SlidableComponentState createState() => _SlidableComponentState();
}

class _SlidableComponentState extends State<SlidableComponent> with TickerProviderStateMixin {
  late SlidableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SlidableController(this);
  }

  @override
  void didUpdateWidget(covariant SlidableComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isSelected) {
      _controller.close(); // Close if not selected
    } else {
      _controller.openEndActionPane(); // Open if selected
    }
  }

  void handleClick() {
    widget.handleSubmitMsg([
      widget.data["data"][widget.index]["verse"],
      widget.data["data"][widget.index]["reference"],
    ]);

    _controller.close(); // Close the slidable
    Navigator.pop(context); // Close the bottom sheet after sending
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
            label: 'Send',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => widget.handleClick(widget.index, _controller),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          decoration: BoxDecoration(
            color: widget.isSelected ? const Color.fromARGB(108, 55, 71, 79) : Colors.transparent, // Highlight selected item
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data["data"][widget.index]["verse"],
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 5),
                alignment: Alignment.centerRight,
                child: Text(
                  widget.data["data"][widget.index]["reference"],
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

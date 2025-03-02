import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timothy/widgets/ShowModalBottomSheet/slidable_widget.dart';

class SlidableWidget extends StatefulWidget {
  final Map data;
  final bool seleted; // Track whether the item is selected
  final Function(List msgs) handleAddMsg; // Callback to handle message submission
  const SlidableWidget({super.key, required this.data, required this.seleted, required this.handleAddMsg});

  @override
  State<SlidableWidget> createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget> {
  int selectedIndex = -1; // Track which item is selected
  SlidableController? activeController; // Store the currently active controller

  void handleClick(int index, SlidableController slidableController) {
    setState(() {
      if (selectedIndex == index) {
        slidableController.close(); // Close if already selected
        selectedIndex = -1;
        activeController = null;
      } else {
        activeController?.close(); // Close the previously active slidable
        selectedIndex = index;
        activeController = slidableController;
        slidableController.openEndActionPane(); // Open slide action
      }
    });
  }

  void handleSubmitMsg(List msgs) {
    widget.handleAddMsg(msgs);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data["data"].length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return SlidableComponent(
          data: widget.data,
          index: index,
          handleClick: handleClick,
          isSelected: selectedIndex == index,
          handleSubmitMsg: handleSubmitMsg
        );
      },
    );
  }
}

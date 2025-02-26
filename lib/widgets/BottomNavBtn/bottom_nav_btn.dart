import 'package:flutter/material.dart';

class BottomNavBtn extends StatelessWidget {
  final int selectedpage;
  final int selectedPageIndex;
  final Icon icon;
  const BottomNavBtn({super.key, required this.selectedpage, required this.selectedPageIndex, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container( decoration: BoxDecoration(
      color: selectedpage == selectedPageIndex? Colors.lightGreenAccent: Colors.transparent,
      borderRadius: BorderRadius.circular(50),
    ), alignment: Alignment.center, child: icon);
  }
}
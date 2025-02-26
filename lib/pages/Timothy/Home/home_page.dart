import 'package:flutter/material.dart';
import 'package:timothy/pages/Timothy/Home/Individual/individual.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  
    final PageController pageController = PageController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        pageSnapping: true,
        children: [
          Individual(),
          Individual(),
          Individual(),
        ]
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:timothy/pages/Timothy/Home/Individual/individual.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        Individual(),
        Individual(),
        Individual(),
      ]
    );
  }
}
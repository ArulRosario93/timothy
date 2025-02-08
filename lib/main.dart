import 'package:flutter/material.dart';
import 'package:timothy/pages/Timothy/timothy.dart';

void main() {
  runApp(const Timothy());
}

class Timothy extends StatelessWidget {
  const Timothy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimothyApp(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:timothy/pages/SignUp/sign_up_page.dart';

void main() {
  runApp(const Timothy());
}

class Timothy extends StatelessWidget {
  const Timothy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
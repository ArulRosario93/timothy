import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(flex: 1, child: Container(color: Colors.red,),),
          Flexible(flex: 3, child: Container(color: Colors.blue,),),
          Flexible(flex: 1, child: Container(color: Colors.red,),)
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Individual extends StatefulWidget {
  const Individual({super.key});

  @override
  State<Individual> createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {

  // initial setup for animation
  double _height = 0;

  void startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500), () => {
      setState(() {
        _height = MediaQuery.of(context).size.height * .5;
      })
    });
  }

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .5,
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            height: _height,
            curve: Curves.easeIn,
            alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage("https://c02.purpledshub.com/uploads/sites/48/2023/07/GettyImages-1388003181-917636f.jpg?w=1029&webp=1"))
              ),
            child: Text("Holaa"), 
          ),
        ),
      ],
    );
  }
}
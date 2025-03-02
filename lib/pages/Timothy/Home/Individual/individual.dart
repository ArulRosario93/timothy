import 'package:flutter/material.dart';
import 'package:timothy/pages/OtherUser/UserProfile/user_profile.dart';

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
        _height = MediaQuery.of(context).size.height * .6;
      })
    });
  }

  void navigateToProfile() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => UserProfile(),
    ));
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
        GestureDetector(
          onTap: navigateToProfile,
          child: Hero(
              tag: "profile-image",
              transitionOnUserGestures: true,
              child: Container(
                height: MediaQuery.of(context).size.height * .6,
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
                        image: NetworkImage("https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"))
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/pages/OtherUser/UserProfile/user_profile.dart';

class Individual extends StatefulWidget {
  const Individual({super.key});

  @override
  State<Individual> createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {

  // initial setup for animation
  double _height = 0;
  double _heightForText = 0;

  void startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500), () => {
      setState(() {
        _height = MediaQuery.of(context).size.height * .6;
      })
    });
    await Future.delayed(Duration(milliseconds: 600), () => {
      setState(() {
        _heightForText = MediaQuery.of(context).size.height * .6;
      })
    });
  }

  void startAnimationForWords() async {
  }

  void navigateToProfile() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => UserProfile(),
    ));
  }


  // when the this widget is rendered in screen the animation will start

  @override
  void initState() {
    super.initState();
    startAnimation();
    startAnimationForWords();
  }

  @override
  void dispose() {
    super.dispose();
    _height = 0;
    _heightForText = 0;
    // dispose the animation
  }

  @override
  Widget build(BuildContext context) {    
    return GestureDetector(
      onTap: navigateToProfile,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .6,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height * .6,
                child: Hero(
                  tag: "profile-image",
                  transitionOnUserGestures: true,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      const Color.fromARGB(116, 0, 0, 0),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Arul Rosario", textAlign: TextAlign.left, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 25),),
                        Text("Software Engineer", textAlign: TextAlign.right, style: GoogleFonts.poppins(fontWeight: FontWeight.w400, color: Colors.white),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded, color: Colors.white, size: 20,),
                        SizedBox(width: 5,),
                        Text("Miami", textAlign: TextAlign.right, style: GoogleFonts.poppins(fontWeight: FontWeight.w400, color: Colors.white),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
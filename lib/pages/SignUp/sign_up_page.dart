import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/widgets/PrimaryButton/primary_button.dart';
import '../../widgets/TextField/text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController fullName = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();

    void handleClick(){
      print("HOLA THERE");
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white ,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1, 
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.deepPurple,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Register", textAlign: TextAlign.left, style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w500, color: Colors.white),),
                       
                        const SizedBox(height: 8,),

                        Text("Create your account", textAlign: TextAlign.left, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),)
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
          Flexible(
            flex: 3, 
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    InputField(controller: fullName, label: "Full Name", obscure: false),
                    InputField(controller: email, label: "Email", obscure: false),
                    InputField(controller: password, label: "Password", obscure: true),
                    InputField(controller: confirmPassword, label: "Confirm Password", obscure: true),
              
                    const SizedBox(height: 2,),
              
                    PrimaryButton(text: "Register", handleClick: handleClick),
              
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I have an account?", style: GoogleFonts.poppins(fontSize: 12),),
                        const SizedBox(width: 5,),
                        Text("Log in", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 160, 238, 76)),)
                      ],
                    )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
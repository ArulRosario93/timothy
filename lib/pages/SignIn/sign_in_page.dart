import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/widgets/PrimaryButton/primary_button.dart';
import 'package:timothy/widgets/TextField/text_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    void handleClick() {
      print("CLICKed");
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1, 
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 43, 43, 43)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back!", style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white),),
                  Text("Sign in to your Account", style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),),
                ],
              ),
            ),
          ),
          
          Flexible(
            flex: 3, 
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
                    InputField(controller: email, label: "Email", obscure: false),
                    
                    const SizedBox(height: 10,),

                    InputField(controller: password, label: "Password", obscure: true),
              
                    const SizedBox(height: 20,),

                    PrimaryButton(text: "Login", handleClick: handleClick),
              
                    Expanded(child: const SizedBox(),),
              
                    const SizedBox(height: 20,),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: GoogleFonts.poppins(fontSize: 12),),
                        const SizedBox(width: 5,),
                        Text("Register", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 160, 238, 76)),)
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
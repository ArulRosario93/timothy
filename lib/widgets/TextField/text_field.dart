import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool obscure;
  const InputField({super.key, required this.controller, required this.label, required this.obscure});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  bool showpassword = true;

  @override
  void initState() {
    super.initState();

    setState(() {
      showpassword = widget.obscure;
    });
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    void showPassword(){
      setState(() {
        showpassword = !showpassword;
      });
    }

    return TextFormField(
      controller: widget.controller,
      obscureText: showpassword,
      decoration: InputDecoration(
        labelText: widget.label,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        labelStyle: GoogleFonts.poppins(color: Colors.blueGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        suffixIcon: widget.obscure? IconButton(onPressed: showPassword, icon: showpassword? Icon(Icons.visibility_off) : Icon(Icons.visibility)): null,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/widgets/MessageContainer/message_container.dart';
import 'package:timothy/widgets/SelectiveHeader/selective_header.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("CONNECT", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),

              const SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25,),
                child: SelectiveHeader(),
              )
            ],
          ),
          
          const SizedBox(height: 20,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                    MessageContainer(),
                    const SizedBox(height: 10,),
                    MessageContainer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
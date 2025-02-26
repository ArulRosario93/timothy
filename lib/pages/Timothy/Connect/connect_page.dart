import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timothy/pages/Timothy/Connect/Message%20Page/message_page.dart';
import 'package:timothy/pages/Timothy/Connect/Request%20Page/request_page.dart';
import 'package:timothy/widgets/SelectiveHeader/selective_header.dart';


class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {

  int currentIndex = 0;

  void handlePageChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 40,),

        Text("CONNECT", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),

        const SizedBox(height: 10,),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25,),
          child: SelectiveHeader(currentIndex: currentIndex, handlePageChange: handlePageChange),
        ),

        const SizedBox(height: 20,),

        Expanded(
          child: PageView(
            onPageChanged: handlePageChange,
            children: [
              MessagePage(),
              RequestPage(),
            ],
          ),
        )
      ],
    );
  }
}
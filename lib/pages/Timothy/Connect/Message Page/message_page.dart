import 'package:flutter/material.dart';
import 'package:timothy/widgets/MessageContainer/message_container.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
            MessageContainer(),
            const SizedBox(height: 10,),
            MessageContainer(),
        ],
      ),
    );
  }
}
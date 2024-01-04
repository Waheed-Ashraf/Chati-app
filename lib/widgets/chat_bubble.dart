import 'package:chati_app/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 5, left: 16, right: 30),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: ColorPallet.mainColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Text('Hello world '),
      ),
    );
  }
}

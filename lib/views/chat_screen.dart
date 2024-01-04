import 'package:chati_app/constants.dart';
import 'package:chati_app/widgets/chat_bubble.dart';
import 'package:chati_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  'assets/images/chat.png',
                  fit: BoxFit.contain,
                )),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Chati App',
              style: TextStyle(fontFamily: 'RubikDoodleShadow'),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView(
                children: [
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                  ChatBubble(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomTextField(
                onchange: (value) {},
                obscure: false,
                suffix: Icon(
                  Icons.send,
                  color: ColorPallet.mainColor,
                )),
          ),
        ],
      ),
    );
  }
}

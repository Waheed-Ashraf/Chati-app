import 'package:chati_app/constants.dart';
import 'package:chati_app/models/massag-model.dart';
import 'package:chati_app/widgets/chat_bubble.dart';
import 'package:chati_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final controller = ScrollController();
  final TextEditingController _textController = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('created at', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromjson(snapshot.data!.docs[i]));
          }
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
                    ),
                  ),
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
                    child: ListView.builder(
                      reverse: true,
                      controller: controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return ChatBubble(message: messagesList[index]);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomTextField(
                    onSubmitted: (value) {
                      messages.add({
                        'message': value,
                        'created at': DateTime.now(),
                      });
                      _textController.clear();
                      controller.animateTo(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    obscure: false,
                    suffix: const Icon(
                      Icons.send,
                      color: ColorPallet.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text('Loading ....'),
            ),
          );
        }
      },
    );
  }
}

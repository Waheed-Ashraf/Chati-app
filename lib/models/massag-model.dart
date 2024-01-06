import 'dart:convert';

class Message {
  String message;
  Message(this.message);
  factory Message.fromjson(jsonData) {
    return Message(jsonData['message']);
  }
}

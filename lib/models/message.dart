import 'package:chat_project_test2/constant.dart';

class Message {
  final String message;
  final String id;
  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kmessage], jsonData['id']);
  }
}

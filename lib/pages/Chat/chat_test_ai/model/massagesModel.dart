import 'package:chat_project_test2/constant.dart';

class MessageModel {
  final String message;
  final String id;
  MessageModel(this.message, this.id);

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(jsonData[kmessage], jsonData['id']);
  }
}

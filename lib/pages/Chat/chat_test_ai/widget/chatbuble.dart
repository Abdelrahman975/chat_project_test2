import 'package:chat_project_test2/constant.dart';
import 'package:flutter/material.dart';

class ChatBuble1 extends StatelessWidget {
  final String sender;
  final String message;

  const ChatBuble1({
    Key? key,
    required this.sender,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          sender == 'User' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: sender == 'User' ? KprimaryColor2 : KprimaryColor3,
          borderRadius: sender == 'User'
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: sender == 'User' ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}

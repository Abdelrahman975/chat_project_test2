import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../home/drawer/drawer_screen.dart';

class Ai_ChatBot extends StatelessWidget {
  static String id = 'AI ChatBot';
  const Ai_ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer_widget(),
      appBar: AppBar(
        backgroundColor: KprimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/AI_Chatbot.png',
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Chat Bot',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_project_test2/constant.dart';
import 'package:chat_project_test2/pages/Chat/chat_test_ai/widget/chatbuble.dart';
import 'package:chat_project_test2/pages/home/drawer/drawer_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String apiUrl = "https://5f3a-156-217-41-223.ngrok-free.app/generate";

  Future<Map<String, dynamic>> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"Data": message},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Failed to connect to API: $e");
    }
  }
}

class ChatAiTest extends StatefulWidget {
  const ChatAiTest({super.key});
  static String id = 'AI ChatBot Test';

  @override
  State<ChatAiTest> createState() => _ChatAIPageState();
}

class _ChatAIPageState extends State<ChatAiTest> {
  final TextEditingController controller = TextEditingController();
  final ApiService apiService = ApiService();
  final List<Map<String, dynamic>> messages = [];
  bool isLoading = false;
  late String userEmail;

  @override
  void initState() {
    super.initState();
    _getCurrentUserEmail();
  }

  void _getCurrentUserEmail() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email!;
      });
    }
  }

  CollectionReference get chatMessages => FirebaseFirestore.instance
      .collection('messages')
      .doc(userEmail)
      .collection('chat');

  Future<void> getData(String message) async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await apiService.sendMessage(message);
      final aiMessage = response['generated_text'];
      final timestamp = DateTime.now();

      setState(() {
        messages.add({
          'sender': 'AI',
          'message': aiMessage,
          'timestamp': timestamp,
        });
        isLoading = false;
      });

      chatMessages.add({
        'sender': 'AI',
        'message': aiMessage,
        'timestamp': timestamp,
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error: $e");
    }
  }

  void _sendMessage(String data) {
    final timestamp = DateTime.now();
    setState(() {
      messages.add({'sender': 'User', 'message': data, 'timestamp': timestamp});
    });

    chatMessages
        .add({'sender': 'User', 'message': data, 'timestamp': timestamp});
    getData(data);
    controller.clear();
  }

  Future<void> _deleteChat() async {
    try {
      final batch = FirebaseFirestore.instance.batch();
      final chatDocs = await chatMessages.get();
      for (var doc in chatDocs.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
      setState(() {
        messages.clear();
      });
    } catch (e) {
      print("Error deleting chat: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer_widget(),
      appBar: AppBar(
        backgroundColor: KprimaryColor2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/AI_Chatbot.png',
              height: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'AI Chat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            // onPressed: _deleteChat,
            onPressed: () async {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                headerAnimationLoop: false,
                animType: AnimType.bottomSlide,
                title: 'Delet Chat',
                desc: 'Are you sure to delet chat ?',
                buttonsTextStyle: const TextStyle(color: Colors.black54),
                showCloseIcon: true,
                btnCancelOnPress: () {},
                btnOkOnPress: _deleteChat,
              ).show();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: chatMessages
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final chatDocs = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (context, index) {
                    final chatData = chatDocs[index];
                    return ChatBuble1(
                      sender: chatData['sender'] ?? '',
                      message: chatData['message'] ?? '',
                    );
                  },
                );
              },
            ),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                _sendMessage(data);
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: IconButton(
                  onPressed: () {
                    _sendMessage(controller.text);
                  },
                  icon: const Icon(
                    Icons.send,
                    color: KprimaryColor2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: KprimaryColor2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

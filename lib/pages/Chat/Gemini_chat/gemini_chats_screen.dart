// ignore_for_file: invalid_use_of_visible_for_testing_member, unnecessary_import, depend_on_referenced_packages, avoid_print

import "dart:convert";
import "dart:io";

import "package:chat_project_test2/pages/Chat/Gemini_chat/api_key.dart";
import "package:chat_project_test2/pages/Chat/Gemini_chat/chat_model.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

import 'package:http/http.dart' as http;
import "package:image_picker/image_picker.dart";

import "../../../constant.dart";
import "../../home/drawer/drawer_screen.dart";

class GeminiChatScreen extends StatefulWidget {
  static String id = 'Gemini Chat';
  const GeminiChatScreen({super.key});

  @override
  State<GeminiChatScreen> createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  List<ChatModel> chatList = [];
  final TextEditingController controller = TextEditingController();
  File? image;

  void onSendMessage() async {
    late ChatModel model;

    if (image == null) {
      model = ChatModel(isMe: true, message: controller.text);
    } else {
      final imageBytes = await image!.readAsBytes();

      String base64EncodedImage = base64Encode(imageBytes);

      model = ChatModel(
        isMe: true,
        message: controller.text,
        base64EncodedImage: base64EncodedImage,
      );
    }

    chatList.insert(0, model);

    setState(() {});

    final geminiModel = await sendRequestToGemini(model);

    chatList.insert(0, geminiModel);
    setState(() {});
    controller.clear();
  }

  void selectImage() async {
    final picker = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (picker != null) {
      image = File(picker.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer_widget(),
      appBar: AppBar(
        backgroundColor: KprimaryColor2,
        title: const Text("Gemini ChatBot"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView.builder(
              reverse: true,
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    if (!chatList[index].isMe) ...[
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                              bottom: 10,
                              right: 15,
                              left: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Gemini",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (chatList[index].base64EncodedImage != null)
                                  Image.memory(
                                    base64Decode(
                                        chatList[index].base64EncodedImage!),
                                    height: 300,
                                    width: 200,
                                  ),
                                Text(chatList[index].message),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    if (chatList[index].isMe) ...[
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                              bottom: 10,
                              left: 15,
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Me",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (chatList[index].base64EncodedImage != null)
                                  Image.memory(
                                    base64Decode(
                                        chatList[index].base64EncodedImage!),
                                    height: 300,
                                    width: 200,
                                  ),
                                Text(chatList[index].message),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: KprimaryColor2,
            height: 80,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          selectImage();
                        },
                        icon: const Icon(Icons.upload_file),
                      ),
                      hintText: "Message",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onSendMessage();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // )
        ],
      ),
    );
  }

  Future<ChatModel> sendRequestToGemini(ChatModel model) async {
    String url = "";
    Map<String, dynamic> body = {};

    if (model.base64EncodedImage == null) {
      url =
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${GeminiApiKey.api_key}";

      body = {
        "contents": [
          {
            "parts": [
              {"text": model.message},
            ],
          },
        ],
      };
    } else {
      url =
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro-vision:generateContent?key=${GeminiApiKey.api_key}";

      body = {
        "contents": [
          {
            "parts": [
              {"text": model.message},
              {
                "inline_data": {
                  "mime_type": "image/jpeg",
                  "data": model.base64EncodedImage,
                }
              }
            ],
          },
        ],
      };
    }

    Uri uri = Uri.parse(url);

    final result = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );

    print(result.statusCode);
    print(result.body);

    final decodedJson = json.decode(result.body);

    String message =
        decodedJson['candidates'][0]['content']['parts'][0]['text'];

    ChatModel geminiModel = ChatModel(isMe: false, message: message);

    return geminiModel;
  }
}

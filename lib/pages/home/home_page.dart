import 'package:chat_project_test2/models/services_category_model.dart';
import 'package:chat_project_test2/pages/Remider_test/reminder_page.dart';

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../Chat/Chat_AI_Genret/AI_chatbot.dart';
import '../Chat/Gemini_chat/gemini_chats_screen.dart';
import '../NewaTest1/screens/News_page.dart';

import 'widget/services_home_wedget.dart';
import '../All Doctor/All_Doctor_pages/all_doctors_list_views_builder.dart';
// import '../Reminder_Notifcations/reminder_page1.dart';
import '../mri.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KprimaryColor4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 4,
                type: MaterialType.card,
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, News_page.id);
                  },
                  child: Container(
                    height: 160,
                    width: 360,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/mask-group-BTj.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Services',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    ServicesWidgets(
                      category: ServicesCategoryModel(
                          image: 'assets/images/AI_Chatbot.png',
                          categoryName: 'AI Chatbot',
                          categoryNamePage: Ai_ChatBot.id),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    ServicesWidgets(
                      category: ServicesCategoryModel(
                          image: 'assets/images/Reminder.png',
                          categoryName: 'Reminder',
                          categoryNamePage: ReminderPageTest.id),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    ServicesWidgets(
                      category: ServicesCategoryModel(
                          image: 'assets/images/chatbot.png',
                          categoryName: 'Chatbot',
                          categoryNamePage: GeminiChatScreen.id),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ServicesWidgets(
                      category: ServicesCategoryModel(
                          image: 'assets/images/Alzaheime MRI.png',
                          categoryName: 'Alzaheime MRI',
                          categoryNamePage: MRI_Page.id),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    ServicesWidgets(
                      category: ServicesCategoryModel(
                          image: 'assets/images/All_Doctors.jpg',
                          categoryName: ' Doctors',
                          categoryNamePage: AllDoctorsViewBuilder.id),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

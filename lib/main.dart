import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/All Doctor/Book_Now_pages/book_now_page.dart';
import 'pages/All Doctor/Proceed_pages_1/proceed_page.dart';
import 'pages/All Doctor/about_doctor_pages/about_doctor_page.dart';
import 'pages/All Doctor/All_Doctor_pages/all_doctors_list_views_builder.dart';
import 'pages/All_Hospitals/all_hospitals_pages.dart';
import 'pages/Chat/Chat_AI_Genret/AI_chatbot.dart';
import 'pages/Chat/Gemini_chat/gemini_chats_screen.dart';
import 'pages/NewaTest1/screens/News_page.dart';
import 'pages/Reminder/reminder_page1.dart';
import 'pages/animated_splash_page.dart';
import 'pages/Chat/test_chat/chat_page.dart';
import 'pages/Auth/login_page.dart';
import 'pages/mri.dart';
import 'pages/notifications_screen.dart';
import 'pages/Auth/register_page.dart';
import 'pages/Reminder/reminder_page.dart';
import 'pages/home/home_view.dart';
import 'pages/test/AwesomedialogTest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '=================================================User is currently signed out!');
      } else {
        print('===========================================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //The First page
        AnimatedSplashPage.id: (context) => AnimatedSplashPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        // Home
        HomeView.id: (context) => HomeView(),
        // Services Pages
        ReminderPage.id: (context) => ReminderPage(),
        Reminder_page1.id: (context) => Reminder_page1(),

        News_page.id: (context) => News_page(),

        ChatPage.id: (context) => ChatPage(),

        Ai_ChatBot.id: (context) => Ai_ChatBot(),

        GeminiChatScreen.id: (context) => GeminiChatScreen(),

        AllHospitalsPage.id: (context) => AllHospitalsPage(),

        MRI_Page.id: (context) => MRI_Page(),

        Notifications.id: (context) => Notifications(),

        AllDoctorsViewBuilder.id: (context) => AllDoctorsViewBuilder(),
        AbuotDoctorPage.id: (context) => AbuotDoctorPage(),
        Book_Now_page.id: (context) => Book_Now_page(),
        Proceed_page.id: (context) => Proceed_page(),

        //test pages
        AweSomeDialogTest.id: (context) => AweSomeDialogTest(),
      },
      initialRoute: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? HomeView.id
          : AnimatedSplashPage.id,
    );
  }
}

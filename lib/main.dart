// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:chat_project_test2/pages/Chat/chat_test_ai/chat_screen.dart';
import 'package:chat_project_test2/pages/NewaTest1/screens/News_page.dart';
import 'package:chat_project_test2/pages/Remider_test/pages/reminderPageTestScreen.dart';
import 'package:chat_project_test2/pages/Remider_test/reminder_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'firebase_options.dart';

import 'pages/All Doctor/All_Doctor_pages/all_doctors_list_views_builder.dart';

import 'pages/Auth/Profile/porfileTastPage.dart';
import 'pages/Chat/Gemini_chat/gemini_chats_screen.dart';

import 'pages/Remider_test/Reminder_Notifcations_test/services/local_notification_service.dart';
import 'pages/Remider_test/Reminder_Notifcations_test/services/work_manager_service.dart';
import 'pages/animated_splash_page.dart';
import 'pages/Auth/login_page.dart';
import 'pages/MRI/mri.dart';
import 'pages/notifications_screen.dart';
import 'pages/Auth/register_page.dart';

import 'pages/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Future.wait([
    LocalNotificationService.init(),
    WorkManagerService().init(),
  ]);
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
      routes: <String, WidgetBuilder>{
        //The First page
        AnimatedSplashPage.id: (context) => AnimatedSplashPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),

        ProfileTastPage.id: (context) => ProfileTastPage(),

        // Home
        HomeView.id: (context) => HomeView(),
        // Services Pages

        // Reminder_page1.id: (context) => Reminder_page1(),
        ReminderPageTest.id: (context) => ReminderPageTest(),
        ReminderPageTestScreen.id: (context) => ReminderPageTestScreen(),

        NewsPage.id: (context) => NewsPage(),

        ChatAiTest.id: (context) => ChatAiTest(),

        GeminiChatScreen.id: (context) => GeminiChatScreen(),

        MRI_Page.id: (context) => MRI_Page(),

        Notifications.id: (context) => Notifications(),

        AllDoctorsViewBuilder.id: (context) => AllDoctorsViewBuilder(),

        //test pages
      },
      initialRoute: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? HomeView.id
          : AnimatedSplashPage.id,
    );
  }
}

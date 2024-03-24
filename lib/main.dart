import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pages/All Doctor/Book_Now_pages/book_now_page.dart';
import 'pages/All Doctor/Proceed_pages_1/proceed_page.dart';
import 'pages/All Doctor/about_doctor_pages/about_doctor_page.dart';
import 'pages/All Doctor/All_Doctor_pages/all_doctors_list_views_builder.dart';
import 'pages/All_Hospitals/all_hospitals_pages.dart';
import 'pages/Reminder/reminder_page1.dart';
import 'pages/animated_splash_page.dart';
import 'pages/chat_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/reminder_page.dart';
import 'pages/home/home_view.dart';

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

        ChatPage.id: (context) => ChatPage(),

        AllHospitalsPage.id: (context) => AllHospitalsPage(),

        AllDoctorsViewBuilder.id: (context) => AllDoctorsViewBuilder(),
        AbuotDoctorPage.id: (context) => AbuotDoctorPage(),
        Book_Now_page.id: (context) => Book_Now_page(),
        Proceed_page.id: (context) => Proceed_page(),
      },
      initialRoute: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? HomeView.id
          : AnimatedSplashPage.id,
    );
  }
}

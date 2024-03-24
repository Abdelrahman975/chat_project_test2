import 'package:chat_project_test2/pages/reminder_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constant.dart';
import '../All Doctor/All_Doctor_pages/all_doctors_list_views_builder.dart';
import '../All_Hospitals/all_hospitals_pages.dart';
import '../Profile/profilePage.dart';
import '../login_page.dart';
import 'home_page.dart';
// import 'pages/reminder_page.dart';

class HomeView extends StatefulWidget {
  static String id = 'Home View';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const AllDoctorsViewBuilder(),
    const AllHospitalsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KprimaryColor2,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
                'assets/images/person1.png'), // Add your profile image
          ),
        ),
        title: Row(
          children: [
            const Text(
              'Hi , Abdo',
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(), // Adds space between title and buttons
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: KprimaryColor3,
              ),
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, ReminderPage.id);
                // Handle notifications button press
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: KprimaryColor3,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, ReminderPage.id);
              // Handle settings button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            color: KprimaryColor3,
            onPressed: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(LoginPage.id, (route) => false);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: pages.elementAt(currentIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: KprimaryColor2,
        selectedItemColor: Colors.black, // Set the selected item color
        unselectedItemColor: Colors.black, // Set the unselected item color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: KprimaryColor3,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_contact_calendar_outlined,
              color: KprimaryColor3,
            ),
            label: 'All Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_hospital_outlined,
              color: KprimaryColor3,
            ),
            label: 'All Hospitals',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: KprimaryColor3,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}

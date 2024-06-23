// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors

import 'package:chat_project_test2/pages/All_Hospitals/all_hospitals_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../All Doctor/All_Doctor_pages/all_doctor_list_view.dart';

// import '../notifications_screen.dart';
import 'drawer/drawer_screen.dart';
import 'home_page.dart';
// import 'pages/reminder_page.dart';

class HomeView extends StatefulWidget {
  static String id = 'Home View';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  PageController _pageController = PageController();

  List<Widget> pages = [
    const HomePage(),

    AllHospitals_listview(),
    AllDactor_listview(),
    // const ProfilePage(),
  ];

  /*String timeStatus (){
    if(DateTime.now().hour>){ return '';}
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer_widget(),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: KprimaryColor2,
        elevation: 0,

        title: Row(
          children: [
            Text(
              'Hi, ${FirebaseAuth.instance.currentUser!.displayName}',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (value) {
          if (mounted) {
            setstate() {
              currentIndex = value;
            }
          }
        },
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: KprimaryColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List<Widget>.generate(pages.length, (int index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index == 0
                        ? Icons.home
                        : index == 1
                            ? Icons.local_hospital_rounded
                            : Icons.perm_contact_calendar_outlined,
                    color:
                        currentIndex == index ? Colors.black : KprimaryColor3,
                  ),
                  Text(
                    index == 0
                        ? 'home'
                        : index == 1
                            ? 'All Hospitals'
                            : 'All Doctors',
                    style: TextStyle(
                      color:
                          currentIndex == index ? Colors.black : KprimaryColor3,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

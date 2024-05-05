// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../All Doctor/All_Doctor_pages/all_doctor_list_view.dart';

import '../All_Hospitals/all_hospitals_pages.dart';

import '../notifications_screen.dart';
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
    const AllDactor_listview(),
    const AllHospitalsPage(),
    // const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer_widget(),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: KprimaryColor2,
        elevation: 0,
        // leading: const Padding(
        //   padding: EdgeInsets.only(left: 5),
        //   child: CircleAvatar(
        //     radius: 20,
        //     backgroundImage: AssetImage(
        //         'assets/images/person1.png'), // Add your profile image
        //   ),
        // ),
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
                Navigator.pushNamed(context, Notifications.id);
                // Handle notifications button press
              },
            ),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
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
                            ? Icons.perm_contact_calendar_outlined
                            : Icons.person,
                    color:
                        currentIndex == index ? Colors.black : KprimaryColor3,
                  ),
                  Text(
                    index == 0
                        ? 'home'
                        : index == 1
                            ? 'All Doctors'
                            : 'All Hospitals',
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





//  bottomNavigationBar: Container(
//         margin: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//             color: Colors.black, borderRadius: BorderRadius.circular(16)),
//         child: BottomNavigationBar(
//           backgroundColor: Colors.black,
//           selectedItemColor: Colors.black, // Set the selected item color
//           // unselectedItemColor: Colors.black, // Set the unselected item color
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//                 color: KprimaryColor3,
//               ),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.perm_contact_calendar_outlined,
//                 // color: KprimaryColor3,
//               ),
//               label: 'All Doctors',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.local_hospital_outlined,
//                 color: KprimaryColor3,
//               ),
//               label: 'All Hospitals',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.person,
//                 color: KprimaryColor3,
//               ),
//               label: 'Profile',
//             ),
//           ],
//           currentIndex: currentIndex,
//           onTap: (value) {
//             setState(() {
//               currentIndex = value;
//             });
//           },
//         ),
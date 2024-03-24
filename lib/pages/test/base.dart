import 'package:chat_project_test2/pages/test/dome.dart';
import 'package:chat_project_test2/pages/test/home.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  List<Widget> pages = [HomePage1(), DomePage1()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: pages.elementAt(currentIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Dome')
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













// bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         backgroundColor: Colors.white, // Set the background color to green
//         selectedItemColor: Colors.black, // Set the selected item color
//         unselectedItemColor: Colors.black, // Set the unselected item color
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: Color.fromARGB(255, 32, 132, 84),
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.perm_contact_calendar_outlined,
//               color: Color.fromARGB(255, 32, 132, 84),
//             ),
//             label: 'All Doctors',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.local_hospital_outlined,
//               color: Color.fromARGB(255, 32, 132, 84),
//             ),
//             label: 'All Hospitals',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               color: Color.fromARGB(255, 32, 132, 84),
//             ),
//             label: 'Profile',
//           ),
//         ],
//       ),



















// BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {});
//         },
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromARGB(176, 226, 109, 19),
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Appointments',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.local_hospital_outlined),
//             label: 'All Hospitals',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'person',
//           ),
//         ],
//       ),
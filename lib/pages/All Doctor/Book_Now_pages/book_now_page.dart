import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../Auth/widget/custom_button.dart';
import '../Proceed_pages_1/proceed_page.dart';
import '../about_doctor_pages/widget/about_doctor_container.dart';
import 'widget/date_book_button.dart';

class Book_Now_page extends StatelessWidget {
  const Book_Now_page({super.key});
  static String id = 'Book Now page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor4,
      appBar: AppBar(
        backgroundColor: KprimaryColor2,
        title: const Text(
          'Book Now',
          style: TextStyle(
            fontSize: 25,
            color: KprimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            AboutDoctorContainer(),
            Text(
              'Choose A Date',
              style: TextStyle(
                  fontSize: 18,
                  color: KprimaryColor3,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return DateBook_Button(
                    titel: 'Today',
                  );
                },
              ),
            ),
            Center(
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Center(
              child: Text(
                '10/6/2023',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                '9 Slots Available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Center(
              child: Text(
                '4 PM - 6 PM',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateBook_Button(
                  titel: '4:00 PM',
                ),
                DateBook_Button(
                  titel: '4:15 PM',
                ),
                DateBook_Button(
                  titel: '4:30 PM',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateBook_Button(
                  titel: '4:45 PM',
                ),
                DateBook_Button(
                  titel: '5:00 PM',
                ),
                DateBook_Button(
                  titel: '5:15 PM',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateBook_Button(
                  titel: '5:30 PM',
                ),
                DateBook_Button(
                  titel: '5:45 PM',
                ),
                DateBook_Button(
                  titel: '6:00 PM',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Terms And Conditions',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: Center(
                  child: Text(
                    '            The document governing the contractual relationship between the provider of a service and its user. On the web, this document is often also called “Terms of Service” (ToS),.',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CustomButtom(
              titel: 'Proceed',
              onTap: () {
                Navigator.pushNamed(context, Proceed_page.id);
              },
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

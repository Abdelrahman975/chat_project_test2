import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

import '../../../constant.dart';
import '../../Auth/widget/custom_button.dart';
import '../Proceed_pages_1/proceed_page.dart';
import '../about_doctor_pages/widget/about_doctor_container.dart';
import 'widget/date_book_button.dart';

class Book_Now_page extends StatefulWidget {
  Book_Now_page({super.key});
  static String id = 'Book Now page';

  @override
  State<Book_Now_page> createState() => _Book_Now_pageState();
}

class _Book_Now_pageState extends State<Book_Now_page> {
  int _selectedDayIndex = 0;
  int _selectedSlotIndex = -1;

  void _selectDay(int index) {
    setState(() {
      _selectedDayIndex = index;
      _selectedSlotIndex = -1; // Reset the selected slot
    });
  }

  void _selectSlot(int index) {
    setState(() {
      _selectedSlotIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime now = DateTime.now();

    // Generate a list of dates
    List<DateTime> dates =
        List.generate(7, (index) => now.add(Duration(days: index)));

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
            const Text(
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
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return DayBook_Button(
                    isSelected: _selectedDayIndex == index,
                    onTap: () {
                      _selectDay(index);
                    },
                    titel: DateFormat('EEEE').format(dates[index]), // Day name
                  );
                },
              ),
            ),
            Center(
              child: Text(
                DateFormat('EEEE').format(dates[_selectedDayIndex]), // Day name
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Center(
              child: Text(
                DateFormat('dd/MM/yyyy')
                    .format(dates[_selectedDayIndex]), // Full date
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
                  isSelected: _selectedSlotIndex == 0,
                  onTap: () {
                    _selectSlot(0);
                  },
                  titel: '4:00 PM',
                ),
                DateBook_Button(
                  isSelected: _selectedSlotIndex == 1,
                  onTap: () {
                    _selectSlot(1);
                  },
                  titel: '4:15 PM',
                ),
                DateBook_Button(
                  isSelected: _selectedSlotIndex == 2,
                  onTap: () {
                    _selectSlot(2);
                  },
                  titel: '4:30 PM',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateBook_Button(
                  isSelected: _selectedSlotIndex == 3,
                  onTap: () {
                    _selectSlot(3);
                  },
                  titel: '4:45 PM',
                ),
                DateBook_Button(
                  isSelected: _selectedSlotIndex == 4,
                  onTap: () {
                    _selectSlot(4);
                  },
                  titel: '5:00 PM',
                ),
                DateBook_Button(
                  isSelected: _selectedSlotIndex == 5,
                  onTap: () {
                    _selectSlot(5);
                  },
                  titel: '5:15 PM',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateBook_Button(
                  isSelected: _selectedSlotIndex == 6,
                  onTap: () {
                    _selectSlot(6);
                  },
                  titel: '5:30 PM',
                ),
                DateBook_Button(
                  isSelected: _selectedSlotIndex == 7,
                  onTap: () {
                    _selectSlot(7);
                  },
                  titel: '5:45 PM',
                ),
                DateBook_Button(
                  isSelected: _selectedSlotIndex == 8,
                  onTap: () {
                    _selectSlot(8);
                  },
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
                    'The document governing the contractual relationship between the provider of a service and its user. On the web, this document is often also called “Terms of Service” (ToS).',
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

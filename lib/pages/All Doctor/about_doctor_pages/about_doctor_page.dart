import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../Book_Now_pages/book_now_page.dart';
import 'widget/about_doctor_container.dart';
import 'widget/clinic_visit_container.dart';
import 'widget/custom_button_dcotor.dart';
import 'widget/doctor_details_contener.dart';

// ignore: must_be_immutable
class AbuotDoctorPage extends StatelessWidget {
  AbuotDoctorPage({
    super.key,
  });
  Map doctorMap = {};
  late String doctorName = doctorMap['name'];
  late String doctorImage = doctorMap['Image'];
  late String doctorCity = doctorMap['city'];
  late int doctorExper = doctorMap['experience'];
  late int doctorCost = doctorMap['cost'];
  late String doctorPosition = doctorMap['position'];
  late String doctorQualific = doctorMap['qualification'];
  late String doctorHospitalWork = doctorMap['hospital'];
  late String doctordescription = doctorMap['description'];

  static String id = 'About Doctor page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor4,
      appBar: AppBar(
        backgroundColor: KprimaryColor2,
        title: const Text(
          'Name Doctor.........',
          style: TextStyle(
            fontSize: 25,
            color: KprimaryColor3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            AboutDoctorContainer(),
            Clinic_Visit_Container(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtomDoctor(
                  titel: 'Book Now',
                  myIcon: Icons.book_online,
                  onTap: () {
                    Navigator.pushNamed(context, Book_Now_page.id);
                  },
                ),
                CustomButtomDoctor(
                  titel: 'Chat',
                  myIcon: Icons.chat,
                ),
              ],
            ),
            DoctorDetailsContener(),
          ],
        ),
      ),
    );
  }
}

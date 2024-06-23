import 'package:chat_project_test2/pages/All%20Doctor/Proceed_pages_1/add_patient_page.dart';
import 'package:chat_project_test2/pages/All%20Doctor/Proceed_pages_1/success_page/success_page.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../Auth/widget/custom_button.dart';
import '../about_doctor_pages/widget/about_doctor_container.dart';
import '../about_doctor_pages/widget/custom_button_dcotor.dart';
import 'widget/paymen_dtetails_contener.dart';

// ignore: must_be_immutable
class Proceed_page extends StatelessWidget {
  Proceed_page({super.key, required this.doctorMap});
  static String id = 'Proceed page';
  Map doctorMap;
  late int doctorCost = doctorMap['cost'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor4,
      appBar: AppBar(
        backgroundColor: KprimaryColor2,
        title: const Text(
          'Proceed',
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
            AboutDoctorContainer(
              doctorMap: doctorMap,
            ),
            const Text(
              'Patient Details',
              style: TextStyle(
                  fontSize: 18,
                  color: KprimaryColor3,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
            CustomButtomDoctor(
              titel: 'Add Patient',
              myIcon: Icons.person_add,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPatientPage()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Payment Details',
              style: TextStyle(
                  fontSize: 15,
                  color: KprimaryColor3,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
            const SizedBox(
              height: 20,
            ),
            PaymentDetailsContaner(
              doctorCost: doctorCost,
            ),
            const SizedBox(
              height: 80,
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
            const SizedBox(
              height: 15,
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
            const SizedBox(
              height: 25,
            ),
            CustomButtom(
              titel: 'Book Appointment',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessPage2()));
              },
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

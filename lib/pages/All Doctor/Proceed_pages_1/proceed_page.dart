import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../Auth/widget/custom_button.dart';
import '../about_doctor_pages/widget/about_doctor_container.dart';
import '../about_doctor_pages/widget/custom_button_dcotor.dart';
import 'widget/paymen_dtetails_contener.dart';

class Proceed_page extends StatelessWidget {
  const Proceed_page({super.key});
  static String id = 'Proceed page';

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
            AboutDoctorContainer(),
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
            PaymentDetailsContaner(),
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

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../All Doctor/Book_Now_pages/widget/date_book_button.dart';
import 'widget/about_hospital_detalisl.dart';
import 'widget/abuot_hospital_images.dart';
import 'widget/all_hospitals_container.dart';
import 'widget/doctor_continer_images.dart';

class AllHospitalsPage extends StatelessWidget {
  const AllHospitalsPage({super.key});
  static String id = 'All Hospitals Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor4,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(children: [
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ALLHospitalsContainer();
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          AboutHospitalDetalisl(),
          SizedBox(
            height: 90,
          ),
          Text(
            'Top Doctors At Behman Psychiatric Hospital',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return DoctorContinerImages();
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DateBook_Button(
            titel: 'Show More Doctors',
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Images related to Behman Psychiatric Hospital',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return AbuotHospitalImages();
              },
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}

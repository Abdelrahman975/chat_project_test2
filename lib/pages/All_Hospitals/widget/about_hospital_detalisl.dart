import 'package:flutter/material.dart';

import '../../../constant.dart';

class AboutHospitalDetalisl extends StatelessWidget {
  const AboutHospitalDetalisl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, bottom: 20),
            child: Text(
              'About Behman Psychiaric Hospital',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                color: KprimaryColor3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              'About Behman Psychiaric Hospital  About Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric HospitalAbout Behman Psychiaric Hospital',
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                color: KprimaryColor3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

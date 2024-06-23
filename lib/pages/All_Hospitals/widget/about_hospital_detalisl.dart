import 'package:flutter/material.dart';

import '../../../constant.dart';

// ignore: must_be_immutable
class AboutHospitalDetalisl extends StatelessWidget {
  AboutHospitalDetalisl({super.key, required this.hospitalMap});
  Map hospitalMap;
  late List hospitalListImages = hospitalMap['Images'];
  late String hospitalName = hospitalMap['name'];
  late String hospitallocation = hospitalMap['location'];
  late String hospitalDescription = hospitalMap['description'];
  late String hospitalTeamAndSpe = hospitalMap['Team and Specialities'] ?? '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, bottom: 20),
            child: Text(
              'About $hospitalName Hospital',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                color: KprimaryColor3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              hospitalDescription,
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                color: KprimaryColor3,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13.0, bottom: 20, top: 20),
            child: Text(
              'Team and Specialities',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                color: KprimaryColor3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              hospitalTeamAndSpe,
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                color: KprimaryColor3,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13.0, bottom: 20, top: 20),
            child: Text(
              'Location',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                color: KprimaryColor3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              hospitallocation,
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
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

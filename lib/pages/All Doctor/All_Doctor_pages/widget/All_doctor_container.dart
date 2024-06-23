import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../about_doctor_pages/about_doctor_page.dart';

// ignore: must_be_immutable
class DoctorContainer extends StatelessWidget {
  DoctorContainer({super.key, required this.doctorMap});
  Map doctorMap;
  late String doctorName = doctorMap['name'];
  late String doctorImage = doctorMap['Image'];
  late String doctorCity = doctorMap['city'];
  late int doctorExper = doctorMap['experience'];
  late int doctorCost = doctorMap['cost'];
  late String doctorPosition = doctorMap['position'];
  late String doctorQualific = doctorMap['qualification'];
  late String doctorHospitalWork = doctorMap['hospital'];
  late String doctordescription = doctorMap['description'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AbuotDoctorPage(doctorMap: doctorMap)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 4,
          type: MaterialType.card,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 160,
            width: 370,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        doctorImage,
                        height: 115,
                        width: 100,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          doctorName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: KprimaryColor3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        doctorQualific,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          color: KprimaryColor3,
                        ),
                      ),
                      Text(
                        doctorPosition,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: KprimaryColor3,
                        ),
                      ),
                      Text(
                        '$doctorExper yers Experience',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.grey[600],
                            size: 15,
                          ),
                          Text(
                            doctorCity,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Consuting Fee',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: KprimaryColor3,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            '$doctorCost \$',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: KprimaryColor3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Column(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        '4.5',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Reting',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 8,
                          color: KprimaryColor3,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

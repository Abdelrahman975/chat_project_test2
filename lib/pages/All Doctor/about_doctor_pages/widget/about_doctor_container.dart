import 'package:flutter/material.dart';

import '../../../../constant.dart';

// ignore: must_be_immutable
class AboutDoctorContainer extends StatelessWidget {
  AboutDoctorContainer({
    super.key,
    required this.doctorMap,
  });
  Map doctorMap = {};
  late String doctorName = doctorMap['name'] ?? '';
  late String doctorImage = doctorMap['Image'] ??
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmWru8q17zpOzzzT1s475ZS_8fOL1GS0teSw&s';
  late String doctorCity = doctorMap['city'] ?? '';
  late int doctorExper = doctorMap['experience'] ?? 0;
  late String doctorPosition = doctorMap['position'] ?? '';
  late String doctorQualific = doctorMap['qualification'] ?? '';
  late String doctorHospitalWork = doctorMap['hospital'] ?? '';
  late String doctordescription = doctorMap['description'] ?? '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 12, top: 8, bottom: 8),
      child: Container(
        decoration: const BoxDecoration(
          color: KprimaryColor4,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 200,
        width: 370,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                    doctorImage,
                    height: 150,
                    width: 120,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 190,
                    child: Text(
                      doctorName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: KprimaryColor3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    child: Text(
                      doctorQualific,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: KprimaryColor3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                      doctorPosition,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: KprimaryColor3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                      '$doctorExper yers Experience',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                      doctorHospitalWork,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: KprimaryColor3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.grey[600],
                        size: 17,
                      ),
                      SizedBox(
                        width: 190,
                        child: Text(
                          doctorCity,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

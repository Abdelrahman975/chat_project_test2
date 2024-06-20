import 'package:flutter/material.dart';

import '../../../../constant.dart';

// ignore: must_be_immutable
class AboutDoctorContainer extends StatelessWidget {
  AboutDoctorContainer({
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 12, top: 8, bottom: 8),
      child: Container(
        decoration: const BoxDecoration(
          color: KprimaryColor4,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 180,
        width: 370,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'https://www.vaidam.com/sites/default/files/dr._nasser_1-min.jpg',
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
                  const SizedBox(
                    width: 190,
                    child: Text(
                      'Dr Denies Martine.......................................',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        color: KprimaryColor3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 190,
                    child: Text(
                      'Graduation FRCP.......................................',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        color: KprimaryColor3,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 170,
                    child: Text(
                      'Director.........................................',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: KprimaryColor3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                      '28 yers Ex.............................................',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[400],
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
                          'BEHMAN ................................................',
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

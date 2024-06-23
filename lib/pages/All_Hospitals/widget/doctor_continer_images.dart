import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../All Doctor/about_doctor_pages/about_doctor_page.dart';

// ignore: must_be_immutable
class DoctorContinerImages extends StatelessWidget {
  DoctorContinerImages({
    super.key,
    required this.doctorMap,
  });

  Map doctorMap;
  late String doctorName = doctorMap['name'];
  late String doctorImage = doctorMap['Image'];
  late String doctorHospitalWork = doctorMap['hospital'];

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
          elevation: 3,
          type: MaterialType.card,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 400,
            width: 180,
            decoration: const BoxDecoration(
              color: KprimaryColor4,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 140,
                  width: 150,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(doctorImage),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      doctorName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 4),
                  child: SizedBox(
                    width: 150,
                    child: Text(doctorHospitalWork,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: KprimaryColor3,
                          fontSize: 15,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

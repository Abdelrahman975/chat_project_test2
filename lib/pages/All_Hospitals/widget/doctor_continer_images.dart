import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../All Doctor/about_doctor_pages/about_doctor_page.dart';

class DoctorContinerImages extends StatelessWidget {
  const DoctorContinerImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AbuotDoctorPage.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 1,
          type: MaterialType.card,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 250,
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
                      image: AssetImage('assets/images/doctor4.png'),
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
                  child: Text(
                    'Dr. Nasser Fathy Loza',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 4),
                  child: Text('contact hospital',
                      style: const TextStyle(
                        color: KprimaryColor3,
                        fontSize: 15,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

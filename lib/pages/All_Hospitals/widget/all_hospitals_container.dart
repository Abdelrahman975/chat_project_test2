import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../all_hospitals_pages.dart';

class ALLHospitalsContainer extends StatelessWidget {
  const ALLHospitalsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AllHospitalsPage.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 2,
          type: MaterialType.card,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 200,
            width: 240,
            decoration: const BoxDecoration(
              color: KprimaryColor4,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 125,
                  width: 220,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/hospital2.png'),
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
                    'Behman Psychiatric Hospital',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 16,
                      ),
                      Text('Cairo , Egypt',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ))
                    ],
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

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../all_hospitals_pages.dart';

// ignore: must_be_immutable
class ALLHospitalsContainer extends StatelessWidget {
  ALLHospitalsContainer({super.key, required this.hospitalMap});
  Map hospitalMap;
  late List hospitalListImages = hospitalMap['Images'];
  late String hospitalName = hospitalMap['name'];
  late String hospitallocation = hospitalMap['location'];
  late String hospitalAddress = hospitalMap['address'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AllHospitalsPage(
                      hospitalMap: hospitalMap,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 2,
          type: MaterialType.card,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 260,
            width: 300,
            decoration: const BoxDecoration(
              color: KprimaryColor4,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 130,
                    width: 320,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Image.network(
                        hospitalListImages[0],
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }
                        },
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Center(
                            child: Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    hospitalName,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(hospitallocation,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.my_location_outlined,
                        color: Colors.grey,
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: 300,
                          child: Text(hospitalAddress,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              )),
                        ),
                      )
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

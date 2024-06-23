import 'package:chat_project_test2/pages/All_Hospitals/widget/button_move.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'widget/about_hospital_detalisl.dart';
import 'widget/abuot_hospital_images.dart';
import 'widget/doctor_continer_images.dart';

// ignore: must_be_immutable
class AllHospitalsPage extends StatefulWidget {
  AllHospitalsPage({super.key, required this.hospitalMap});
  static String id = 'All Hospitals Page';
  Map hospitalMap;
  late List hospitalListImages = hospitalMap['Images'];
  late String hospitalName = hospitalMap['name'];
  late String hospitalTeamAndSpe = hospitalMap['Team and Specialities'];
  late String hospitallocation = hospitalMap['location'];
  late String hospitalAddress = hospitalMap['address'];
  late String hospitalDescription = hospitalMap['description'];

  @override
  State<AllHospitalsPage> createState() => _AllHospitalsPageState();
}

class _AllHospitalsPageState extends State<AllHospitalsPage> {
  List doctorsList = [];
// Add a loading state variable
  getDoctorsData() async {
    var result = await FirebaseFirestore.instance.collection('doctors').get();
    setState(() {
      doctorsList = result.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
// Set loading to false when data is fetched
    });
  }

  @override
  void initState() {
    getDoctorsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor4,
      appBar: AppBar(
        backgroundColor: KprimaryColor2,
        title: Text(
          widget.hospitalName,
          style: TextStyle(
            fontSize: 20,
            color: KprimaryColor3,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    height: 200,
                    width: 320,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Image.network(
                        widget.hospitalListImages[index],
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
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Address :',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 10,
            ),
            child: Text(
              widget.hospitalAddress,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AboutHospitalDetalisl(
            hospitalMap: widget.hospitalMap,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Top Doctors ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: doctorsList.length,
              itemBuilder: (context, index) {
                return DoctorContinerImages(
                  doctorMap: doctorsList[index],
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          button_move(
            titel: 'Show More Doctors',
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Images related to ${widget.hospitalName} Hospital',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.hospitalListImages.length,
              itemBuilder: (context, index) {
                return AbuotHospitalImages(
                  hospitalImage: widget.hospitalListImages[index],
                );
              },
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}

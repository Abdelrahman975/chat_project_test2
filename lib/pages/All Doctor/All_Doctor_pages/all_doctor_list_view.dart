import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'widget/All_doctor_container.dart';

class AllDactor_listview extends StatefulWidget {
  AllDactor_listview({
    super.key,
  });

  @override
  State<AllDactor_listview> createState() => _AllDactor_listviewState();
}

class _AllDactor_listviewState extends State<AllDactor_listview> {
  List doctorsList = [];
  getDoctorsData() async {
    var result = await FirebaseFirestore.instance.collection('doctors').get();
    setState(() {
      doctorsList = result.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }

  @override
  void initState() {
    getDoctorsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctorsList.length,
      itemBuilder: (context, index) {
        return DoctorContainer(doctorMap: doctorsList[index]);
      },
    );
  }
}

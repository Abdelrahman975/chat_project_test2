import 'package:chat_project_test2/pages/All_Hospitals/widget/all_hospitals_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllHospitals_listview extends StatefulWidget {
  AllHospitals_listview({
    super.key,
  });

  @override
  State<AllHospitals_listview> createState() => _AllHospitals_listviewState();
}

class _AllHospitals_listviewState extends State<AllHospitals_listview> {
  List hospitalsList = [];

  // ignore: unused_field
  bool _isLoading = true; // Add a loading state variable
  getDoctorsData() async {
    var result = await FirebaseFirestore.instance.collection('hospitals').get();
    setState(() {
      if (mounted) {
        setstate() {}
      }
      hospitalsList = result.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
      _isLoading = false; // Set loading to false when data is fetched
    });
  }

  @override
  void initState() {
    getDoctorsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator()) // Show loading indicator
        : ListView.builder(
            itemCount: hospitalsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ALLHospitalsContainer(hospitalMap: hospitalsList[index]),
              );
            },
          );
  }
}

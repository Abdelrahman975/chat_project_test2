import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constant.dart';

import 'all_doctor_list_view.dart';

class AllDoctorsViewBuilder extends StatefulWidget {
  const AllDoctorsViewBuilder({super.key});
  static String id = 'All Doctor Page';

  @override
  State<AllDoctorsViewBuilder> createState() => _AllDoctorsViewBuilderState();
}

class _AllDoctorsViewBuilderState extends State<AllDoctorsViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KprimaryColor2,
        title: Text(
          'Top Doctors',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: KprimaryColor4,
      //
      body: AllDactor_listview(),
    );
  }
}

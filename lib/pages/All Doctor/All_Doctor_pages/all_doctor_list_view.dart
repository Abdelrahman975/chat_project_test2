import 'package:flutter/material.dart';

import 'widget/All_doctor_container.dart';

class AllDactor_listview extends StatelessWidget {
  const AllDactor_listview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return AllDoctorContainer();
      },
    );
  }
}

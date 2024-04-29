import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../All_Doctor_pages/all_doctors_list_views_builder.dart';

// ignore: must_be_immutable
class DateBook_Button extends StatelessWidget {
  DateBook_Button({
    this.onTap,
    required this.titel,
  });
  VoidCallback? onTap;
  String titel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AllDoctorsViewBuilder.id);
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: onTap,
          child: Material(
            elevation: 2,
            type: MaterialType.card,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: KprimaryColor2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  titel,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

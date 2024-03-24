import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constant.dart';

// ignore: must_be_immutable
class CustomButtomDoctor extends StatelessWidget {
  CustomButtomDoctor({this.onTap, required this.titel, required this.myIcon});
  VoidCallback? onTap;
  String titel;
  IconData myIcon = Icons.add;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 2,
          type: MaterialType.card,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Container(
            width: 160,
            height: 50,
            decoration: BoxDecoration(
              color: KprimaryColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  myIcon,
                  color: KprimaryColor3,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  titel,
                  style: const TextStyle(
                    fontSize: 20,
                    color: KprimaryColor,
                    fontWeight: FontWeight.bold,
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

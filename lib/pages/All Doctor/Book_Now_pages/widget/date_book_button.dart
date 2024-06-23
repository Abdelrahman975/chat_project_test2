import 'package:flutter/material.dart';

import '../../../../constant.dart';

// ignore: must_be_immutable
class DayBook_Button extends StatelessWidget {
  DayBook_Button({this.onTap, required this.titel, required this.isSelected});
  VoidCallback? onTap;
  String titel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: onTap,
          child: Material(
            elevation: 2,
            type: MaterialType.card,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 130,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected ? KprimaryColor2 : Colors.grey[300],
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

// ignore: must_be_immutable
class DateBook_Button extends StatelessWidget {
  DateBook_Button({this.onTap, required this.titel, required this.isSelected});
  VoidCallback? onTap;
  String titel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                color: isSelected ? KprimaryColor2 : Colors.grey[300],
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

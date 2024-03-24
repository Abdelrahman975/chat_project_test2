import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constant.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  CustomButtom({
    this.onTap,
    required this.titel,
  });
  VoidCallback? onTap;
  String titel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: KprimaryColor2,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            titel,
            style: TextStyle(
              fontSize: 20,
              color: KprimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButtomImage extends StatelessWidget {
  CustomButtomImage({
    this.onTap,
    required this.titel,
    required this.Imgaess,
  });
  VoidCallback? onTap;
  String titel;
  String Imgaess;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: KprimaryColor2,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titel,
              style: TextStyle(
                fontSize: 20,
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              Imgaess,
              width: 40,
            )
          ],
        ),
      ),
    );
  }
}

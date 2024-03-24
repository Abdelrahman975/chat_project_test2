import 'package:flutter/material.dart';

void showSnackMassage(BuildContext context, String Massage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(Massage),
      backgroundColor: Color(0xffbabbbf),
      duration: const Duration(milliseconds: 400),
    ),
  );
}

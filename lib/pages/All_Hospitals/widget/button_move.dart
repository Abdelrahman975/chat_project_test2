// ignore_for_file: camel_case_types

import 'package:chat_project_test2/pages/All%20Doctor/All_Doctor_pages/all_doctors_list_views_builder.dart';
import 'package:flutter/material.dart';

import '../../../../constant.dart';

// ignore: must_be_immutable
class button_move extends StatelessWidget {
  button_move({
    super.key,
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
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: onTap,
          child: Material(
            elevation: 2,
            type: MaterialType.card,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
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

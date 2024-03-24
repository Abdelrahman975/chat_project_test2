import 'package:chat_project_test2/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor4,
      body: Center(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                      top: 12, bottom: 12, right: 16, left: 16),
                  width: double.maxFinite,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1, style: BorderStyle.none)),
                  child: Material(
                    elevation: 1,
                    type: MaterialType.card,
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                );
              })),
    );
  }
}

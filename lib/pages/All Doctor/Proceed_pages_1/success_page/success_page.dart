import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SuccessPage2 extends StatefulWidget {
  const SuccessPage2({super.key});
  static String id = 'SuccessPage2';

  @override
  State<SuccessPage2> createState() => _SuccessPage2State();
}

class _SuccessPage2State extends State<SuccessPage2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      // Navigator.popUntil(context, ModalRoute.withName('/'));
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.white,
      child: Center(
        child: FlareActor(
          'assets/animations/Success Check.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: 'Untitiled',
        ),
      ),
    );
  }
}

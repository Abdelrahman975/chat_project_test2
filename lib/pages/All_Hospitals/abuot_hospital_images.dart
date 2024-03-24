import 'package:flutter/material.dart';

class AbuotHospitalImages extends StatelessWidget {
  const AbuotHospitalImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        type: MaterialType.card,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 160,
          width: 180,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/hospital4.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}

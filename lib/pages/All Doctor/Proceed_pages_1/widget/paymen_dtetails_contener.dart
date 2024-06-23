import 'package:flutter/material.dart';

import '../../../../constant.dart';

// ignore: must_be_immutable
class PaymentDetailsContaner extends StatelessWidget {
  PaymentDetailsContaner({super.key, required this.doctorCost});
  late int doctorCost;
  late double bookCharge = .50;
  late double total = doctorCost + bookCharge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        type: MaterialType.card,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          decoration: const BoxDecoration(
            color: KprimaryColor4,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 200,
          width: 320,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Row(
                children: [
                  const Text(
                    'Consultation fee',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    '$doctorCost',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Booking charge',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    '.5',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Hospital charge',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    '--',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Row(
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    '$total',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../constant.dart';

class Clinic_Visit_Container extends StatelessWidget {
  const Clinic_Visit_Container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        type: MaterialType.card,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 200,
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: KprimaryColor5,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                height: 50,
                width: 400,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: const Row(
                  children: [
                    Text(
                      'Clinic Visit',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Consulting Fee : 500',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 2),
                child: Text(
                  'Clinic Address :',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: Text(
                    'Serum clinic ,Rose dam , Near Police Station, Cairo ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      color: Colors.grey,
                      size: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 280,
                      height: 20,
                      child: Text(
                        'free consult follow-up 7 days ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

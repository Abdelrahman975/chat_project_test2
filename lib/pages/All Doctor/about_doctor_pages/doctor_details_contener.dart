import 'package:flutter/material.dart';

import '../../../constant.dart';

class DoctorDetailsContener extends StatelessWidget {
  const DoctorDetailsContener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Doctot',
            style: TextStyle(
              fontSize: 20,
              color: KprimaryColor3,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10.0, right: 4),
                child: Icon(
                  Icons.circle_rounded,
                  color: Colors.grey,
                  size: 5,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Dr. Nagui Gamil Mikhael is a Prominent Psychiatrist, with a thriving experience of more than 26 years.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10.0, right: 4),
                child: Icon(
                  Icons.circle_rounded,
                  color: Colors.grey,
                  size: 5,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'He has a special interest in General Adult Psychiatry, Old Age Psychiatry, Psychopharmacology, Literature, and the liberal arts.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

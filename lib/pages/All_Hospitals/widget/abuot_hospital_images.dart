import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AbuotHospitalImages extends StatelessWidget {
  AbuotHospitalImages({super.key, required this.hospitalImage});
  late String hospitalImage = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        type: MaterialType.card,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 160,
          width: 220,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image.network(
              hospitalImage,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }
              },
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Center(
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/services_category_model.dart';

class ServicesWidgets extends StatelessWidget {
  const ServicesWidgets({super.key, required this.category});
  final ServicesCategoryModel category;
  @override
  Widget build(BuildContext context) {
    // var email = ModalRoute.of(context)!.settings.arguments;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          category.categoryNamePage,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Material(
              elevation: 4,
              type: MaterialType.card,
              borderRadius: BorderRadius.circular(11),
              child: Container(
                height: 90,
                width: 105,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(category.image),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              category.categoryName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

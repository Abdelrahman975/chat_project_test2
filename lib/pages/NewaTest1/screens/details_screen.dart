//now let's for the details screen

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/news_model.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.data, {Key? key}) : super(key: key);
  NewsData data;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.orange.shade900),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.title!,
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              widget.data.author!,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Hero(
              tag: "${widget.data.title}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  widget.data.urlToImage ??
                      'https://static.independent.co.uk/2023/12/19/16/Hero_3_2%20image.png?quality=75&width=640&crop=3%3A2%2Csmart&auto=webp',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(widget.data.content!)
          ],
        ),
      ),
    );
  }
}

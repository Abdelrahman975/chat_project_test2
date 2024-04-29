// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constant.dart';
import 'home/drawer/drawer_screen.dart';

class MRI_Page extends StatefulWidget {
  static String id = 'MRI Page';
  const MRI_Page({super.key});

  @override
  _MRI_PageState createState() => _MRI_PageState();
}

class _MRI_PageState extends State<MRI_Page> {
  File? _imageFile;
  double _progress = 0.0;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> _processImage() async {
    // Simulating processing
    for (int i = 0; i <= 100; i++) {
      setState(() {
        _progress = i / 100;
      });
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer_widget(),
      appBar: AppBar(
        backgroundColor: KprimaryColor2,
        title: const Text('MRI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : const Text(
                    'No image selected',
                    style: TextStyle(fontSize: 20.0),
                  ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () => _getImage(ImageSource.camera),
                      icon: const Icon(Icons.camera_alt),
                      color: Colors.black,
                    ),
                    ElevatedButton(
                      onPressed: () => _getImage(ImageSource.gallery),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KprimaryColor2,
                      ),
                      child: const Text(
                        'Select Image ',
                        style: TextStyle(color: KprimaryColor3),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 42,
                    ),
                    ElevatedButton(
                      onPressed: _processImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KprimaryColor2,
                      ),
                      child: const Text(
                        'Get Result',
                        style: TextStyle(color: KprimaryColor3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 200,
              child: Stack(
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 220 * _progress,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${(_progress * 100).toStringAsFixed(1)}%',
                      style:
                          const TextStyle(color: Colors.black, fontSize: 22.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

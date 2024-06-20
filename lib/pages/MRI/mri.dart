import 'dart:convert';
import 'dart:io';
import 'package:chat_project_test2/pages/home/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MRI_Page extends StatefulWidget {
  static String id = 'MRI Page';
  const MRI_Page({super.key});

  @override
  _MRI_Page2State createState() => _MRI_Page2State();
}

class _MRI_Page2State extends State<MRI_Page> {
  File? _imageFile;
  double _progress = 0.0;
  List<Map<String, dynamic>> listdata = [];
  bool _isUploading = false;

  var url =
      'https://alzheimer-s-detection-with-streamlit.onrender.com//predict';

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> upload() async {
    setState(() {
      _isUploading = true;
    });

    var request = http.MultipartRequest("POST", Uri.parse(url));
    final header = {"Content-Type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
        'file', _imageFile!.readAsBytes().asStream(), _imageFile!.lengthSync(),
        filename: _imageFile!.path.split('/').last));
    request.headers.addAll(header);

    final myRequest = await request.send();
    http.Response res = await http.Response.fromStream(myRequest);

    if (myRequest.statusCode == 200) {
      setState(() {
        listdata = List<Map<String, dynamic>>.from(jsonDecode(res.body));
        if (listdata.isNotEmpty) {
          if (listdata.length > 1 && listdata[1].values.first is double) {
            _progress = listdata[1].values.first;
          }
        }
      });
      print("response here: $listdata");
      for (var item in listdata) {
        item.forEach((key, value) {
          print("$key: $value");
        });
      }
    } else {
      print("Error ${myRequest.statusCode}");
    }

    setState(() {
      _isUploading = false;
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
        backgroundColor: const Color(0xffa1dfd8),
        title: const Text('MRI'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.grey[300],
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/images/vector.png'),
                  ),
            const SizedBox(
              height: 30,
            ),
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
                        backgroundColor: const Color(0xffa1dfd8),
                      ),
                      child: const Text(
                        'Select Image ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 13, 0, 0),
                        ),
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
                      onPressed: _imageFile == null
                          ? null
                          : () async {
                              await upload();
                              await _processImage();
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffa1dfd8),
                      ),
                      child: const Text(
                        'Get listdata',
                        style: TextStyle(
                          color: Color.fromARGB(255, 14, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            _isUploading
                ? const CircularProgressIndicator()
                : _imageFile != null && listdata.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Result IS : ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            listdata.first['class'],
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        'THE MODEL HAS NOT BEEN PREDICTED',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              child: Stack(
                children: [
                  Container(
                    height: 35,
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
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                      ),
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

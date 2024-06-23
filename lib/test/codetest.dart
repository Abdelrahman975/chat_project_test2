// // Function to upload image to the server and get response
//   Future<void> upload() async {
//     setState(() {
//       _isUploading = true;
//     });

//     var request = http.MultipartRequest("POST", Uri.parse(url));
//     final header = {"Content-Type": "multipart/form-data"};
//     request.files.add(http.MultipartFile(
//         'file', _imageFile!.readAsBytes().asStream(), _imageFile!.lengthSync(),
//         filename: _imageFile!.path.split('/').last));
//     request.headers.addAll(header);

//     final myRequest = await request.send();
//     http.Response res = await http.Response.fromStream(myRequest);

//     if (myRequest.statusCode == 200) {
//       setState(() {
//         listdata = List<Map<String, dynamic>>.from(jsonDecode(res.body));
//         if (listdata.isNotEmpty) {
//           // Update progress with the second value from listdata
//           if (listdata.length > 1 && listdata[1].values.first is double) {
//             _progress = listdata[1].values.first;
//             print(_progress);
//           }
//         }
//       });
//       print("response here: $listdata");
//       for (var item in listdata) {
//         item.forEach((key, value) {
//           print("$key: $value");
//         });
//       }
//     } else {
//       print("Error ${myRequest.statusCode}");
//     }

//     setState(() {
//       _isUploading = false;
//     });
//   }
// ignore_for_file: library_private_types_in_public_api

import 'package:chat_project_test2/constant.dart';
import 'package:flutter/material.dart';
// import 'notifications_screen.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({super.key});

  @override
  _AddPatientPageState createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  String firstName = '';
  String lastName = '';
  int? age;
  int? day;
  int? month;
  int? year;
  String? gender;
  String? relation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Add A Patient'),
        backgroundColor: KprimaryColor2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'First Name',
                labelText: 'First Name',
              ),
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
            ),
            const SizedBox(height: 40.0),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Last Name (Optional)',
                labelText: 'Last Name (Optional)',
              ),
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Age',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        age = int.tryParse(value);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                const Text('Day',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        day = int.tryParse(value);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                const Text('Month',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        month = int.tryParse(value);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                const Text('Year',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        year = int.tryParse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Gender',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  activeColor: KprimaryColor2,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                const Text('Male'),
                Radio(
                  value: 'Female',
                  groupValue: gender,
                  activeColor: KprimaryColor2,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                const Text('Female'),
                Radio(
                  value: 'Others',
                  groupValue: gender,
                  activeColor: KprimaryColor2,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                const Text('Others'),
              ],
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Relation',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Self',
                labelText: 'Self',
                suffixIconColor: Colors.black,
                suffixIcon: Icon(Icons.list),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const Notifications()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KprimaryColor2,
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 150.0),
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: ElevatedButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //         // Navigator.push(
      //         //   context,
      //         //   MaterialPageRoute(builder: (context) => const Notifications()),
      //         // );
      //       },
      //       style: ElevatedButton.styleFrom(
      //         backgroundColor: KprimaryColor2,
      //       ),
      //       child: const Text('Save'),
      //     ),
      //   ),
      // ),
    );
  }
}

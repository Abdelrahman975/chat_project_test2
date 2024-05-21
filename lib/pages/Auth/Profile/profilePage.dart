// ignore_for_file: missing_required_param, non_constant_identifier_names, prefer_const_constructors_in_immutables, file_names

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:chat_project_test2/pages/Auth/model/user_detals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../constant.dart';

import '../../notifications_screen.dart';
// import '../services/authFirebaseMesthodes.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  static String id = 'Profile Page';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<FormState> formkey = GlobalKey();
  final currentUser = FirebaseAuth.instance.currentUser!;

  // UserModel? userData;

  String? email;
  String? user_name;
  String? password;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    setState(() {
      isLoading = true;
    });
    // userData = await AuthMethods().getUserData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: KprimaryColor,
          title: const Center(
              child: Text(
            'Edit Profile',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          )),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Notifications.id);
                // Handle notifications button press
              },
              icon: const Icon(Icons.notifications),
            )
          ],
        ),
        backgroundColor: KprimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 85,
                        backgroundImage:
                            AssetImage('assets/images/person1.png'),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: KprimaryColor,
                              borderRadius: BorderRadius.circular(60)),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 28, // adjust the size as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  initialValue: 'User Name',
                  onChanged: (data) {
                    user_name = data;
                  },
                  hintText: currentUser.displayName,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  initialValue: 'userData?.phone,',
                  onChanged: (data) {
                    user_name = data;
                  },
                  hintText: ' Phone Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  initialValue: 'userData?.email,',
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: ' Email',
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomFormTextField(
                  iconss: IconButton(
                    icon: const Icon(Icons.remove_red_eye_rounded),
                    onPressed: () {},
                  ),
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: ' Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtom(
                  titel: 'Edit',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: 'Joined ',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                              text: '25 May 2024',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14))
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.withOpacity(.1),
                          elevation: 0,
                          foregroundColor: Colors.red,
                          shape: const StadiumBorder(),
                          side: BorderSide.none),
                      child: const Text('Delete'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: missing_required_param, non_constant_identifier_names, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../constant.dart';

import '../../notifications_screen.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  static String id = 'Profile Page';

  @override
  State<ProfilePage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<ProfilePage> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email;
  String? user_name;
  String? password;

  bool isLoading = false;

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
                  onChanged: (data) {
                    user_name = data;
                  },
                  hintText: ' User Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    user_name = data;
                  },
                  hintText: ' Phone Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
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

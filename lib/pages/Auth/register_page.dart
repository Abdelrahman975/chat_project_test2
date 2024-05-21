// ignore_for_file: missing_required_param, unnecessary_nullable_for_final_variable_declarations, use_build_context_synchronously, avoid_print, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constant.dart';
import '../../helper/show_snack_bar.dart';
import 'services/authFirebaseMesthodes.dart';
import 'widget/custom_button.dart';
import 'widget/custom_text_field.dart';
import '../home/home_view.dart';
import 'login_page.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static String id = 'Register Page';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey = GlobalKey();

  final AuthMethods _authMethods = AuthMethods();

  // Future signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   if (googleUser == null) {
  //     return; //====================
  //   }

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   Navigator.of(context).pushReplacementNamed(HomeView.id, arguments: email);
  //   showSnackMassage(context, 'success');
  // }

  Future regesterfirebase() async {
    if (formkey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      try {
        // ignore: unused_local_variable
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );

        FirebaseFirestore.instance.collection('users').doc(email).set({
          'email': email ?? 'noexist',
          'password': password ?? 'not exist',
          'name': user_name ?? 'not exist',
          'phone': phone ?? 'not exist',
        }, SetOptions(merge: true));
        showSnackMassage(context, 'success');
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        Navigator.of(context)
            .pushReplacementNamed(LoginPage.id, arguments: email);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          showSnackMassage(context, 'The password provided is too weak.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'The password provided is too weak.',
          ).show();
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          showSnackMassage(
              context, 'The account already exists for that email.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'The account already exists for that email.',
          ).show();
        }
      } catch (e) {
        print(e);
        showSnackMassage(context, 'there was an error');
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: 'there was an error',
        ).show();
      }
      isLoading = false;
      setState(() {});
    } else {}
  }

  String? email;
  String? user_name;
  String? password;
  String? phone;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KprimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  klogo,
                  height: 150,
                ),
                const SizedBox(
                  height: 70,
                ),
                const Row(
                  children: [
                    Text(
                      'REGISER',
                      style: TextStyle(
                        fontSize: 25,
                        color: KprimaryColor3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    user_name = data;
                  },
                  hintText: 'Create User Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    phone = data;
                  },
                  hintText: 'Enter Phone Number',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Enter Email',
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
                  hintText: 'Create Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtom(
                  onTap: () {
                    regesterfirebase();
                  },
                  titel: 'Register',
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Color(0xff606162),
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginPage.id);
                      },
                      child: const Text(
                        '  LogIn',
                        style: TextStyle(
                          fontSize: 16,
                          color: KprimaryColor3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 110,
                      height: 1,
                      color: Colors.grey[900],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Container(
                      width: 110,
                      height: 1,
                      color: Colors.grey[900],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtomImage(
                  titel: 'Register With Google',
                  Imgaess: 'assets/images/Google__G__logo.svg.png',
                  onTap: () async {
                    bool result = await _authMethods.signInWithGoogle();
                    if (result) {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeView.id, arguments: email);
                      showSnackMassage(context, 'success');
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

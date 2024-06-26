// ignore_for_file: missing_required_param, avoid_print, use_build_context_synchronously, prefer_const_constructors_in_immutables, unnecessary_nullable_for_final_variable_declarations

import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constant.dart';
import '../../helper/show_snack_bar.dart';
import 'services/authFirebaseMesthodes.dart';
import 'widget/custom_button.dart';
import 'widget/custom_text_field.dart';
import 'register_page.dart';
import '../home/home_view.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'Login Page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
  //   Navigator.of(context).pushReplacementNamed(HomeView.id, arguments: email1);
  //   showSnackMassage(context, 'success');
  // }

  Future loginfierbase() async {
    if (formkey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email1!, password: password1!);
        showSnackMassage(context, 'success');
        if (credential.user!.emailVerified) {
          Navigator.of(context)
              .pushReplacementNamed(HomeView.id, arguments: email1);
        } else {
          showSnackMassage(context, 'Verified your Email');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            title: 'Warning',
            desc: 'Verified your Email',
          ).show();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          showSnackMassage(context, 'No user found for that email.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'No user found for that email.',
          ).show();
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          showSnackMassage(context, 'Wrong password provided for that user.');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'Wrong password provided for that user.',
          ).show();
        }
      } catch (e) {
        print(e);
        showSnackMassage(context, 'there was an error');
      }
      isLoading = false;
      setState(() {});
    } else {}
  }

  String? password1, email1;

  bool isLoading = false;
  bool _isObscure = true;

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
                  height: 100,
                ),
                Image.asset(
                  klogo,
                  height: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25,
                        color: KprimaryColor3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    email1 = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormTextField(
                  iconss: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  obscureText: _isObscure,
                  onChanged: (data) {
                    password1 = data;
                  },
                  hintText: 'Password',
                ),
                InkWell(
                  onTap: () async {
                    if (email1 == null) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc:
                            'Please write your e-mail and then click on Forgot Password',
                      ).show();
                      return;
                    }
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email1!);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.infoReverse,
                        animType: AnimType.rightSlide,
                        title: 'Info',
                        desc:
                            'A link to reset your password has been sent to your email',
                      ).show();
                    } catch (e) {
                      print(e);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'Please make sure that the email is correct',
                      ).show();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    alignment: Alignment.topRight,
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Color(0xff606162),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtom(
                  onTap: () {
                    loginfierbase();
                  },
                  titel: 'LogIn',
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account ?',
                      style: TextStyle(
                        color: Color(0xff606162),
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterPage.id);
                      },
                      child: const Text(
                        '  Register',
                        style: TextStyle(
                          fontSize: 16,
                          color: KprimaryColor3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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
                  titel: 'Login With Google',
                  Imgaess: 'assets/images/Google__G__logo.svg.png',
                  onTap: () async {
                    bool result = await _authMethods.signInWithGoogle();
                    if (result) {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeView.id, arguments: email1);
                      showSnackMassage(context, 'success');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// if (formkey.currentState!.validate()) {
//                       isLoading = true;
//                       setState(() {});
//                       try {
//                         final credential = await FirebaseAuth.instance
//                             .signInWithEmailAndPassword(
//                                 email: email!, password: password!);
//                         showSnackMassage(context, 'success');
//                         if (credential.user!.emailVerified) {
//                           Navigator.of(context).pushReplacementNamed(
//                               HomeView.id,
//                               arguments: email);
//                         } else {
//                           showSnackMassage(context, 'Verified your Email');
//                           AwesomeDialog(
//                             context: context,
//                             dialogType: DialogType.warning,
//                             animType: AnimType.rightSlide,
//                             title: 'Warning',
//                             desc: 'Verified your Email',
//                           ).show();
//                         }
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == 'user-not-found') {
//                           print('No user found for that email.');
//                           showSnackMassage(
//                               context, 'No user found for that email.');
//                           AwesomeDialog(
//                             context: context,
//                             dialogType: DialogType.error,
//                             animType: AnimType.rightSlide,
//                             title: 'Error',
//                             desc: 'No user found for that email.',
//                           ).show();
//                         } else if (e.code == 'wrong-password') {
//                           print('Wrong password provided for that user.');
//                           showSnackMassage(context,
//                               'Wrong password provided for that user.');
//                           AwesomeDialog(
//                             context: context,
//                             dialogType: DialogType.error,
//                             animType: AnimType.rightSlide,
//                             title: 'Error',
//                             desc: 'Wrong password provided for that user.',
//                           ).show();
//                         }
//                       } catch (e) {
//                         print(e);
//                         showSnackMassage(context, 'there was an error');
//                       }
//                       isLoading = false;
//                       setState(() {});
//                     } else {}
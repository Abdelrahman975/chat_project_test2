// ignore_for_file: avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user_detals.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User get user => _auth.currentUser!;

  Future<bool> signInWithGoogle() async {
    bool result = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          // add the data to fire base
          await _firestore.collection('users').doc(user.email).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
            'email': user.email,
            'phone': user.phoneNumber,
          });
        }
        result = true;
      }
      return result;
    } catch (e) {
      print(e);
    }
    return result;
  }

  void signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print('can not signOut as : $e');
    }
  }

  Future<UserModel> getUserData() async {
    final DocumentSnapshot doc =
        await _firestore.collection('users').doc(user.email).get();
    return UserModel.fromDocumentSnapshot(doc);
  }

  Future<void> updateUserData({
    required String email,
    required String username,
    required String phone,
  }) async {
    await _firestore.collection('users').doc(user.email).update({
      'username': username,
      'phone': phone,
    });
  }
}

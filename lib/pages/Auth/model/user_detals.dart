import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  // final String profilePhoto;
  final String email;
  final String phone;
  final String password;
  // final DateTime createdAt;

  UserModel({
    required this.username,
    // required this.profilePhoto,
    required this.email,
    required this.phone,
    required this.password,
    // required this.createdAt,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserModel(
      username: doc['name'],
      password: doc['password'],
      // profilePhoto: doc['profilePhoto'],
      email: doc['email'],
      phone: doc['phone'],
      // createdAt: doc['createdAt'].toDate(),
    );
  }
}

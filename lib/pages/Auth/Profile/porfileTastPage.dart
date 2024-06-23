import 'package:chat_project_test2/constant.dart';
import 'package:chat_project_test2/pages/Auth/widget/text_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ProfileTastPage extends StatefulWidget {
  const ProfileTastPage({super.key});
  static String id = 'Profile Tast Page';
  @override
  State<ProfileTastPage> createState() => _ProfileTastPageState();
}

class _ProfileTastPageState extends State<ProfileTastPage> {
  // user
  final currentUser = FirebaseAuth.instance.currentUser!;
  // all users
  final usersCollection = FirebaseFirestore.instance.collection('users');

  String? imageUrl;

  @override
  void initState() {
    super.initState();
    _loadUserImage();
  }

  Future<void> _loadUserImage() async {
    DocumentSnapshot userDoc =
        await usersCollection.doc(currentUser.email).get();
    if (userDoc.exists && userDoc.data() != null) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      setState(() {
        imageUrl = userData['imageUrl'];
      });
    }
  }

  Future<void> _pickAndUploadImage() async {
    if (FirebaseAuth.instance.currentUser == null) {
      // Prompt the user to sign in
      return;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    final File imageFile = File(pickedFile.path);

    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${currentUser.email}.jpg');

      await storageRef.putFile(imageFile);

      final String downloadUrl = await storageRef.getDownloadURL();

      await usersCollection
          .doc(currentUser.email)
          .update({'imageUrl': downloadUrl});

      setState(() {
        imageUrl = downloadUrl;
      });
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> editField(String field) async {
    String newValue = '';
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          'Edit $field',
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter new $field',
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // cancel button
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          // save button
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );

    // update in firestore
    if (newValue.trim().length > 0) {
      // only update if there is something in the textfield
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,
      appBar: AppBar(
        title: const Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: KprimaryColor,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          // get user data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No user data found.'));
          }
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 85,
                        backgroundColor: Colors.grey[200],
                        child: imageUrl == null
                            ? const CircularProgressIndicator()
                            : CircleAvatar(
                                radius: 80,
                                backgroundImage: imageUrl != null
                                    ? NetworkImage(imageUrl!)
                                    : const AssetImage(
                                            'assets/images/person1.png')
                                        as ImageProvider,
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: _pickAndUploadImage,
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 28, // adjust the size as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  currentUser.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                MyTextBox(
                  text: userData['name'] ?? '',
                  sectionName: 'User Name',
                  onPressed: () => editField('name'),
                ),
                MyTextBox(
                  text: userData['phone'] ?? '',
                  sectionName: 'Phone Number',
                  onPressed: () => editField('phone'),
                ),
                const SizedBox(height: 50),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

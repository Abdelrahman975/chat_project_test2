import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../constant.dart';
import '../../All Doctor/All_Doctor_pages/all_doctors_list_views_builder.dart';
import '../../Auth/Profile/profilePage.dart';
import '../../Auth/login_page.dart';
import '../../Chat/Chat_AI_Genret/AI_chatbot.dart';
import '../../Chat/Gemini_chat/gemini_chats_screen.dart';
import '../../NewaTest1/screens/News_page.dart';
import '../../Reminder/reminder_page1.dart';
import '../../mri.dart';
import '../home_view.dart';

class Drawer_widget extends StatelessWidget {
  const Drawer_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: KprimaryColor2,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/person1.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: KprimaryColor2,
                            borderRadius: BorderRadius.circular(40)),
                        child: Icon(
                          Icons.settings,
                          size: 24, // adjust the size as needed
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Abdo Mansour',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'abdo123@gmail.com',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        color: KprimaryColor,
        padding: EdgeInsets.all(20),
        child: Wrap(
          runSpacing: 5,
          children: [
            ListTileDrawer(
              Image: "assets/images/icons8-home-48.png",
              NameTitle: 'HOME',
              PageNavigator: HomeView.id,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 1,
                  width: 80,
                  color: Colors.grey[300],
                ),
                Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 1,
                  width: 80,
                  color: Colors.grey[300],
                ),
              ],
            ),
            ListTileDrawer(
              Image: "assets/images/AI_Chatbot.png",
              NameTitle: 'AI CHATBOT',
              PageNavigator: Ai_ChatBot.id,
            ),
            ListTileDrawer(
              Image: "assets/images/icons8-brain-64.png",
              NameTitle: 'Alzaheimer MRI',
              PageNavigator: MRI_Page.id,
            ),
            ListTileDrawer(
              Image: "assets/images/icons8-chatbot-64.png",
              NameTitle: 'ChatBot',
              PageNavigator: GeminiChatScreen.id,
            ),
            ListTileDrawer(
              Image: "assets/images/icons8-reminder-50.png",
              NameTitle: 'Reminder',
              PageNavigator: Reminder_page1.id,
            ),
            ListTileDrawer(
              Image: "assets/images/icons8-nurse-50.png",
              NameTitle: 'Doctors',
              PageNavigator: AllDoctorsViewBuilder.id,
            ),
            ListTileDrawer(
              Image: "assets/images/icons8-news-50.png",
              NameTitle: 'News',
              PageNavigator: News_page.id,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            ListTile(
              horizontalTitleGap: 12,
              leading: CircleAvatar(
                backgroundColor: KprimaryColor,
                radius: 13,
                backgroundImage:
                    AssetImage('assets/images/icons8-logout-64.png'),
              ),
              title: Text('LogOut'),
              onTap: () async {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  headerAnimationLoop: false,
                  animType: AnimType.bottomSlide,
                  title: 'LogOut',
                  desc: 'Are You sure to Logout ?',
                  buttonsTextStyle: const TextStyle(color: Colors.black54),
                  showCloseIcon: true,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    GoogleSignIn googleSignIn = GoogleSignIn();
                    googleSignIn.disconnect();
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginPage.id, (route) => false);
                  },
                ).show();
              },
            ),
          ],
        ),
      );
}

class ListTileDrawer extends StatelessWidget {
  ListTileDrawer({
    required this.Image,
    required this.NameTitle,
    required this.PageNavigator,
  });
  String? Image;
  String? NameTitle;
  String? PageNavigator;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 12,
      leading: CircleAvatar(
        backgroundColor: KprimaryColor,
        radius: 14,
        backgroundImage: AssetImage(Image!),
      ),
      title: Text(NameTitle!),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(PageNavigator!);
      },
    );
  }
}


// ListTile(
//               horizontalTitleGap: 12,
//               leading: CircleAvatar(
//                 backgroundColor: KprimaryColor,
//                 radius: 13,
//                 backgroundImage:
//                     AssetImage('assets/images/icons8-reminder-50.png'),
//               ),
//               title: Text('Reminder'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => Reminder_page1()));
//               },
//             ),






// {
                
//                 GoogleSignIn googleSignIn = GoogleSignIn();
//                 googleSignIn.disconnect();
//                 await FirebaseAuth.instance.signOut();
//                 Navigator.of(context)
//                     .pushNamedAndRemoveUntil(LoginPage.id, (route) => false);
//               },
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import 'Auth/login_page.dart';

class AnimatedSplashPage extends StatelessWidget {
  const AnimatedSplashPage({super.key});
  static String id = 'Splash Page';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: KprimaryColor,
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        splash: Image.asset(
          klogo,
          width: 500,
          height: 500,
        ),
        nextScreen: LoginPage());
  }
}

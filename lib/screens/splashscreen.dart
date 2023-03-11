import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../main.dart';

// Splash Screen
class SplashSrc extends StatefulWidget {
  const SplashSrc({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashSrcState createState() => _SplashSrcState();
}

class _SplashSrcState extends State<SplashSrc> {
  @override
  Widget build(BuildContext context) {
    // Adaptive size
    Size s = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      splash: Image.asset(
        "assets/icons/appicon.png",
        width: s.width * 0.3,
        height: s.width * 0.5,
        fit: BoxFit.fill,
      ),
      nextScreen: const MyHomePage(title: "Home screen"),
      duration: 100,
      backgroundColor: primarycolor,
      splashTransition: SplashTransition.slideTransition,
      // pageTransitionType: PageTransitionType.fade,
    );
  }
}

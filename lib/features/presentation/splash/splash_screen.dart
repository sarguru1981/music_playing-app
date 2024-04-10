import 'dart:async';

import 'package:flutter/material.dart';

import 'package:music_app/util/color.dart';

class _Constants {
  static const String logoImage = "assets/images/logo_image.png";
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, '/authentication');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset(_Constants.logoImage),
        ),
      ),
    );
  }
}

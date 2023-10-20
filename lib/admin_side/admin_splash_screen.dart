import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'admin_dashboard/Admin_nev_bar.dart';

class AdminSplashScreen extends StatefulWidget {
  const AdminSplashScreen({super.key});

  @override
  State<AdminSplashScreen> createState() => _AdminSplashScreenState();
}

class _AdminSplashScreenState extends State<AdminSplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const AdminNevBar()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter:
                const ColorFilter.mode(Colors.black45, BlendMode.darken),
            child: Image.asset(
              'images/AdminSplashScreen.jpeg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/UomLogo.png',
                  height: 160,
                  width: 160,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Proctorial Board',
                      textStyle: GoogleFonts.chelaOne(
                          color: Colors.yellow.shade500,
                          fontSize: 30,
                          fontWeight: FontWeight.w200),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/api/api.dart';
import 'package:we_chat/main.dart';
import 'package:we_chat/screens/auth/login_screen.dart';
import 'package:we_chat/screens/homepage.dart';

// ignore: camel_case_types
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

// ignore: camel_case_types
class _Splash_ScreenState extends State<Splash_Screen> {
  bool isAnimate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (Apis.firebaseAuth.currentUser != null) {
       
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Login_Screen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
              top: mq.height * .15,
              right: mq.width * .25,
              width: mq.width * .5,
              duration: const Duration(seconds: 1),
              child: Image.asset("images/login_chat.png")),
          Positioned(
              bottom: mq.height * .15,
              left: mq.width * .3,
              child: const Text(
                "MADE IN INDIA ❤️❤️❤️",
                //textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: .5,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              )),
        ],
      ),
    );
  }
}

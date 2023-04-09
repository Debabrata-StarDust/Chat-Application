import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:we_chat/Helper/snakber.dart';
import 'package:we_chat/main.dart';
import 'package:we_chat/screens/homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: camel_case_types
class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

// ignore: camel_case_types
class _Login_ScreenState extends State<Login_Screen> {
  bool isAnimate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isAnimate = true;
      });
    });
  }

  googleSigning() {
    //for showing progress bar
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) {
      //for hiding progress bar
      Navigator.pop(context);
      if (user != null) {
        //log("User Details:${user.user}");
        print("User Detail:====" + user.toString());
        print("Additional user information:====" +
            user!.additionalUserInfo.toString());
        // log("\n UserAdditionalInformation:${user.additionalUserInfo}" as num);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    // Trigger the authentication flow

    try {
      await InternetAddress.lookup("google.com");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("_signInWithGoogle" + e.toString());
    }
    // ignore: use_build_context_synchronously
    Dialogs.showSnackbar(context, "Please check the Internet");
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Welcome to We Chat"),
      ),
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
              top: mq.height * .15,
              right: isAnimate ? mq.width * .25 : -mq.width * .5,
              width: mq.width * .5,
              duration: const Duration(seconds: 1),
              child: Image.asset("images/login_chat.png")),
          Positioned(
              bottom: mq.height * .15,
              left: mq.width * .05,
              width: mq.width * .9,
              height: mq.height * .07,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 129, 248, 190),
                      shape: const StadiumBorder(),
                      elevation: 1),
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomePage()));
                    googleSigning();
                  },
                  icon: Image.asset(
                    "images/google.png",
                    height: mq.height * .04,
                  ),
                  label: RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 19),
                          children: [
                        TextSpan(text: "Log In with "),
                        TextSpan(
                            text: "Google",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])))),
        ],
      ),
    );
  }
}

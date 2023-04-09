import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/screens/splash_screen.dart';
import 'firebase_options.dart';

// Global access for using media query
late Size mq;

void main() {
  // is using for flutter binding else get error in
  WidgetsFlutterBinding.ensureInitialized();
  firebaseInitialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 1,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 19),
              backgroundColor: Colors.white)),
      home: Splash_Screen(),
    );
  }
}

firebaseInitialize() async {
  var firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}


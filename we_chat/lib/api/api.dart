import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Apis {
  //for firebase Authentication instance
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // for firebase cloud space instance
  static FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
}

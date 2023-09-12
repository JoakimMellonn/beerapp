import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  UserCredential? _userCredential;

  Future signIn() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      _userCredential = userCredential;
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error. $e");
      }
    }
  }
}
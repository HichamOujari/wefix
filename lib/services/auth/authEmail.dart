import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth extends ChangeNotifier {
  Future signUp(email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future signIn(email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future loggout() async {
    FirebaseAuth.instance.signOut();
  }
}

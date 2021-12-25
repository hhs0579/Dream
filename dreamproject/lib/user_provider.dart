import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    initUser();
  }
  User? _user;
  void initUser() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _user = user;
      print('로그인 됨');
      notifyListeners();
    });
  }

  User? get user => _user;
}

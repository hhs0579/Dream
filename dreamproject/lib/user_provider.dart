import 'package:dreamproject/constants/shared_pref_keys.dart';
import 'package:dreamproject/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    initUser();
  }
  User? _user;
  void initUser() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _user = user;
      logger.d('user status - $user');
      print('로그인 됨');
      notifyListeners();
    });
  }

  void _setNewUser(User? user) async {
    _user = user;
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String address = prefs.getString(SHARED_ADDRESS) ?? "";
    }
  }

  User? get user => _user;
}

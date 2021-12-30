import 'package:dreamproject/constants/shared_pref_keys.dart';
import 'package:dreamproject/data/user_model.dart';
import 'package:dreamproject/repo/user_service.dart';
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
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      _setNewUser(user);
      notifyListeners();
    });
  }

  void _setNewUser(User? user) async {
    _user = user;
    if (user != null && user.phoneNumber != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String address = prefs.getString(SHARED_ADDRESS) ?? "";
      String phoneNumber = user.phoneNumber!;
      String userKey = user.uid;
      String name = prefs.getString(SHARED_NAME) ?? "";
      String id = prefs.getString(SHARED_ID) ?? "";
      String password = prefs.getString(SHARED_PASSWORD) ?? "";
      String sex = prefs.getString(SHARED_SEX) ?? "";

      UserModel userModel = UserModel(
          userKey: userKey,
          id: id,
          password: password,
          name: name,
          sex: sex,
          phoneNumber: phoneNumber,
          address: address,
          createDate: DateTime.now().toUtc());
      await UserService().createNewUser(userModel.toJson(), userKey);
    }
  }

  User? get user => _user;
}

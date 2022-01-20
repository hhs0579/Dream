import 'dart:developer';

import 'package:dreamproject/controller/database_controller.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'local_storage_controller.dart';

AuthController authController = AuthController();

class AuthController {
  Future<String?> authUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      localStorageController.setUserEmail(email);
      String? pushToken = await getToken();
      if (pushToken != null) {
        databaseController.updatePushToken(
          email: email,
          pushToken: pushToken,
        );
      }
      await databaseController.fetchMyInfo(email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'Wrong password provided for that user.';
      } else {
        print(e);
        return e.toString();
      }
    }
  }

  Future<Null> handleSignOut() async {
    await localStorageController.setUserEmail('');
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> isSigned() async {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}

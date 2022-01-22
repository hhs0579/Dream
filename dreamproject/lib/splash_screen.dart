import 'dart:async';
import 'package:dreamproject/controller/auth_controller.dart';
import 'package:dreamproject/controller/database_controller.dart';
import 'package:dreamproject/controller/local_storage_controller.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/home_page.dart';
import 'package:dreamproject/screens/starts/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(Duration(milliseconds: 1500), () {
      _checkDatabase();
    });
  }

  _checkDatabase() {
    _checkLocalInfo();
  }

  void _checkLocalInfo() async {
    String? userEmail = await localStorageController.getUserEmail();
    if (userEmail == null) {
      Get.off(() => LoginPage());
    } else {
      if (userEmail == '') {
        Get.off(() => LoginPage());
      } else {
        AppData appData = Get.find();
        appData.userEmail = userEmail;
        await databaseController.fetchMyInfo(userEmail);
        String? pushToken = await authController.getToken();
        if (pushToken != null) {
          databaseController.updatePushToken(
            email: userEmail,
            pushToken: pushToken,
          );
        }
        print('success');
        Get.off(() => HomePage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/imgs/cloud.png'),
      )),
    );
  }
}

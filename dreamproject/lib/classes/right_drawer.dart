import 'package:dreamproject/controller/auth_controller.dart';
import 'package:dreamproject/repo/auth_service.dart';
import 'package:dreamproject/screens/starts/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final AuthService _auth = AuthService();

drawer(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 2,
    child: Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('드림소개', textAlign: TextAlign.center),
            onTap: () {},
          ),
          ListTile(
            title: Text('이용방법', textAlign: TextAlign.center),
            onTap: () {},
          ),
          ListTile(
            title: Text('''카카오톡 플친
        전화 010-0000-0000''', textAlign: TextAlign.center),
            onTap: () {},
          ),
          ListTile(
            title: Text('로그아웃', textAlign: TextAlign.center),
            onTap: () async {
              await authController.handleSignOut();
              Get.offAll(() => LoginPage());
            },
          ),
        ],
      ),
    ),
  );
}

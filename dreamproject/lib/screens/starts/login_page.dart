import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/controller/auth_controller.dart';
import 'package:dreamproject/data/address_model.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/controller/database_controller.dart';
import 'package:dreamproject/controller/local_storage_controller.dart';
import 'package:dreamproject/home_page.dart';
import 'package:dreamproject/repo/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'join_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

var user = FirebaseAuth.instance.currentUser;
final AuthService _auth = AuthService();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

String email = "";
String password = "";

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/imgs/cloud.png'),
      ),
    );

    final id = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onChanged: (value) {
        email = value;
      },
      decoration: InputDecoration(
        hintText: '아이디',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final pw = TextFormField(
      autofocus: false,
      obscureText: true,
      onChanged: (value) {
        password = value;
      },
      decoration: InputDecoration(
        hintText: '비밀번호',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.all(12),
        ),
        onPressed: () async {
          await authController.authUser(email, password);
          Get.offAll(HomePage());
        },
        child: Text('로그인', style: TextStyle(color: Colors.white)),
      ),
    );
    final joinButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.all(12),
        ),
        onPressed: () {
          Get.to(JoinPage());
        },
        child: Text('회원가입', style: TextStyle(color: Colors.white)),
      ),
    );
    final forgot = TextButton(
      child: Text(
        '아이디 찾기/비밀번호 찾기',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 50.0),
            id,
            SizedBox(height: 10.0),
            pw,
            SizedBox(height: 25.0),
            loginButton,
            joinButton,
            forgot,
          ],
        ),
      ),
    );
  }
}

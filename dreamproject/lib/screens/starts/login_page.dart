import 'package:dreamproject/classes/toast_message.dart';
import 'package:dreamproject/controller/auth_controller.dart';
import 'package:dreamproject/home_page.dart';
import 'package:dreamproject/repo/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'join_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var user = FirebaseAuth.instance.currentUser;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "";
  String password = "";

  @override
  void initState() {
    emailController.text = '';
    passwordController.text = '';
    super.initState();
  }

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
      controller: emailController,
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
      controller: passwordController,
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
          if (emailController.text == '') {
            toastMessage("이메일을 입력해주세요.");
          } else {
            if (passwordController.text == '') {
              toastMessage("비밀번호를 입력해주세요.");
            } else {
              if (await authController.authUser(email, password) == null) {
                Get.offAll(() => HomePage());
              }
            }
          }
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

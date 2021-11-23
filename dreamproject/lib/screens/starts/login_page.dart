import 'package:dreamproject/screens/pages/feed.dart';
import 'package:flutter/material.dart';




class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

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

      decoration: InputDecoration(
        hintText: '아이디',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,

      obscureText: true,
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
          shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
         padding: EdgeInsets.all(12),
        ),

        onPressed: () {
          Navigator.of(context).pushNamed(Feed.tag);
        },
       
        child: Text('로그인', style: TextStyle(color: Colors.white)),
      ),
    );
     final joinButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        primary: Colors.lightBlueAccent,
          shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
         padding: EdgeInsets.all(12),
        ),

        onPressed: () {
          Navigator.of(context).pushNamed(Feed.tag);
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
            password,
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

import 'package:dreamproject/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/pages/feed.dart';
import 'screens/starts/login_page.dart';
import 'screens/starts/join_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    JoinPage.tag: (context) => JoinPage(),
  };

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '드림기부앱',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}

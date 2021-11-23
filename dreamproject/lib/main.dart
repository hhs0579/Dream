import 'package:flutter/material.dart';
import 'screens/pages/feed.dart';
import 'screens/starts/login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    Feed.tag: (context) => Feed(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '드림기부앱',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}

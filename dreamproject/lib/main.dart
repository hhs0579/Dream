import 'package:dreamproject/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/homepage_controller.dart';
import 'screens/pages/feed.dart';
import 'screens/starts/login_page.dart';
import 'screens/starts/join_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final routes = <String, WidgetBuilder>{};

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '드림기부앱',
      initialBinding: BindingsBuilder(() {
        Get.put(HomePageController());
      }),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}

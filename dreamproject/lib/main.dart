import 'package:dreamproject/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/homepage_controller.dart';
import 'screens/pages/feed.dart';
import 'screens/starts/login_page.dart';
import 'screens/starts/join_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final Future<FirebaseApp> _initialization = Firebase.initializeApp();

class _MyAppState extends State<MyApp> {
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

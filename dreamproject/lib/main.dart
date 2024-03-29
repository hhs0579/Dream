import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'controller/homepage_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

// final Future<FirebaseApp> _initialization = Firebase.initializeApp();

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _splashLoadingWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print('error occur while loading');
      return Text('error occur');
    } else if (snapshot.hasData) {
      Get.put(AppData());
      return DreamApp();
    } else {
      Get.put(AppData());
      return DreamApp();
    }
  }
}

class DreamApp extends StatelessWidget {
  DreamApp({Key? key}) : super(key: key);
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
      home: SplashScreen(),
      routes: routes,
    );
  }
}

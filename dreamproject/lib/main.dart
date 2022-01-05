import 'package:dreamproject/home_page.dart';
import 'package:dreamproject/repo/auth_service.dart';
import 'package:dreamproject/repo/user.dart';
import 'package:dreamproject/warpper.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
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
      return DreamApp();
    } else {
      return DreamApp();
    }
  }
}

class DreamApp extends StatelessWidget {
  DreamApp({Key? key}) : super(key: key);
  final routes = <String, WidgetBuilder>{};
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: GetMaterialApp(
        title: '드림기부앱',
        initialBinding: BindingsBuilder(() {
          Get.put(HomePageController());
        }),
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Wrapper(),
        routes: routes,
      ),
    );
  }
}

import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'controller/homepage_controller.dart';
import 'package:timeago/timeago.dart';

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

class TimeUtil {
  static setLocalMessages() {
    setLocaleMessages('ko', KoMessages());
    setLocaleMessages('de', DeMessages());
    setLocaleMessages('fr', FrMessages());
    setLocaleMessages('ja', JaMessages());
    setLocaleMessages('id', IdMessages());
    setLocaleMessages('zh', ZhMessages());
    setLocaleMessages('it', ItMessages());
    setLocaleMessages('fa', FaMessages());
    setLocaleMessages('ru', RuMessages());
    setLocaleMessages('tr', TrMessages());
    setLocaleMessages('pl', PlMessages());
  }

  static String timeAgo({required int milliseconds}) {
    final date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return format(date,
        locale: 'ko', // for test.
        allowFromNow: true);
  }
}

class KoMessages implements LookupMessages {
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => '전';
  String suffixFromNow() => '후';
  String lessThanOneMinute(int seconds) => '방금';
  String aboutAMinute(int minutes) => '방금';
  String minutes(int minutes) => '$minutes분';
  String aboutAnHour(int minutes) => '1시간';
  String hours(int hours) => '$hours시간';
  String aDay(int hours) => '1일';
  String days(int days) => '$days일';
  String aboutAMonth(int days) => '한달';
  String months(int months) => '$months개월';
  String aboutAYear(int year) => '1년';
  String years(int years) => '$years년';
  String wordSeparator() => ' ';
}

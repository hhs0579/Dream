import 'package:dreamproject/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/pages/current.dart';
import 'screens/pages/donate.dart';
import 'screens/pages/empathy.dart';
import 'screens/pages/feed.dart';
import 'screens/pages/my_info.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.homePageIndex.value,
            children: [
              Navigator(
                key: controller.navigatorKey,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(builder: (context) => Feed());
                },
              ),
              Navigator(
                key: controller.navigatorKey2,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(builder: (context) => CurrentPage());
                },
              ),
              Navigator(
                key: controller.navigatorKey3,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(builder: (context) => DonatePage());
                },
              ),
              Navigator(
                key: controller.navigatorKey4,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(builder: (context) => Feed());
                },
              ),
              Navigator(
                key: controller.navigatorKey5,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(builder: (context) => MyInfoPage());
                },
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.homePageIndex.value,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeHomePageIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_list, color: Colors.grey),
                  label: '피드',
                  activeIcon: Icon(Icons.view_list, color: Colors.blue[300])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up, color: Colors.grey),
                  label: '현황',
                  activeIcon: Icon(Icons.trending_up, color: Colors.blue[300])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cloud, color: Colors.grey),
                  label: '후원하기',
                  activeIcon: Icon(Icons.cloud, color: Colors.blue[300])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, color: Colors.grey),
                  label: '공감',
                  activeIcon: Icon(Icons.favorite, color: Colors.blue[300])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.grey),
                  label: '내정보',
                  activeIcon: Icon(Icons.person, color: Colors.blue[300])),
            ],
          ),
        ),
      ),
    );
  }
}

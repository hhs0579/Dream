import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

import '../home_page.dart';

class HomePageController extends GetxController {
  static HomePageController get to => Get.find();
  RxInt homePageIndex = 0.obs;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> navigatorKey2 = GlobalKey<NavigatorState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  RxBool isCategoryPageOpen = false.obs;
  void changeHomePageIndex(int index) {
    homePageIndex(index);
  }

  Future<bool> onWillPop() async {
    return !await navigatorKey.currentState!.maybePop();
  }

  void setCategoryPage(bool ck) {
    isCategoryPageOpen(ck);
  }
}

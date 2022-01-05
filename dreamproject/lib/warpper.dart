import 'package:dreamproject/repo/user.dart';
import 'package:dreamproject/screens/pages/feed.dart';
import 'package:dreamproject/screens/starts/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerUserModel = Provider.of<UserModel?>(context);

    //return either Home or Authenticate widget
    if (providerUserModel == null) {
      return LoginPage();
    } else {
      return Feed();
    }
  }
}

import 'package:dreamproject/classes/circle_button.dart';
import 'package:dreamproject/controller/homepage_controller.dart';
import 'package:dreamproject/repo/auth_service.dart';
import 'package:dreamproject/screens/pages/subpages/feedsub/legal.dart';
import 'package:dreamproject/screens/pages/subpages/feedsub/postcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  final AuthService _auth = AuthService();
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: _scaffoldKey,
          endDrawer: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Drawer(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('드림소개', textAlign: TextAlign.center),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('이용방법', textAlign: TextAlign.center),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('''카카오톡 플친
    전화 010-0000-0000''', textAlign: TextAlign.center),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('로그아웃', textAlign: TextAlign.center),
                    onTap: () async {
                      await _auth.signOut();
                    },
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              'FEED',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(Icons.receipt_long,
                    color: Color(0xff3AAFFC), size: 30),
                onPressed: () {}),
            actions: <Widget>[
              IconButton(
                  icon:
                      Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                  onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
            ],
          ),
          body: Container(
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return PostCard();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: 30),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.all(30),
            child: OutlineCircleButton(
              child: Icon(
                Icons.cloud,
                color: Colors.white,
                size: 30,
              ),
              radius: 50.0,
              borderSize: 0.5,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Legal()));
              },
            ),
          ),
        ),
      ],
    );
  }
}

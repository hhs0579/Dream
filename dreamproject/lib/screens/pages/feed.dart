import 'package:dreamproject/classes/circle_button.dart';
import 'package:dreamproject/data/address_model.dart';
import 'package:dreamproject/screens/pages/subpages/legal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<Widget> _children = [
    Legal(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.receipt_long, color: Colors.blue[300]),
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_vert, color: Colors.blue[300]),
              onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
        ],
      ),
      body: Align(
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
            onTap: () async {
              Get.to(Legal());
            },
          ),
        ),
      ),
    );
  }
}

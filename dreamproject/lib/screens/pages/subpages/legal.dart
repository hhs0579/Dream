import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Legal extends StatelessWidget {
  Legal({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  static String tag = 'legal';

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
        centerTitle: true,
        title: Text('드림파트너'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.close, color: Color(0xff3AAFFC), size: 30),
            onPressed: () {
              Get.back();
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
              onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 30, top: 100, bottom: 100),
                labelText: '법적동의 내용',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

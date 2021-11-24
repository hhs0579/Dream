import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Legal extends StatefulWidget {
  Legal({Key? key}) : super(key: key);
  static String tag = 'legal';

  @override
  State<Legal> createState() => _LegalState();
}

class _LegalState extends State<Legal> {
  var check = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomRight,
        child: Checkbox(
            activeColor: Colors.blue,
            checkColor: Colors.blue,
            value: check,
            onChanged: (value) {
              setState(() {
                check = value!;
              });
            }),
      ),
      resizeToAvoidBottomInset: false,
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
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 60),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 100, bottom: 200),
                  hintText: '법적동의 내용',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

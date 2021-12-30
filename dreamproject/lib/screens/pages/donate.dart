import 'package:dreamproject/screens/pages/feed.dart';
import 'package:dreamproject/screens/pages/subpages/donatesub/regulardonate.dart';
import 'package:dreamproject/screens/pages/subpages/donatesub/temporarydonate.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class DonatePage extends StatelessWidget {
  DonatePage({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            '후원하기',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.close, color: Color(0xff3AAFFC), size: 30),
              onPressed: () {}),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
          ],
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child:
                      Image.asset('assets/imgs/a.png', width: 120, height: 120),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegularDonated()));
                  },
                ),
                InkWell(
                  child:
                      Image.asset('assets/imgs/a.png', width: 120, height: 120),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TemporaryDonated()));
                  },
                )
              ],
            ),
          ],
        ),
      )
    ]);
  }
}

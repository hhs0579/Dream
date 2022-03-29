import 'package:dreamproject/classes/right_drawer.dart';
import 'package:dreamproject/repo/auth_service.dart';
import 'package:dreamproject/screens/pages/subpages/donatesub/regulardonate.dart';
import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  DonatePage({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        key: _scaffoldKey,
        endDrawer: drawer(context),
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
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        child: Image.asset('assets/imgs/done.png',
                            color: Color(0xff3AAFFC), width: 150, height: 120),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegularDonated()));
                        },
                      ),
                      Positioned(
                          top: 55,
                          left: 45,
                          child: Container(
                            width: 60,
                            child: Text("일시 후원",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xff3AAFFC))),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Stack(
                    children: [
                      InkWell(
                        child: Image.asset('assets/imgs/cloud2.png',
                            color: Color(0xff3AAFFC), width: 150, height: 120),
                        onTap: () {},
                      ),
                      Positioned(
                          top: 48,
                          left: 40,
                          child: Container(
                            width: 80,
                            child: Text("후원 \n문의하기",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff3AAFFC))),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}

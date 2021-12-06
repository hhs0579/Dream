import 'package:dreamproject/screens/pages/current.dart';
import 'package:dreamproject/screens/pages/donate.dart';
import 'package:flutter/material.dart';

class RegularDonated extends StatefulWidget {
  RegularDonated({Key? key}) : super(key: key);

  @override
  _RegularDonatedState createState() => _RegularDonatedState();
}

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

class _RegularDonatedState extends State<RegularDonated> {
  var old = false;
  var child = false;
  var disorder = false;
  var multiculture = false;
  var pet = false;
  var poverty = false;

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
              icon: Icon(Icons.arrow_back, color: Color(0xff3AAFFC), size: 30),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DonatePage()));
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '후원 분야',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          color: Colors.black12,
                          width: 300,
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 13),
                              child: Row(
                                children: [
                                  Checkbox(
                                      activeColor: Colors.blue,
                                      checkColor: Colors.white,
                                      value: old,
                                      onChanged: (value) {
                                        setState(() {
                                          old = value!;
                                        });
                                      }),
                                  Text('노인'),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 13),
                              child: Row(
                                children: [
                                  Checkbox(
                                      activeColor: Colors.blue,
                                      checkColor: Colors.white,
                                      value: child,
                                      onChanged: (value) {
                                        setState(() {
                                          child = value!;
                                        });
                                      }),
                                  Text('아동'),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 13),
                              child: Row(
                                children: [
                                  Checkbox(
                                      activeColor: Colors.blue,
                                      checkColor: Colors.white,
                                      value: disorder,
                                      onChanged: (value) {
                                        setState(() {
                                          disorder = value!;
                                        });
                                      }),
                                  Text('장애'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                activeColor: Colors.blue,
                                checkColor: Colors.white,
                                value: multiculture,
                                onChanged: (value) {
                                  setState(() {
                                    multiculture = value!;
                                  });
                                }),
                            Text('다문화'),
                            Checkbox(
                                activeColor: Colors.blue,
                                checkColor: Colors.white,
                                value: pet,
                                onChanged: (value) {
                                  setState(() {
                                    pet = value!;
                                  });
                                }),
                            Text('유기동물'),
                            Checkbox(
                                activeColor: Colors.blue,
                                checkColor: Colors.white,
                                value: poverty,
                                onChanged: (value) {
                                  setState(() {
                                    poverty = value!;
                                  });
                                }),
                            Text('빈곤'),
                          ],
                        ),
                      ],
                    ),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Write extends StatefulWidget {
  Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  var check1 = false;
  var check2 = false;
  var check3 = false;
  var check4 = false;
  var check5 = false;
  var check6 = false;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
          title: Text('작성'),
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
        body: Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.blue,
                            checkColor: Colors.blue,
                            value: check1,
                            onChanged: (value) {
                              setState(() {
                                check1 = value!;
                              });
                            }),
                        Text('노인')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.blue,
                            checkColor: Colors.blue,
                            value: check2,
                            onChanged: (value) {
                              setState(() {
                                check2 = value!;
                              });
                            }),
                        Text('아동')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.blue,
                            checkColor: Colors.blue,
                            value: check3,
                            onChanged: (value) {
                              setState(() {
                                check3 = value!;
                              });
                            }),
                        Text('장애'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15, bottom: 40),
                        margin: EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.blue,
                                checkColor: Colors.blue,
                                value: check4,
                                onChanged: (value) {
                                  setState(() {
                                    check4 = value!;
                                  });
                                }),
                            Text('다문화'),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 28, bottom: 40),
                        margin: EdgeInsets.only(left: 1),
                        child: Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.blue,
                                checkColor: Colors.blue,
                                value: check5,
                                onChanged: (value) {
                                  setState(() {
                                    check5 = value!;
                                  });
                                }),
                            Text('유기동물'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 19, bottom: 40),
                    margin: EdgeInsets.only(right: 7),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.blue,
                            checkColor: Colors.blue,
                            value: check6,
                            onChanged: (value) {
                              setState(() {
                                check6 = value!;
                              });
                            }),
                        Text('빈곤'),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

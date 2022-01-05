import 'dart:math';

import 'package:dreamproject/model/withitem.dart';
import 'package:dreamproject/repo/auth_service.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/area.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/category.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/clublistpage.dart';

import 'package:flutter/material.dart';

class CurrentPage extends StatefulWidget {
  CurrentPage({Key? key}) : super(key: key);

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  final withitem = {
    "list": [
      {
        "image": "assets/imgs/a.png",
        "name": "김땡땡",
        "areaname": "부산",
        "money": "900000원"
      },
      {
        "image": "assets/imgs/a.png",
        "name": "이땡땡",
        "areaname": "경기",
        "money": "800000원"
      },
      {
        "image": "assets/imgs/a.png",
        "name": "황땡땡",
        "areaname": "서울",
        "money": "700000원"
      },
      {
        "image": "assets/imgs/a.png",
        "name": "정땡땡",
        "areaname": "충북",
        "money": "690000원"
      },
      {
        "image": "assets/imgs/a.png",
        "name": "박땡땡",
        "areaname": "부산",
        "money": "500000원"
      },
      {
        "image": "assets/imgs/a.png",
        "name": "강땡땡",
        "areaname": "제주도",
        "money": "300000원"
      },
      {
        "image": "assets/imgs/a.png",
        "name": "박땡땡",
        "areaname": "강원도",
        "money": "100000원"
      }
    ]
  };
  WithList? withList;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final isSelected = <bool>[true, false, false, false];

  @override
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    withList = WithList.fromJson(withitem);
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
            '현황',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon:
                  Icon(Icons.receipt_long, color: Color(0xff3AAFFC), size: 30),
              onPressed: () {}),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ToggleButtons(
                      color: Colors.black.withOpacity(0.6),
                      selectedColor: Color(0xff3AAFFC),
                      fillColor: Colors.white.withOpacity(0.3),
                      splashColor: Color(0xff3AAFFC).withOpacity(0.2),
                      hoverColor: Color(0xff3AAFFC).withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10.0),
                      borderColor: Colors.black.withOpacity(0.1),
                      selectedBorderColor: Color(0xff3AAFFC),
                      constraints: BoxConstraints(minHeight: 36.0),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('함께하는 분'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('분야별 현황'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('지역별 현황'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('    클럽    '),
                        ),
                      ],
                      onPressed: (index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                          if (index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CurrentPage()));
                          }
                          if (index == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Category()));
                          }
                          if (index == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Area()));
                          }
                          if (index == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClubListPage()));
                          }
                        });
                      },
                      isSelected: isSelected,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff3AAFFC),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('지역', style: TextStyle(color: Color(0xff3AAFFC))),
                      Text('기부자', style: TextStyle(color: Color(0xff3AAFFC))),
                      Text('기부 금액', style: TextStyle(color: Color(0xff3AAFFC)))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black12,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(), //separatorBuilder : item과 item 사이에 그려질 위젯 (개수는 itemCount -1 이 된다)
                      itemCount: withList!.list!.length, //리스트의 개수
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: 40,
                                child: Text(
                                  withList!.list!.elementAt(index).areaname!,
                                  textAlign: TextAlign.center,
                                )),
                            Container(
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(300),
                                    child: Image.asset(
                                        withList!.list!.elementAt(index).image!,
                                        width: 30,
                                        height: 30),
                                  ),
                                  Text(withList!.list!.elementAt(index).name!),
                                ],
                              ),
                            ),
                            Container(
                                child: Text(
                              withList!.list!.elementAt(index).money!,
                              textAlign: TextAlign.center,
                            )),
                          ],
                        ));
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}

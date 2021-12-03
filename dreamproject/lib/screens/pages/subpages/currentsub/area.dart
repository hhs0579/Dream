import 'package:dreamproject/screens/pages/subpages/currentsub/category.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/clublist.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/with.dart';
import 'package:flutter/material.dart';

class Area extends StatefulWidget {
  const Area({Key? key}) : super(key: key);

  @override
  _AreaState createState() => _AreaState();
}

class _AreaState extends State<Area> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final isSelected = <bool>[false, false, true, false];
  @override
  Widget build(BuildContext context) {
    final List<String> _yearList = ["2020", "2021", "2022"];
    final monthList = [
      '1월',
      '2월',
      '3월',
      '4월',
      '5월',
      '6월',
      '7월',
      '8월',
      '9월',
      '10월',
      '11월',
      '12월'
    ];
    var yearValue = '2021';
    String monthValue = '1월';
    Map<String, double> dataMap = {
      "아동": 10,
      "노인": 1,
      "장애": 8,
      "빈곤": 20,
      "유기동물": 5
    };
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
                      onPressed: (index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                          if (index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WithPage()));
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
                                    builder: (context) => ClubList()));
                          }
                        });
                      },
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
                          child: Text('\t\t클럽\t\t'),
                        ),
                      ],
                      isSelected: isSelected,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      margin: EdgeInsets.only(top: 40, right: 20),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xff3AAFFC))),
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(
                          Icons.expand_more,
                          color: Color(0xff3AAFFC),
                        ),
                        underline: SizedBox(),
                        value: yearValue,
                        items: _yearList.map(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            yearValue = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(top: 40, right: 20),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xff3AAFFC))),
                      child: DropdownButton(
                        icon: Icon(
                          Icons.expand_more,
                          color: Color(0xff3AAFFC),
                        ),
                        underline: SizedBox(),
                        value: monthValue,
                        items: monthList.map(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            monthValue = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Center(
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.3,
                          child: Image(
                              width: 280,
                              image: AssetImage('assets/imgs/map.png')),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 40,
                          ),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '경기\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '인천\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 80, top: 50),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '서울\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 70, top: 130),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '세종\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 140),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '충남\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 135, top: 160),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '대전\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 80, top: 240),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '전북\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 70, top: 300),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '광주\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 330),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '전남\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 170, top: 40),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '강원\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 140, top: 110),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '충북\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 210, top: 130),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '경북\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 180, top: 210),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '대구\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 250, top: 240),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '울산\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 230, top: 300),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '부산\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 145, top: 280),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '경남\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 60, top: 400),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                  text: '제주\n',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '10',
                                        style: TextStyle(
                                            color: Color(0xff3AAFFC),
                                            fontSize: 20))
                                  ]))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

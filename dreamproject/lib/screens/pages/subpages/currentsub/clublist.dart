import 'dart:math';

import 'package:dreamproject/screens/pages/current.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/area.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/category.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/with.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ClubList extends StatefulWidget {
  const ClubList({Key? key}) : super(key: key);
  @override
  _ClubListState createState() => _ClubListState();
}

class _ClubListState extends State<ClubList> {
  final List _clubData = List.generate(100, (index) {
    return {
      "clubName": "Club \#$index",
      "money": Random().nextInt(10000) * 1000
    };
  });

  Widget _listItem(index) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: Text(index.toString(), style: TextStyle(fontSize: 15)),
          title: Text(
            _clubData[index]['clubName'].toString(),
            style: TextStyle(fontSize: 15),
          ),
          trailing: Text(_clubData[index]['money'].toString(),
              style: TextStyle(fontSize: 15)),
        ),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black26))));
  }

  Color _memberButtonColor = Colors.white;
  Color _moneyButtonColor = Colors.white;
  Color _memberTextColor = Colors.blue;
  Color _moneyTextColor = Colors.blue;
  bool _memberswitchState = false;
  bool _moneyswitchState = false;

  String? clicked;
  void setMemberStateOn() {
    _memberButtonColor = Colors.blue;
    _memberTextColor = Colors.white;
    _memberswitchState = true;
  }

  void setMemberStateOff() {
    _memberButtonColor = Colors.white;
    _memberTextColor = Colors.blue;
    _memberswitchState = false;
  }

  void setMoneyStateOn() {
    _moneyButtonColor = Colors.blue;
    _moneyTextColor = Colors.white;
    _moneyswitchState = true;
  }

  void setMoneyStateOff() {
    _moneyButtonColor = Colors.white;
    _moneyTextColor = Colors.blue;
    _moneyswitchState = false;
  }

  MemberButton(
      String clicked, Color primaryColor, Color textColor, dynamic onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.blue)),
        primary: primaryColor,
        minimumSize: Size(60, 40),
      ),
      child: Text(
        clicked,
        style: TextStyle(color: textColor),
      ),
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final isSelected = <bool>[false, false, false, true];
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
        body: Column(
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
                                builder: (context) => CurrentPage()));
                      }
                      if (index == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Category()));
                      }
                      if (index == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Area()));
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
            Container(
              margin: EdgeInsets.only(top: 25, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MemberButton("회원 수 순위", _memberButtonColor, _memberTextColor,
                      () {
                    if (_memberswitchState == false) {
                      if (_moneyswitchState == true) {
                        setState(() {
                          setMemberStateOn();
                          setMoneyStateOff();
                          clicked = '회원 수 순위';
                        });
                      } else {
                        setState(() {
                          setMemberStateOn();
                          clicked = '회원 수 순위';
                        });
                      }
                    } else {
                      setState(() {
                        setMemberStateOff();
                        clicked = '';
                      });
                    }
                    print(clicked);
                  }),
                  SizedBox(width: 10),
                  MemberButton('기부금액 순위', _moneyButtonColor, _moneyTextColor,
                      () {
                    if (_moneyswitchState == false) {
                      if (_memberswitchState == true) {
                        setState(() {
                          setMoneyStateOn();
                          setMemberStateOff();
                          clicked = '기부금액 순위';
                        });
                      } else {
                        setState(() {
                          setMoneyStateOn();
                          clicked = '기부금액 순위';
                        });
                      }
                    } else {
                      setState(() {
                        setMoneyStateOff();
                        clicked = '';
                      });
                    }
                    print(clicked);
                  })
                ],
              ),
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
                  Text('순위', style: TextStyle(color: Color(0xff3AAFFC))),
                  Text('클럽명', style: TextStyle(color: Color(0xff3AAFFC))),
                  Text('회원수', style: TextStyle(color: Color(0xff3AAFFC))),
                  Text('총 기부 금액', style: TextStyle(color: Color(0xff3AAFFC)))
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _clubData.length,
                    itemBuilder: (_, index) {
                      return _listItem(index);
                    }))
          ],
        ),
      ),
    ]);
  }
}

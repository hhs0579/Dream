import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/classes/right_drawer.dart';
import 'package:dreamproject/model/club_model.dart';
import 'package:dreamproject/screens/pages/current.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/area.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/category.dart';

import 'package:flutter/material.dart';

class ClubListPage extends StatefulWidget {
  const ClubListPage({Key? key}) : super(key: key);
  @override
  State<ClubListPage> createState() => _ClubListPageState();
}

class _ClubListPageState extends State<ClubListPage> {
  Color _memberButtonColor = Colors.white;
  Color _moneyButtonColor = Colors.white;
  Color _memberTextColor = Colors.blue;
  Color _moneyTextColor = Colors.blue;
  bool _isuserrank = true;

  String? clicked;

  userrankButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isuserrank = true;
        });
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Color(0xff3AAFFC))),
        primary: _isuserrank ? Color(0xff3AAFFC) : Colors.white,
        minimumSize: Size(60, 40),
      ),
      child: Text(
        '회원 수 순위',
        style: TextStyle(color: _isuserrank ? Colors.white : Color(0xff3AAFFC)),
      ),
    );
  }

  pointrankButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isuserrank = false;
        });
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Color(0xff3AAFFC))),
        primary: _isuserrank ? Colors.white : Color(0xff3AAFFC),
        minimumSize: Size(60, 40),
      ),
      child: Text(
        '기부금액 순위',
        style: TextStyle(color: _isuserrank ? Color(0xff3AAFFC) : Colors.white),
      ),
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final isSelected = <bool>[false, false, false, true];
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _clubStream = FirebaseFirestore.instance
        .collection('clubs')
        .orderBy(_isuserrank ? 'clubuser' : 'clubdonatepoint')
        .snapshots();
    return Stack(children: [
      Scaffold(
        key: _scaffoldKey,
        endDrawer: drawer(context),
        appBar: AppBar(
          title: Text(
            '현황',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
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
                      userrankButton(),
                      SizedBox(width: 10),
                      pointrankButton()
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
                      Text('순위',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xff3AAFFC))),
                      Text('클럽명',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xff3AAFFC))),
                      Text('회원수',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xff3AAFFC))),
                      Text('총 기부 금액',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff3AAFFC)))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black12,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: _clubStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(child: Text('오류가 발생했습니다.'));
                      }
                      if (snapshot.data == null) {
                        return Container();
                      }
                      List<ClubModel> clubmodels = [];

                      for (var value in snapshot.data!.docs) {
                        ClubModel clubmodel = ClubModel.fromJson(
                            value.data() as Map<String, dynamic>);

                        clubmodels.add(clubmodel);
                      }
                      clubmodels = clubmodels.reversed.toList();

                      return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: clubmodels.length,
                              itemBuilder: (context, index) {
                                ClubModel clubmodel =
                                    clubmodels.elementAt(index);
                                return Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            child: Center(
                                              child:
                                                  Text((index + 1).toString(),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      )),
                                            ),
                                          ),
                                          Container(
                                              width: 110,
                                              child: Row(children: [
                                                CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 15,
                                                    backgroundImage:
                                                        NetworkImage(
                                                            clubmodel.image)),
                                                SizedBox(width: 10),
                                                Text(clubmodel.name,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.grey))
                                              ])),
                                          Container(
                                            width: 85,
                                            child: Text(
                                                clubmodel.clubuser.toString() +
                                                    ' 명',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey,
                                                )),
                                          ),
                                          Flexible(
                                              fit: FlexFit.tight,
                                              child: Container(
                                                width: 130,
                                                child: Text(
                                                    clubmodel.clubdonatepoint
                                                            .toString() +
                                                        ' 원',
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey,
                                                    )),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      color: Colors.grey[300],
                                    )
                                  ],
                                );
                              }));
                    })
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

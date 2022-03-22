import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/classes/right_drawer.dart';
import 'package:dreamproject/model/myinfo.dart';
import 'package:dreamproject/model/withitem.dart';
import 'package:dreamproject/repo/auth_service.dart';

import 'package:dreamproject/screens/pages/subpages/currentsub/clublistpage.dart';

import 'package:flutter/material.dart';

class CurrentPage extends StatefulWidget {
  CurrentPage({Key? key}) : super(key: key);

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  WithList? withList;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final isSelected = <bool>[true, false];

  @override
  final AuthService _auth = AuthService();

  _profileImage(image) {
    return image == ''
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            backgroundImage: AssetImage('assets/imgs/basic.png'))
        : CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            backgroundImage: NetworkImage(image));
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance
        .collection('users')
        .orderBy('totaldonatepoint')
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
                          child: Text('\t\t클럽\t\t'),
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
                StreamBuilder<QuerySnapshot>(
                    stream: _userStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(child: Text('오류가 발생했습니다.'));
                      }
                      if (snapshot.data == null) {
                        return Container();
                      }
                      List<MyInfo> usermodels = [];

                      for (var value in snapshot.data!.docs) {
                        MyInfo usermodel = MyInfo.fromJson(
                            value.data() as Map<String, dynamic>);

                        usermodels.add(usermodel);
                      }
                      usermodels = usermodels.reversed.toList();
                      return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: usermodels.length,
                              itemBuilder: (context, index) {
                                MyInfo usermodel = usermodels.elementAt(index);
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
                                            width: 80,
                                            child: Center(
                                              child: Text(
                                                  usermodel.address
                                                      .substring(0, 2),
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey)),
                                            ),
                                          ),
                                          Container(
                                              width: 140,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    _profileImage(
                                                        usermodel.image),
                                                    SizedBox(width: 15),
                                                    Text(usermodel.name,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.grey))
                                                  ])),
                                          Flexible(
                                              fit: FlexFit.loose,
                                              child: Container(
                                                width: 145,
                                                child: Text(
                                                    usermodel.totaldonatepoint
                                                            .toString() +
                                                        ' point',
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

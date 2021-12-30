import 'dart:io';

import 'package:dreamproject/screens/pages/subpages/infosub/club_add.dart';
import 'package:dreamproject/screens/pages/subpages/infosub/point_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'subpages/infosub/fix_info.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // PickedFile? _image;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  var _member = 0;
  var _donation = 0;

  bool isProfile = false;

  Future _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = image;
      }
    });
  }

  _profileImage() {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 15,
              right: 30,
            ),
            child: Container(
                width: 65,
                height: 65,
                child:
                    _image == null ? _profileImageOff() : _profileImageOn())),
        Positioned(
            right: 22,
            top: 60,
            child: Container(
              width: 22,
              height: 22,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: IconButton(
                  onPressed: () {
                    _getImage();
                  },
                  icon: Icon(Icons.edit, color: Colors.white),
                  iconSize: 15,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
            ))
      ],
    );
  }

  _profileImageOn() {
    return Container(
        width: 65,
        height: 65,
        child: CircleAvatar(
            radius: 40, backgroundImage: FileImage(File(_image!.path))));
  }

  _profileImageOff() {
    return Container(
      width: 65,
      height: 65,
      child: CircleAvatar(backgroundImage: AssetImage('assets/imgs/basic.png')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              '내 정보',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                padding: EdgeInsets.only(left: 15),
                icon: Icon(Icons.receipt_long,
                    color: Color(0xff3AAFFC), size: 30),
                onPressed: () {}),
            actions: <Widget>[
              IconButton(
                  padding: EdgeInsets.only(right: 15),
                  icon:
                      Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                  onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 180,
                  margin:
                      EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 25),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          _profileImage(),
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 15, right: 30),
                            child: Text("홍길동",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, right: 30),
                              child: Text("San Francisco, CA",
                                  style: TextStyle(fontSize: 12)))
                        ],
                      ),
                      Container(height: 210, width: 1, color: Colors.grey[300]),
                      Container(
                        width: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "나의 포인트",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // 가용 포인트 변수
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "500,000",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Point",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.to(PointAdd());
                              },
                              child: Text(
                                "포인트 충전하기",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                minimumSize: Size(20, 30),
                                side: BorderSide(color: Colors.blue),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Text(
                              "후원 총 금액",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "500,000",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "원",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "회원님의 후원 수",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "1,000",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "회",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 330,
                  height: 1,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "나의 후원내역",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.white,
                          minimumSize: Size(40, 35),
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(FixInfo());
                        },
                        child: Text(
                          "개인정보 설정",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.white,
                          minimumSize: Size(40, 35),
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "드럼 파트너 회원",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.white,
                          minimumSize: Size(40, 35),
                          side: BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Text(
                        "나의 클럽",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 35, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 220,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue)),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(children: [
                                  Container(
                                    width: 60.0,
                                    height: 60.0,
                                    margin:
                                        EdgeInsets.only(left: 20.0, top: 12),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/imgs/a.png"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0)),
                                      border: Border.all(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 7, bottom: 7, left: 20),
                                    child: Text("클럽 이름",
                                        style: TextStyle(
                                          fontSize: 11,
                                        )),
                                  ),
                                ]),
                                Container(
                                  margin: EdgeInsets.only(top: 7, right: 3),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_vert,
                                            color: Colors.blue),
                                        iconSize: 15,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                width: 80, height: 1, color: Colors.grey[350]),
                            SizedBox(height: 10),
                            Container(
                              width: 80,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("회원 수",
                                          style: TextStyle(
                                              fontSize: 9, color: Colors.grey)),
                                      SizedBox(width: 9),
                                      Text("$_member 명",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Text("총 기부금",
                                      style: TextStyle(
                                          fontSize: 9, color: Colors.grey)),
                                  SizedBox(height: 3),
                                  Text("$_donation 원",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(height: 11),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14),
                              ),
                              child: Container(
                                  width: 98,
                                  height: 35,
                                  color: Colors.blue,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 35,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(6),
                                            primary: Colors.blue,
                                            elevation: 0,
                                          ),
                                          child: Text("탈퇴",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                      Container(
                                        width: 0.5,
                                        height: 22,
                                        color: Colors.white54,
                                      ),
                                      Container(
                                        width: 57.5,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(6),
                                            primary: Colors.blue,
                                            elevation: 0,
                                          ),
                                          child: Text("로고변경",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 220,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue)),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(children: [
                                  Container(
                                    width: 60.0,
                                    height: 60.0,
                                    margin:
                                        EdgeInsets.only(left: 20.0, top: 12),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/imgs/a.png"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0)),
                                      border: Border.all(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 7, bottom: 7, left: 20),
                                    child: Text("클럽 이름",
                                        style: TextStyle(
                                          fontSize: 11,
                                        )),
                                  ),
                                ]),
                                Container(
                                  margin: EdgeInsets.only(top: 7, right: 3),
                                  child: Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_vert,
                                            color: Colors.blue),
                                        iconSize: 15,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                width: 80, height: 1, color: Colors.grey[350]),
                            SizedBox(height: 10),
                            Container(
                              width: 80,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("회원 수",
                                          style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.grey[300])),
                                      SizedBox(width: 9),
                                      Text("$_member 명",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[300])),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Text("총 기부금",
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.grey[300])),
                                  SizedBox(height: 3),
                                  Text("$_donation 원",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[300])),
                                ],
                              ),
                            ),
                            SizedBox(height: 12.5),
                            Container(
                              width: 120,
                              height: 1,
                              color: Colors.blue,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 9),
                              child: Text("승인 대기중",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.blue,
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xffd6d6d6)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              margin: EdgeInsets.only(top: 12),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(ClubAddPage());
                                },
                                child: Icon(Icons.add, color: Colors.white),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Color(0xffd6d6d6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 69),
                              child: Text(
                                "클럽 추가",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black54),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14),
                              ),
                              child: Container(
                                width: 98,
                                height: 35,
                                color: Color(0xffd6d6d6),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Text(
                        "나의 게시글",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 330,
                  height: 300,
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: List.generate(
                        9,
                        (index) => Container(
                            color: Colors.lightBlue,
                            child: Text('Item $index'))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

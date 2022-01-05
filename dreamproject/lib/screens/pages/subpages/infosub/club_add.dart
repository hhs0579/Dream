import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubAddPage extends StatefulWidget {
  const ClubAddPage({Key? key}) : super(key: key);

  @override
  _ClubAddPageState createState() => _ClubAddPageState();
}

class _ClubAddPageState extends State<ClubAddPage> {
  bool _isButton = false;
  bool _isClubcreate = false;
  var _selectindex = null;

  _clubeCreateOff() {
    return Container(
      width: Get.width,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isClubcreate = true;
          });
        },
        child: Text(
          "내 클럽 생성하기",
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          side: BorderSide(color: Colors.blue, width: 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

  _clubeCreateOn() {
    return Container(
        padding: EdgeInsets.only(top: 15, left: 30, right: 30),
        width: Get.width,
        height: 250,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Container(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text('클럽이름',
                    style: TextStyle(fontSize: 13, color: Colors.grey)),
                SizedBox(width: 10),
                Container(
                  width: 250,
                  child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)))),
                )
              ]),
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.only(top: 8),
              child: Text('7자 이내로 입력해 주세요.',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12, color: Color(0xff3AAFFC))),
            ),
            SizedBox(
              height: 5,
            ),
            Row(children: [
              Text('사진등록', style: TextStyle(fontSize: 13, color: Colors.grey)),
              SizedBox(width: 50),
            ])
          ],
        ));
  }

  _onClubItem() {
    return Container(
        width: Get.width,
        height: 120,
        child: TextButton(
          onPressed: () {
            setState(() {
              if (_isButton == true) {
              } else {}
            });
          },
          style: TextButton.styleFrom(
              side: BorderSide(color: Colors.grey, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    margin: EdgeInsets.only(left: 12, top: 8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                  )
                ],
              ),
              SizedBox(width: 25),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(children: [
                  Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xff3AAFFC),
                          )),
                      child: CircleAvatar()),
                  SizedBox(height: 8),
                  Text('한양대학교',
                      style: TextStyle(fontSize: 12, color: Color(0xff3AAFFC))),
                ]),
              ),
              SizedBox(width: 35),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Container(
                      width: 60,
                      child: Text('회원 수',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 100,
                      child: Text('999' + ' 명',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ),
                  ]),
                  SizedBox(height: 15),
                  Row(children: [
                    Container(
                      width: 60,
                      child: Text('총 기부금',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 100,
                      child: Text('1000000' + ' 원',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ),
                  ]),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: Color(0xff3AAFFC))),
            title: Text('클럽 추가',
                style: TextStyle(
                  fontSize: 15,
                ))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Column(children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff3AAFFC), width: 2))),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search,
                                color: Color(0xff3AAFFC), size: 30))
                      ],
                    ),
                  ),
                ]),
                Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                        child: _isClubcreate == false
                            ? _clubeCreateOff()
                            : _clubeCreateOn()),
                    SizedBox(height: 10),
                    Container(
                        width: Get.width,
                        height: 120,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isButton = true;
                            });
                          },
                          style: TextButton.styleFrom(
                              side: BorderSide(color: Colors.grey, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    margin: EdgeInsets.only(left: 12, top: 8),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.grey)),
                                  )
                                ],
                              ),
                              SizedBox(width: 25),
                              Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Column(children: [
                                  Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xff3AAFFC),
                                          )),
                                      child: CircleAvatar()),
                                  SizedBox(height: 8),
                                  Text('한양대학교',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff3AAFFC))),
                                ]),
                              ),
                              SizedBox(width: 35),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(children: [
                                    Container(
                                      width: 60,
                                      child: Text('회원 수',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey)),
                                    ),
                                    SizedBox(width: 30),
                                    Container(
                                      width: 100,
                                      child: Text('999' + ' 명',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black)),
                                    ),
                                  ]),
                                  SizedBox(height: 15),
                                  Row(children: [
                                    Container(
                                      width: 60,
                                      child: Text('총 기부금',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey)),
                                    ),
                                    SizedBox(width: 30),
                                    Container(
                                      width: 100,
                                      child: Text('1000000' + ' 원',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black)),
                                    ),
                                  ]),
                                ],
                              )
                            ],
                          ),
                        )),
                    _onClubItem(),
                    _onClubItem(),
                    _onClubItem(),
                    _onClubItem(),
                    _onClubItem(),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  Color _maleButtonColor = Colors.white;
  Color _femaleButtonColor = Colors.white;
  Color _maleTextColor = Colors.blue;
  Color _femaleTextColor = Colors.blue;
  bool _maleswitchState = false;
  bool _femaleswitchState = false;

  TextEditingController idController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordOkController = new TextEditingController();

  void setMaleStateOn() {
    _maleButtonColor = Colors.blue;
    _maleTextColor = Colors.white;
    _maleswitchState = true;
  }

  void setMaleStateOff() {
    _maleButtonColor = Colors.white;
    _maleTextColor = Colors.blue;
    _maleswitchState = false;
  }

  void setFemaleStateOn() {
    _femaleButtonColor = Colors.blue;
    _femaleTextColor = Colors.white;
    _femaleswitchState = true;
  }

  void setFemaleStateOff() {
    _femaleButtonColor = Colors.white;
    _femaleTextColor = Colors.blue;
    _femaleswitchState = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "회원가입",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                alignment: Alignment(0, 0),
                height: 70,
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.person, color: Colors.blue),
                    ),
                    Container(
                      width: 60,
                      child: Text("ID",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 35,
                      child: TextButton(
                        child: Text("확인"),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment(0, 0),
                height: 70,
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.create_rounded, color: Colors.blue),
                    ),
                    Container(
                      width: 60,
                      child: Text("이름",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment(0, 0),
                height: 70,
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                padding: EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.male, color: Colors.blue),
                    ),
                    Container(
                      width: 60,
                      child: Text("성별",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(
                      width: 75,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_maleswitchState == false) {
                              if (_femaleswitchState == true) {
                                setState(() {
                                  setMaleStateOn();
                                  setFemaleStateOff();
                                });
                              } else {
                                setState(() {
                                  setMaleStateOn();
                                });
                              }
                            } else {
                              setState(() {
                                setMaleStateOff();
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.blue)),
                            primary: _maleButtonColor,
                            minimumSize: Size(60, 50),
                          ),
                          child: Text(
                            "남",
                            style: TextStyle(color: _maleTextColor),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (_femaleswitchState == false) {
                              if (_maleswitchState == true) {
                                setState(() {
                                  setFemaleStateOn();
                                  setMaleStateOff();
                                });
                              }
                              setState(() {
                                setFemaleStateOn();
                              });
                            } else {
                              setState(() {
                                setFemaleStateOff();
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.blue)),
                            primary: _femaleButtonColor,
                            minimumSize: Size(60, 50),
                          ),
                          child: Text(
                            "여",
                            style: TextStyle(color: _femaleTextColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment(0, 0),
                height: 70,
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.lock, color: Colors.blue),
                    ),
                    Container(
                      width: 60,
                      child: Text("비밀번호",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment(0, 0),
                height: 70,
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.lock, color: Colors.blue),
                    ),
                    Container(
                      width: 90,
                      child: Text("비밀번호 확인",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment(0, 0),
                height: 160,
                margin: EdgeInsets.only(left: 30, right: 30),
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(Icons.place, color: Colors.blue),
                        ),
                        Container(
                          width: 90,
                          child: Text("주소",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: TextField(
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 35,
                          child: TextButton(
                            child: Text(
                              "우편번호 검색",
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 43),
                          width: 90,
                          child: Text("상세주소",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: TextField(
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                alignment: Alignment(0, 0),
                height: 70,
                margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.call, color: Colors.blue),
                    ),
                    Container(
                      width: 60,
                      child: Text("핸드폰",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    Container(
                      width: 85,
                      height: 30,
                      child: TextButton(
                        child: Text(
                          "인증번호 보내기",
                          style: TextStyle(fontSize: 10),
                        ),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

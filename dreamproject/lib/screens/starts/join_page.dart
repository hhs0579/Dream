import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  static String tag = 'JoinPage';

  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "회원가입",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30.0),
              Expanded(
                child: Container(
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
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
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
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
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
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
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
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
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
                        width: 90,
                      ),
                      Row(
                        children: [
                          MaterialButton(
                            height: 60,
                            minWidth: 50,
                            color: Colors.white,
                            onPressed: () {},
                            child: Text(
                              "남",
                              style: TextStyle(color: Colors.blue),
                            ),
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          MaterialButton(
                            height: 60,
                            minWidth: 50,
                            color: Colors.white,
                            onPressed: () {},
                            child: Text(
                              "여",
                              style: TextStyle(color: Colors.blue),
                            ),
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
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
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
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
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
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
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

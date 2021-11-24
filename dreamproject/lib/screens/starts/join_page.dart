import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  static String tag = 'joinPage';

  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "회원가입",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Form(
                      child: Column(children: [
                        TextFormField(
                          enabled: true,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: TextButton(
                                child: Text("확인"),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 1),
                                ),
                              ),
                            ),
                            prefixText: 'ID',
                            prefixStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Form(
                      child: Column(children: [
                        TextFormField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.create_rounded,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixText: '이름',
                            prefixStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Form(
                      child: Column(children: [
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.male,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: '성별',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            suffixIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                  width: 20,
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
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                          readOnly: true,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Form(
                      child: Column(children: [
                        TextFormField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixText: '비밀번호',
                            prefixStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          obscureText: true,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Form(
                      child: Column(children: [
                        TextFormField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixText: '비밀번호 확인',
                            prefixStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          obscureText: true,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Form(
                      child: Column(children: [
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.create_rounded,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: '이름',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

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
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "회원가입",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
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
                            suffixIcon: Container(
                              width: 20.0,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "확인",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.blue,
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
                    margin: EdgeInsets.only(left: 20, right: 20),
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
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Form(
                      child: Column(children: []),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
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
                    margin: EdgeInsets.only(left: 20, right: 20),
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
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

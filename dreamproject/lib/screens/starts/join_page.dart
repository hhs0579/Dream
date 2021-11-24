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
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        "회원가입",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Flexible(
                    child: Container(
                      alignment: Alignment(0.0, 0.0),
                      height: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1, color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            width: 60,
                            child: Text("ID"),
                          ),
                          Flexible(
                            child: Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

final List<String> _yearList = ["10000", "30000", "50000", "100000"];
var yearValue = '100000';
onselectBox() {
  Container(
    margin: EdgeInsets.only(bottom: 20),
    width: 350,
    height: 100,
    decoration: BoxDecoration(
        border: Border.all(color: Color(0xff3AAFFC)),
        borderRadius: BorderRadius.circular(25)),
    child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(children: [
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '후원하기',
                  style: TextStyle(color: Color(0xff3AAFFC), fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
        ])),
  );
}

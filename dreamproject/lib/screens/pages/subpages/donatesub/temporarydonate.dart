import 'package:dreamproject/screens/pages/donate.dart';
import 'package:flutter/material.dart';

class TemporaryDonated extends StatefulWidget {
  TemporaryDonated({Key? key}) : super(key: key);

  @override
  _TemporaryDonatedState createState() => _TemporaryDonatedState();
}

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
final List<String> _yearList = ["10000", "30000", "50000", "100000"];
var yearValue = '100000';

onselectBox(String m) {
  return Container(
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
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(margin: EdgeInsets.only(right: 100), child: Text(m)),
              Container(
                height: 30,
                width: 120,
                margin: EdgeInsets.only(top: 10, right: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff3AAFFC))),
                child: Container(
                  width: 120,
                  margin: EdgeInsets.only(top: 5, left: 20),
                  child: Text(
                    yearValue,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
            ]),
          ])));
}

twoselectBox(String m, String n) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    width: 350,
    height: 150,
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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(m)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 7, left: 20),
                child: Text(
                  (int.parse(yearValue) / 2).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(n)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 2).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
        ])),
  );
}

threeselectBox(String m, String n, String i) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    width: 350,
    height: 200,
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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(m)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 3).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(n)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 3).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(i)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 3).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
        ])),
  );
}

fourselectBox(String m, String n, String i, String j) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    width: 350,
    height: 250,
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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(m)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 4).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(n)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 4).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(i)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 4).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(j)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 4).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
        ])),
  );
}

fiveselectBox(String m, String n, String i, String j, String k) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    width: 350,
    height: 300,
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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(m)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 5).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(n)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 5).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(i)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 5).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(j)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 5).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(k)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 5).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
        ])),
  );
}

sixselectBox(String m, String n, String i, String j, String k, String z) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    width: 350,
    height: 350,
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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(m)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 6).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(n)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 6).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(i)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 6).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(j)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 6).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(k)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 6).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xff3AAFFC),
            width: 300,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(margin: EdgeInsets.only(right: 100), child: Text(z)),
            Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff3AAFFC))),
              child: Container(
                width: 120,
                margin: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  (int.parse(yearValue) / 6).toStringAsFixed(0),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, right: 30), child: Text('원'))
          ]),
        ])),
  );
}

class _TemporaryDonatedState extends State<TemporaryDonated> {
  var old = false;
  var child = false;
  var disorder = false;
  var multiculture = false;
  var pet = false;
  var poverty = false;
  var unnamed = false;
  var named = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                  title: Text('카카오톡 플친', textAlign: TextAlign.center),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            '후원하기',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xff3AAFFC), size: 30),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DonatePage()));
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    width: 350,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff3AAFFC)),
                        borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '후원 분야',
                                  style: TextStyle(
                                      color: Color(0xff3AAFFC), fontSize: 15),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 13),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.blue,
                                        checkColor: Colors.white,
                                        value: old,
                                        onChanged: (value) {
                                          setState(() {
                                            old = value!;
                                          });
                                        }),
                                    Text('노인'),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 13),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.blue,
                                        checkColor: Colors.white,
                                        value: child,
                                        onChanged: (value) {
                                          setState(() {
                                            child = value!;
                                          });
                                        }),
                                    Text('아동'),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 13),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.blue,
                                        checkColor: Colors.white,
                                        value: disorder,
                                        onChanged: (value) {
                                          setState(() {
                                            disorder = value!;
                                          });
                                        }),
                                    Text('장애'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: multiculture,
                                  onChanged: (value) {
                                    setState(() {
                                      multiculture = value!;
                                    });
                                  }),
                              Text('다문화'),
                              Checkbox(
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: pet,
                                  onChanged: (value) {
                                    setState(() {
                                      pet = value!;
                                    });
                                  }),
                              Text('유기동물'),
                              Checkbox(
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: poverty,
                                  onChanged: (value) {
                                    setState(() {
                                      poverty = value!;
                                    });
                                  }),
                              Text('빈곤'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                            '기부자',
                            style: TextStyle(
                                color: Color(0xff3AAFFC), fontSize: 15),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Checkbox(
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: unnamed,
                                  onChanged: (value) {
                                    setState(() {
                                      unnamed = value!;
                                    });
                                  }),
                              Text('익명'),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Checkbox(
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: named,
                                  onChanged: (value) {
                                    setState(() {
                                      named = value!;
                                    });
                                  }),
                              Text('실명'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
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
                              '금액',
                              style: TextStyle(
                                  color: Color(0xff3AAFFC), fontSize: 15),
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
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Container(
                          height: 30,
                          width: 120,
                          margin: EdgeInsets.only(top: 10, right: 10),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xff3AAFFC))),
                          child: DropdownButton(
                            isExpanded: true,
                            icon: Icon(
                              Icons.expand_more,
                              color: Color(0xff3AAFFC),
                            ),
                            underline: SizedBox(),
                            value: yearValue,
                            items: _yearList.map(
                              (value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                yearValue = value!;
                              });
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10, right: 30),
                            child: Text('원')),
                      ]),
                    ])),
              ),
              Column(
                children: <Widget>[
                  Container(),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == false &&
                          multiculture == false &&
                          pet == false &&
                          poverty == false,
                      child: onselectBox('노인')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == false &&
                          multiculture == false &&
                          pet == false &&
                          poverty == false,
                      child: onselectBox('아동')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == true &&
                          multiculture == false &&
                          pet == false &&
                          poverty == false,
                      child: onselectBox('장애')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == false &&
                          multiculture == true &&
                          pet == false &&
                          poverty == false,
                      child: onselectBox('다문화')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == false &&
                          multiculture == false &&
                          pet == true &&
                          poverty == false,
                      child: onselectBox('유기동물')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == false &&
                          multiculture == false &&
                          pet == false &&
                          poverty == true,
                      child: onselectBox('빈곤')!),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == false &&
                          multiculture == false &&
                          pet == false &&
                          poverty == false,
                      child: twoselectBox('노인', '아동')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == true &&
                          multiculture == false &&
                          pet == false &&
                          poverty == false,
                      child: twoselectBox('노인', '장애')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == false &&
                          multiculture == true &&
                          pet == false &&
                          poverty == false,
                      child: twoselectBox('노인', '다문화')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == false &&
                          multiculture == false &&
                          pet == true &&
                          poverty == false,
                      child: twoselectBox('노인', '유기동물')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == false &&
                          multiculture == false &&
                          pet == false &&
                          poverty == true,
                      child: twoselectBox('노인', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == true &&
                          multiculture == false &&
                          pet == false &&
                          poverty == false,
                      child: twoselectBox('아동', '장애')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == false &&
                          multiculture == true &&
                          pet == false &&
                          poverty == false,
                      child: twoselectBox('아동', '다문화')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == false &&
                          multiculture == false &&
                          pet == true &&
                          poverty == false,
                      child: twoselectBox('아동', '유기동물')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == false &&
                          multiculture == false &&
                          pet == false &&
                          poverty == true,
                      child: twoselectBox('아동', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == true &&
                          multiculture == true &&
                          pet == false &&
                          poverty == false,
                      child: twoselectBox('장애', '다문화')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == true &&
                          multiculture == false &&
                          pet == true &&
                          poverty == false,
                      child: twoselectBox('장애', '유기동물')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == true &&
                          multiculture == false &&
                          pet == false &&
                          poverty == true,
                      child: twoselectBox('장애', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == false &&
                          multiculture == true &&
                          pet == true &&
                          poverty == false,
                      child: twoselectBox('다문화', '유기동물')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == false &&
                          multiculture == true &&
                          pet == false &&
                          poverty == true,
                      child: twoselectBox('다문화', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == false &&
                          multiculture == false &&
                          pet == true &&
                          poverty == true,
                      child: twoselectBox('유기동물', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == true &&
                          multiculture == false &&
                          pet == false &&
                          poverty == false,
                      child: threeselectBox('노인', '아동', '장애')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == false &&
                          multiculture == true &&
                          pet == false &&
                          poverty == false,
                      child: threeselectBox('노인', '아동', '다문화')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == false &&
                          multiculture == false &&
                          pet == true &&
                          poverty == false,
                      child: threeselectBox('노인', '아동', '유기동물')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == false &&
                          multiculture == false &&
                          pet == false &&
                          poverty == true,
                      child: threeselectBox('노인', '아동', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == true &&
                          multiculture == true &&
                          pet == false &&
                          poverty == false,
                      child: threeselectBox('노인', '장애', '다문화')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == true &&
                          multiculture == false &&
                          pet == true &&
                          poverty == false,
                      child: threeselectBox('노인', '장애', '유기동물')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == true &&
                          multiculture == false &&
                          pet == false &&
                          poverty == true,
                      child: threeselectBox('노인', '장애', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == false &&
                          multiculture == true &&
                          pet == false &&
                          poverty == true,
                      child: threeselectBox('노인', '다문화', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == false &&
                          multiculture == true &&
                          pet == true &&
                          poverty == false,
                      child: threeselectBox('노인', '다문화', '유기동물')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == false &&
                          multiculture == false &&
                          pet == true &&
                          poverty == true,
                      child: threeselectBox('노인', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == true &&
                          multiculture == true &&
                          pet == false &&
                          poverty == false,
                      child: threeselectBox('아동', '장애', '다문화')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == true &&
                          multiculture == false &&
                          pet == true &&
                          poverty == false,
                      child: threeselectBox('아동', '장애', '유기동물')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == true &&
                          multiculture == false &&
                          pet == false &&
                          poverty == true,
                      child: threeselectBox('아동', '장애', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == false &&
                          multiculture == true &&
                          pet == true &&
                          poverty == false,
                      child: threeselectBox('아동', '다문화', '유기동물')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == false &&
                          multiculture == true &&
                          pet == false &&
                          poverty == true,
                      child: threeselectBox('아동', '다문화', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == false &&
                          multiculture == false &&
                          pet == true &&
                          poverty == true,
                      child: threeselectBox('아동', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == true &&
                          multiculture == true &&
                          pet == true &&
                          poverty == false,
                      child: threeselectBox('장애', '다문화', '유기동물')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == true &&
                          multiculture == false &&
                          pet == true &&
                          poverty == true,
                      child: threeselectBox('장애', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == false &&
                          multiculture == true &&
                          pet == true &&
                          poverty == true,
                      child: threeselectBox('다문화', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == true &&
                          multiculture == true &&
                          pet == false &&
                          poverty == false,
                      child: fourselectBox('노인', '아동', '장애', '다문화')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == true &&
                          multiculture == false &&
                          pet == true &&
                          poverty == false,
                      child: fourselectBox('노인', '아동', '장애', '유기동물')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == true &&
                          multiculture == false &&
                          pet == false &&
                          poverty == true,
                      child: fourselectBox('노인', '아동', '장애', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == false &&
                          multiculture == true &&
                          pet == true &&
                          poverty == false,
                      child: fourselectBox('노인', '아동', '다문화', '유기동물')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == false &&
                          multiculture == true &&
                          pet == false &&
                          poverty == true,
                      child: fourselectBox('노인', '아동', '다문화', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == false &&
                          multiculture == false &&
                          pet == true &&
                          poverty == true,
                      child: fourselectBox('노인', '아동', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == true &&
                          multiculture == true &&
                          pet == true &&
                          poverty == false,
                      child: fourselectBox('노인', '장애', '다문화', '유기동물')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == true &&
                          multiculture == true &&
                          pet == false &&
                          poverty == true,
                      child: fourselectBox('노인', '장애', '다문화', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == true &&
                          multiculture == false &&
                          pet == true &&
                          poverty == true,
                      child: fourselectBox('노인', '장애', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == false &&
                          multiculture == true &&
                          pet == true &&
                          poverty == true,
                      child: fourselectBox('노인', '다문화', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == true &&
                          multiculture == true &&
                          pet == true &&
                          poverty == false,
                      child: fourselectBox('아동', '장애', '다문화', '유기동물')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == true &&
                          multiculture == true &&
                          pet == false &&
                          poverty == true,
                      child: fourselectBox('아동', '장애', '다문화', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == true &&
                          multiculture == false &&
                          pet == true &&
                          poverty == true,
                      child: fourselectBox('아동', '장애', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == false &&
                          multiculture == true &&
                          pet == true &&
                          poverty == true,
                      child: fourselectBox('아동', '다문화', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == false &&
                          disorder == true &&
                          multiculture == true &&
                          pet == true &&
                          poverty == true,
                      child: fourselectBox('장애', '다문화', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == true &&
                          multiculture == true &&
                          pet == true &&
                          poverty == false,
                      child: fiveselectBox('노인', '아동', '장애', '다문화', '유기동물')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == true &&
                          multiculture == true &&
                          pet == false &&
                          poverty == true,
                      child: fiveselectBox('노인', '아동', '장애', '다문화', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == true &&
                          multiculture == false &&
                          pet == true &&
                          poverty == true,
                      child: fiveselectBox('노인', '아동', '장애', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == false &&
                          multiculture == true &&
                          pet == true &&
                          poverty == true,
                      child: fiveselectBox('노인', '아동', '다문화', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == false &&
                          disorder == true &&
                          multiculture == true &&
                          pet == true &&
                          poverty == true,
                      child: fiveselectBox('노인', '장애', '다문화', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == false &&
                          child == true &&
                          disorder == true &&
                          multiculture == true &&
                          pet == true &&
                          poverty == true,
                      child: fiveselectBox('아동', '장애', '다문화', '유기동물', '빈곤')),
                  Visibility(
                      visible: old == true &&
                          child == true &&
                          disorder == true &&
                          multiculture == true &&
                          pet == true &&
                          poverty == true,
                      child:
                          sixselectBox('노인', '아동', '장애', '다문화', '유기동물', '빈곤')),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(336, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {},
                  child: Text('드림'))
            ],
          ),
        ),
      )
    ]);
  }
}

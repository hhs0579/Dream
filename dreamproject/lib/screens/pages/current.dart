import 'package:dreamproject/screens/pages/subpages/currentsub/area.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/category.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/clublist.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/with.dart';
import 'package:flutter/material.dart';

class CurrentPage extends StatefulWidget {
  CurrentPage({Key? key}) : super(key: key);

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

var texts = ["g ", "ㅁㅁ"];

class _CurrentPageState extends State<CurrentPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final isSelected = <bool>[true, false, false, false];

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
            '현황',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon:
                  Icon(Icons.receipt_long, color: Color(0xff3AAFFC), size: 30),
              onPressed: () {}),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
          ],
        ),
        body: Container(
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
                        child: Text('분야별 현황'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('지역별 현황'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('    클럽    '),
                      ),
                    ],
                    onPressed: (index) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = i == index;
                        }
                      });
                    },
                    isSelected: isSelected,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('지역',
                        style:
                            TextStyle(color: Color(0xff3AAFFC), fontSize: 15)),
                    Text('기부자',
                        style:
                            TextStyle(color: Color(0xff3AAFFC), fontSize: 15)),
                    Text('기부금액',
                        style:
                            TextStyle(color: Color(0xff3AAFFC), fontSize: 15))
                  ],
                ),
              ),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: texts.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (context, index) {
                    var tile = ListTile(title: Text(texts[index]));
                    return tile;
                  }),
            ],
          ),
        ),
      ),
    ]);
  }
}

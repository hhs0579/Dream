import 'package:dreamproject/screens/pages/subpages/currentsub/area.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/clublist.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/with.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<String> _yearList = ["2020", "2021", "2022"];
  final monthList = [
    '1월',
    '2월',
    '3월',
    '4월',
    '5월',
    '6월',
    '7월',
    '8월',
    '9월',
    '10월',
    '11월',
    '12월'
  ];
  var yearValue = '2021';
  String monthValue = '1월';
  Map<String, double> dataMap = {
    "아동": 10,
    "노인": 1,
    "장애": 8,
    "빈곤": 20,
    "유기동물": 5
  };

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final isSelected = <bool>[false, true, false, false];
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
                    onPressed: (index) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = i == index;
                        }
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WithPage()));
                        }
                        if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Category()));
                        }
                        if (index == 2) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Area()));
                        }
                        if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClubList()));
                        }
                      });
                    },
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
                        child: Text('\t\t클럽\t\t'),
                      ),
                    ],
                    isSelected: isSelected,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, right: 20),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff3AAFFC))),
                    child: DropdownButton(
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
                    margin: EdgeInsets.only(top: 40, right: 20),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff3AAFFC))),
                    child: DropdownButton(
                      icon: Icon(
                        Icons.expand_more,
                        color: Color(0xff3AAFFC),
                      ),
                      underline: SizedBox(),
                      value: monthValue,
                      items: monthList.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          monthValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Center(),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 2.8,

                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 32,

                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: true,
                    decimalPlaces: 0,
                  ),
                  // gradientList: ---To add gradient colors---
                  // emptyColorGradient: ---Empty Color gradient---
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

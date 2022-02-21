import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/classes/right_drawer.dart';
import 'package:dreamproject/screens/pages/current.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/area.dart';
import 'package:dreamproject/screens/pages/subpages/currentsub/clublistpage.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<String> _yearList = ["2022", "2023"];
  var yearValue = '2022';
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

  String monthValue = '1월';
  Map<String, double> dataMap = {
    "아동": 150,
    "노인": 310,
    "장애": 150,
    "빈곤": 200,
    "유기동물": 350,
    "다문화": 150
  };

  _categoryItem(String category, String donateuser, double top, double bottom,
      double left, double right, dynamic onTap) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Color(0xff3AAFFC),
          width: 70,
          height: 50,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(category),
            SizedBox(height: 7),
            Text(donateuser)
          ]),
        ),
      ),
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final isSelected = <bool>[false, true, false, false];

  final CollectionReference donationCollection =
      FirebaseFirestore.instance.collection('donations');

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        key: _scaffoldKey,
        endDrawer: drawer(context),
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
                                  builder: (context) => CurrentPage()));
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
                                  builder: (context) => ClubListPage()));
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
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 100,
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
                            child: Text(value,
                                style: TextStyle(
                                  fontSize: 13,
                                )),
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
                  SizedBox(width: 15),
                  Container(
                    width: 75,
                    height: 40,
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
                            child: Text(value,
                                style: TextStyle(
                                  fontSize: 13,
                                )),
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
                  Flexible(fit: FlexFit.loose, child: SizedBox(width: 40))
                ],
              ),
              SizedBox(height: 30),
              StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        Container(
                          child: Center(
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Color(0xff3AAFFC),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 40),
                                  side: BorderSide(
                                    color: Color(0xff3AAFFC),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  '200000원',
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: Stack(
                            children: [
                              _categoryItem('아동', '0', 280, 95, 280, 60, () {}),
                              _categoryItem(
                                  '노인', '0', 300, 75, 170, 170, () {}),
                              Positioned(
                                left: 140,
                                top: 120,
                                child: PieChart(
                                  dataMap: dataMap,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 3.5,
                                  initialAngleInDegree: 0,
                                  chartType: ChartType.ring,
                                  ringStrokeWidth: 40,
                                  colorList: [
                                    Color(0xff3AAFFC),
                                    Color(0xFF9E9E9E),
                                    Color(0xff3AAFFC),
                                    Color(0xFF9E9E9E),
                                    Color(0xff3AAFFC),
                                    Color(0xFF9E9E9E)
                                  ],
                                  legendOptions: LegendOptions(
                                    showLegends: false,
                                  ),
                                  chartValuesOptions: ChartValuesOptions(
                                      showChartValueBackground: true,
                                      chartValueBackgroundColor:
                                          Colors.grey[300],
                                      showChartValues: true,
                                      showChartValuesInPercentage: false,
                                      showChartValuesOutside: true,
                                      decimalPlaces: 0,
                                      chartValueStyle: TextStyle(
                                          fontSize: 10, color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubAddPage extends StatefulWidget {
  const ClubAddPage({Key? key}) : super(key: key);

  @override
  _ClubAddPageState createState() => _ClubAddPageState();
}

class _ClubAddPageState extends State<ClubAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: Color(0xff3AAFFC))),
            title: Text('클럽 추가',
                style: TextStyle(
                  fontSize: 15,
                ))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff3AAFFC), width: 2))),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search,
                            color: Color(0xff3AAFFC), size: 30))
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: Get.width,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "내 클럽 생성하기",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
                    side: BorderSide(color: Colors.blue, width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  width: Get.width,
                  height: 120,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(),
                    child: Container(),
                  ))
            ],
          ),
        ));
  }
}

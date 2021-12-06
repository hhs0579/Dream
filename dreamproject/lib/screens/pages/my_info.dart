import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  PickedFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future _getImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              '내 정보',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                padding: EdgeInsets.only(left: 15),
                icon: Icon(Icons.receipt_long,
                    color: Color(0xff3AAFFC), size: 30),
                onPressed: () {}),
            actions: <Widget>[
              IconButton(
                  padding: EdgeInsets.only(right: 15),
                  icon:
                      Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                  onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 180,
                  margin:
                      EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 25),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 20,
                              left: 15,
                              right: 30,
                            ),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            child: Icon(Icons.person,
                                color: Colors.white, size: 45),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15, right: 30),
                            child: Text("홍길동",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, right: 30),
                              child: Text("San Francisco, CA",
                                  style: TextStyle(fontSize: 12)))
                        ],
                      ),
                      Container(height: 210, width: 1, color: Colors.grey[300]),
                      Container(
                        width: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "나의 포인트",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // 가용 포인트 변수
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "500,000",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Point",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "포인트 충전하기",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: Size(20, 30),
                                side: BorderSide(color: Colors.blue),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Text(
                              "후원 총 금액",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "500,000",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "원",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "회원님의 후원 수",
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "1,000",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "회",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 330,
                  height: 1,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "나의 후원내역",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(40, 35),
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "개인정보 설정",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(40, 35),
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "드럼 파트너 회원",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(40, 35),
                          side: BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Text(
                    "나의 클럽",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue)),
                      ),
                      Container(
                        width: 100,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue)),
                      ),
                      Container(
                        width: 100,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:dreamproject/screens/pages/feed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Write extends StatefulWidget {
  Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  var old = false;
  var child = false;
  var disorder = false;
  var multiculture = false;
  var pet = false;
  var poverty = false;

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<XFile> questionImages = [];

  @override
  void initState() {
    questionImages = [];
    super.initState();
  }

  Future _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = image;
      }
    });
    return _image;
  }

  Widget _ImageBox() {
    return GestureDetector(
      onTap: () async {
        XFile? result = await _getImage();
        if (result != null) {
          questionImages.add(result);
        }
      },
      child: SizedBox(
        width: 45,
        height: 45,
        child: Stack(
          children: [
            Center(child: Icon(Icons.attach_file, color: Color(0xff3AAFFC))),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          centerTitle: true,
          title: Text('작성'),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.close, color: Color(0xff3AAFFC), size: 30),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Feed()));
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Color(0xff3AAFFC), size: 30),
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer()),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 11),
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Checkbox(
                                        activeColor: Colors.blue,
                                        checkColor: Colors.white,
                                        value: old,
                                        onChanged: (value) {
                                          setState(() {
                                            old = value!;
                                          });
                                        }),
                                  ),
                                  Text('노인', style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 8),
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Checkbox(
                                        activeColor: Colors.blue,
                                        checkColor: Colors.white,
                                        value: child,
                                        onChanged: (value) {
                                          setState(() {
                                            child = value!;
                                          });
                                        }),
                                  ),
                                  Text('아동'),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Checkbox(
                                        activeColor: Colors.blue,
                                        checkColor: Colors.white,
                                        value: disorder,
                                        onChanged: (value) {
                                          setState(() {
                                            disorder = value!;
                                          });
                                        }),
                                  ),
                                  Text('장애', style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: Checkbox(
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: multiculture,
                                  onChanged: (value) {
                                    setState(() {
                                      multiculture = value!;
                                    });
                                  }),
                            ),
                            Text('다문화', style: TextStyle(fontSize: 12)),
                            Transform.scale(
                              scale: 0.8,
                              child: Checkbox(
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: pet,
                                  onChanged: (value) {
                                    setState(() {
                                      pet = value!;
                                    });
                                  }),
                            ),
                            Text('유기동물', style: TextStyle(fontSize: 12)),
                            Transform.scale(
                              scale: 0.8,
                              child: Checkbox(
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  value: poverty,
                                  onChanged: (value) {
                                    setState(() {
                                      poverty = value!;
                                    });
                                  }),
                            ),
                            Text('빈곤', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffd6d6d6))),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.top,
                        textAlign: TextAlign.start,
                        maxLines: 15,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: '내용작성',
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        _ImageBox(),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: questionImages.isEmpty
                          ? Container()
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: questionImages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Stack(
                                    children: [
                                      Container(
                                          width: 45,
                                          height: 45,
                                          child: Container() //이미지
                                          ),
                                    ],
                                  ),
                                );
                              }),
                    ),
                    SizedBox(height: 30),
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        child: TextButton(onPressed: () {}, child: Text('게시'))),
                  ],
                )),
          ),
        ));
  }
}

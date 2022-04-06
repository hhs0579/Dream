import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dreamproject/classes/toast_message.dart';
import 'package:dreamproject/controller/firebase_storage.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/home_page.dart';
import 'package:dreamproject/repo/database_service.dart';
import 'package:dreamproject/repo/image_helper.dart';
import 'package:dreamproject/repo/image_service.dart';
import 'package:dreamproject/screens/pages/feed.dart';

import 'package:dreamproject/screens/starts/login_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class Write extends StatefulWidget {
  Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  var old = false;
  var child = false;
  var disorder = false;
  var multiculture = false;
  var pet = false;
  var poverty = false;
  List<dynamic> like = [];
  List<String> select = [];
  List<String> commentList = [];
  String name = "";
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  User? _user;
  var visibley = false;

  String _profileImageURL = "";
  TextEditingController postTextEditController = TextEditingController();
  final _picker = ImagePicker();
  bool uploading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  AppData appdata = Get.find();
  @override
  void initState() {
    name = appdata.myInfo.name;
    super.initState();
    _prepareService();
  }

  void _prepareService() async {
    _user = _firebaseAuth.currentUser;
  }

  var likeNum = 0;
  var commentNum = 0;
  List<String> _arrImageUrls = [];

  List<XFile>? imageFileList = [];
  Future<void> _pickedImgs() async {
    if (imageFileList != null) {
      imageFileList?.clear();
    }
    try {
      final List<XFile>? imgs = await _picker.pickMultiImage(
        imageQuality: 70,
        maxWidth: 3000,
      );

      if (imgs!.isNotEmpty) {
        imageFileList!.addAll(imgs);
      }
      print(imgs.length.toString());
    } catch (e) {
      print(e.toString());
    }
    setState(() {});
  }

  Future<String> uploadFile(XFile _image) async {
    String imageurls = _image.name;
    Reference reference =
        FirebaseStorage.instance.ref().child('post').child(imageurls);

    UploadTask uploadTask = reference.putFile(File(_image.path));
    await uploadTask.whenComplete(() {});
    return await reference.getDownloadURL();
  }

  Future uploadFunction(List<XFile> _images) async {
    for (int i = 0; i < _images.length; i++) {
      var imageUrl = await uploadFile(_images[i]);
      _arrImageUrls.add(imageUrl.toString());
    }
  }

  Imageservice imageservice = Imageservice();
  @override
  Widget build(BuildContext context) {
    var key = randomString(16);
    var now = DateTime.now();

    var month = now.add(const Duration(days: 30));

    String formatDate = DateFormat('yyyy/MM/dd - HH:mm:ss').format(now);
    String yearmonthdate = DateFormat('yyyy.MM.dd').format(now);

    String future = DateFormat('yyyy.MM.dd').format(month);

    bool isPadMode = MediaQuery.of(context).size.width > 300;
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');
    List<Widget> _boxContents = [
      IconButton(
          onPressed: () {
            _pickedImgs();
          },
          icon: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6), shape: BoxShape.circle),
              child: Icon(
                CupertinoIcons.camera,
                color: Theme.of(context).colorScheme.primary,
              ))),
      Container(),
      Container(),
      imageFileList!.length <= 4
          ? Container()
          : FittedBox(
              child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      shape: BoxShape.circle),
                  child: Text(
                    '+${(imageFileList!.length - 4).toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ))),
    ];
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
                  title: Text('카카오톡 플친', textAlign: TextAlign.center),
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
                                            return select.add("노인");
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
                                            return select.add("아동");
                                          });
                                        }),
                                  ),
                                  Text('아동', style: TextStyle(fontSize: 12)),
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
                                            return select.add("장애");
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
                                      return select.add("다문화");
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
                                      return select.add("유기동물");
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
                                      return select.add("빈곤");
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
                        controller: postTextEditController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: '내용작성',
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(2),
                      crossAxisCount: isPadMode ? 4 : 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      children: List.generate(
                          4,
                          (index) => DottedBorder(
                              child: Container(
                                child: Center(child: _boxContents[index]),
                                decoration: index <= imageFileList!.length - 1
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(File(
                                                imageFileList![index].path))))
                                    : null,
                              ),
                              color: Colors.grey,
                              dashPattern: [5, 3],
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10))).toList(),
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: TextButton(
                        onPressed: () async {
                          await uploadFunction(imageFileList!);
                          setState(() {
                            visibley = true;
                          });
                        },
                        child: Text("업로드"),
                      ),
                    ),
                    Visibility(
                      visible: visibley,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: TextButton(
                              onPressed: () async {
                                final User? user = auth.currentUser;
                                final uid = user?.uid;

                                fireStore.collection('post').doc(key).set({
                                  'dateutc': DateTime.now(),
                                  'key': key,
                                  'post': postTextEditController.text,
                                  'image': _arrImageUrls,
                                  'uid': uid,
                                  'date': formatDate,
                                  'now': yearmonthdate,
                                  'future': future,
                                  'name': name,
                                  'select': select,
                                  'profile': appdata.myInfo.image,
                                  'commentList': commentList,
                                  'postcode': key,
                                  'like': like,
                                });

                                if ((child ||
                                        old ||
                                        pet ||
                                        disorder ||
                                        multiculture ||
                                        poverty) ==
                                    false) {
                                  Fluttertoast.showToast(
                                      msg: "카테고리를 하나이상 선택해주세요.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.lightBlue,
                                      fontSize: 12.0);
                                } else if (postTextEditController.text == "") {
                                  Fluttertoast.showToast(
                                      msg: "작성 내용을 입력해주세요.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.lightBlue,
                                      fontSize: 12.0);
                                } else {
                                  final Keys = key;
                                  final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Feed()));
                                }
                              },
                              child: Text('게시'))),
                    )
                  ],
                )),
          ),
        ));
  }
}

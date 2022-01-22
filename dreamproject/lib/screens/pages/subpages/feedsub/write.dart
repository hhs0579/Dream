import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/controller/firebase_storage.dart';
import 'package:dreamproject/home_page.dart';
import 'package:dreamproject/repo/database_service.dart';
import 'package:dreamproject/screens/pages/feed.dart';
import 'package:dreamproject/screens/pages/subpages/feedsub/qq.dart';
import 'package:dreamproject/screens/starts/login_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class Write extends StatefulWidget {
  Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  FileStorage _fileStoarge = Get.put(FileStorage());

  var old = false;
  var child = false;
  var disorder = false;
  var multiculture = false;
  var pet = false;
  var poverty = false;
  var date = DateTime.now().toUtc();

  File? _image;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String _profileImageURL = "";
  TextEditingController postTextEditController = TextEditingController();
  final _picker = ImagePicker();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<File> Images = [];

  @override
  void initState() {
    Images = [];
    super.initState();
    _prepareService();
  }

  void _prepareService() async {
    _user = _firebaseAuth.currentUser;
  }

  FirebaseStorage _storage = FirebaseStorage.instance;

  void _uploadImageToStorage() async {
    XFile? result = await _picker.pickImage(source: ImageSource.gallery);

    if (result == null) return;
    setState(() {
      _image = File(result.path);
    });

    Reference storageReference =
        _firebaseStorage.ref().child("post/${_user?.uid}");

    UploadTask storageUploadTask = storageReference.putFile(_image!);

    String downloadURL = await storageReference.getDownloadURL();

    setState(() {
      _profileImageURL = downloadURL;
    });
  }

  Future<String?> _uploadImage(String uploadFileName) async {
    try {
      File? image =
          (await _picker.pickImage(source: ImageSource.gallery)) as File?;

      print(image?.path ?? 'null');
      if (image != null) {
        Reference storageReference =
            _firebaseStorage.ref().child("post/${_user?.uid}");
        UploadTask storageUploadTask = storageReference.putFile(image);
        String downloadURL = await storageReference.getDownloadURL();
        setState(() {
          _profileImageURL = downloadURL;
        });
      }
    } catch (e) {
      print(e.toString());
    }
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
                        controller: postTextEditController,
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
                        IconButton(
                            onPressed: _uploadImageToStorage,
                            icon: Icon(Icons.attach_file)),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(_profileImageURL),
                                          radius: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: Images.isEmpty
                          ? Container()
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Images.length,
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
                                      RawMaterialButton(
                                        fillColor:
                                            Theme.of(context).accentColor,
                                        child: Icon(
                                          Icons.add_photo_alternate_rounded,
                                          color: Colors.white,
                                        ),
                                        elevation: 8,
                                        onPressed: () {},
                                        padding: EdgeInsets.all(15),
                                        shape: CircleBorder(),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                    ),
                    SizedBox(height: 30),
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        child: TextButton(
                            onPressed: () {
                              var key = randomString(16);
                              final User? user = auth.currentUser;
                              final uid = user?.uid;
                              var name = '';
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc('${user?.uid}')
                                  .get()
                                  .then((value) => {
                                        name = value['name'],
                                      });

                              fireStore.collection('post').doc(key).set({
                                'key': key,
                                'post': postTextEditController.text,
                                'image': _profileImageURL,
                                'uid': uid,
                                'old': old,
                                'child': child,
                                'disorder': disorder,
                                'multiculture': multiculture,
                                'pet': pet,
                                'poverty': poverty,
                                'date': date,
                                'name': name,
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
                                Get.to(HomePage());
                              }
                            },
                            child: Text('게시'))),
                  ],
                )),
          ),
        ));
  }
}

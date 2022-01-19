import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/controller/firebase_storage.dart';
import 'package:dreamproject/home_page.dart';
import 'package:dreamproject/screens/pages/feed.dart';
import 'package:dreamproject/screens/starts/login_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  File? _image;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String _profileImageURL = "";

  TextEditingController postTextEditController = TextEditingController();
  final _picker = ImagePicker();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<File> questionImages = [];

  @override
  void initState() {
    questionImages = [];
    super.initState();
    _prepareService();
  }

  void _prepareService() async {
    _user = await _firebaseAuth.currentUser;
  }

  FirebaseStorage _storage = FirebaseStorage.instance;
// Image Picker
  List<File> _images = [];

  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile;
    // Let user select photo from gallery
    if (gallery) {
      pickedFile = (await picker.getImage(
        source: ImageSource.gallery,
      ))!;
    }
    // Otherwise open camera to get new photo
    else {
      pickedFile = (await picker.getImage(
        source: ImageSource.camera,
      ))!;
    }

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
        //_image = File(pickedFile.path); // Use if you only need a single picture
      } else {
        print('No image selected.');
      }
    });
  }
  // DocumentReference sightingRef = FirebaseFirestore.instance.collection("post image").doc();
  // Future<String> uploadFile(File _image) async {
  //   Reference storageReference = FirebaseStorage.instance
  //       .ref()
  //       .child('sightings/${Path.basename(_image.path)}');
  //  UploadTask uploadTask = storageReference.putFile(_image);
  //   await uploadTask.onComplete;
  //   print('File Uploaded');
  //   String returnURL;
  //   await storageReference.getDownloadURL().then((fileURL) {
  //     returnURL = fileURL;
  //   });
  //   return returnURL;
  // }

  Future _getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(
        source: ImageSource.gallery, maxWidth: 650, maxHeight: 100);
    // 사진의 크기를 지정 650*100 이유: firebase는 유료이다.
    setState(() {
      if (_image == null) {
        setState(() {});
      } else {
        _image = File(pickedFile!.path);
      }
    });
  }

  Future<String?> _uploadImage(String uploadFileName) async {
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      print(image?.path ?? 'null');
      if (image != null) {
        Reference storageReference =
            _firebaseStorage.ref().child("post/${_user?.uid}");
        UploadTask storageUploadTask = storageReference.putFile(_image!);
        String downloadURL = await storageReference.getDownloadURL();
        setState(() {
          _profileImageURL = downloadURL;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Widget _ImageBox() {
    return GestureDetector(
      onTap: () async {
        File? result = await _getImage();
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
                                        Icon(
                                          Icons.camera_alt_rounded,
                                          color: Colors.grey,
                                        ),
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
                                      RawMaterialButton(
                                        fillColor:
                                            Theme.of(context).accentColor,
                                        child: Icon(
                                          Icons.add_photo_alternate_rounded,
                                          color: Colors.white,
                                        ),
                                        elevation: 8,
                                        onPressed: () {
                                          getImage(true);
                                        },
                                        padding: EdgeInsets.all(15),
                                        shape: CircleBorder(),
                                      ),
                                      Container(child: Image.file(_image!))
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
                              _uploadImage;
                            },
                            child: Text('게시'))),
                  ],
                )),
          ),
        ));
  }
  //   void _uploadImageToStorage(ImageSource source) async {
  //   XFile? image = await ImagePicker.pickImage(source: source);

  //   if (image == null) return;
  //   setState(() {
  //     _image = image as File?;
  //   });

  //   // 프로필 사진을 업로드할 경로와 파일명을 정의. 사용자의 uid를 이용하여 파일명의 중복 가능성 제거
  //   Reference storageReference =
  //       _firebaseStorage.ref().child("profile/${_user?.uid}");

  //   // 파일 업로드
  //  UploadTask storageUploadTask = storageReference.putFile(_image!);

  //   // 파일 업로드 완료까지 대기
  //   await storageUploadTask.onComplete;

  //   // 업로드한 사진의 URL 획득
  //   String downloadURL = await storageReference.getDownloadURL();

  //   // 업로드된 사진의 URL을 페이지에 반영
  //   setState(() {
  //     _profileImageURL = downloadURL;
  //   });
  // }
}

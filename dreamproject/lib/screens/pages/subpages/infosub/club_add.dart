import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/classes/toast_message.dart';
import 'package:dreamproject/controller/database_controller.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/home_page.dart';
import 'package:dreamproject/model/club_model.dart';
import 'package:dreamproject/repo/database_service.dart';
import 'package:dreamproject/repo/image_service.dart';
import 'package:dreamproject/repo/join_validation.dart';
import 'package:dreamproject/utils/loading.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ClubAddPage extends StatefulWidget {
  const ClubAddPage({Key? key}) : super(key: key);

  @override
  _ClubAddPageState createState() => _ClubAddPageState();
}

class _ClubAddPageState extends State<ClubAddPage> {
  bool _isClubcreate = false;
  bool _isSearch = false;
  String resultURL = '';
  AppData appdata = Get.find();

  var _selectindex;
  String _selectclub = '';
  TextEditingController _clubNameController = TextEditingController();
  TextEditingController _searchController = TextEditingController();

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference clubCollection =
      FirebaseFirestore.instance.collection('clubs');

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  void initState() {
    _selectindex = null;
    super.initState();
  }

  Future _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = image;
      }
    });
  }

  bool _hasSearchWords({
    required ClubModel clubmodel,
    required String searchWords,
  }) {
    if (clubmodel.name.contains(searchWords)) {
      return true;
    } else {
      return false;
    }
  }

  bool _isduplicateClubApply(String clubname) {
    String temp = '';
    for (var element in appdata.myInfo.myclubs) {
      if (element == clubname) {
        temp = clubname;
      }
    }
    if (temp == '') {
      return true;
    } else {
      return false;
    }
  }

  _clubeCreateOff() {
    return Container(
      width: Get.width,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isClubcreate = true;
          });
        },
        child: Text(
          "내 클럽 생성하기",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff3AAFFC),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          side: BorderSide(color: Color(0xff3AAFFC), width: 1.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

  _clubeCreateOn() {
    return Container(
        width: Get.width,
        height: 300,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
                color: _isEnabldcheck() ? Color(0xff3AAFFC) : Color(0xffd6d6d6),
                width: 1.5),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _clubNameController.text = '';
                          _image = null;
                          _isClubcreate = false;
                        });
                      },
                      icon: Icon(Icons.close,
                          color: _isEnabldcheck()
                              ? Color(0xff3AAFFC)
                              : Color(0xffd6d6d6)))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Text('클럽이름',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                    SizedBox(width: 50),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        width: 210,
                        height: 60,
                        child: TextField(
                            controller: _clubNameController,
                            textAlign: TextAlign.right,
                            maxLength: 7,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffd6d6d6))))),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 25,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('사진등록',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                    SizedBox(width: 30),
                    _clubimage()
                  ]),
                  SizedBox(height: 24),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(23)),
                child: Container(
                  width: 370,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _isEnabldcheck()
                        ? () async {
                            try {
                              if (vaildationClubname(
                                      _clubNameController.text) ==
                                  null) {
                                if (await databaseController
                                        .isDuplicatedclubname(
                                            _clubNameController.text) ==
                                    true) {
                                  toastMessage('중복된 클럽 이름입니다. 다시입력해주세요.');
                                } else if (appdata.myInfo.myclubs.length == 3) {
                                  toastMessage('클럽의 가입 및 생성은 3개까지 가능합니다.');
                                } else {
                                  appdata.isLoadingScreen = true;
                                  resultURL = await imageservice
                                      .uploadClubImageToStorage(
                                          _clubNameController.text, _image!);
                                  DatabaseService(uid: appdata.myInfo.uid)
                                      .setClubData(
                                          _clubNameController.text, resultURL);

                                  appdata.myInfo.myclubs
                                      .add(_clubNameController.text);

                                  userCollection.doc(appdata.myInfo.uid).update(
                                      {'myclubs': appdata.myInfo.myclubs});

                                  toastMessage('클럽 생성이 완료되었습니다.');
                                  appdata.isLoadingScreen = false;
                                  setState(() {
                                    _isClubcreate = false;
                                    _clubNameController.text = '';
                                    _image = null;
                                  });
                                }
                              }
                            } catch (e) {
                              toastMessage('오류가 발생했습니다.');
                              print(e);
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(primary: Color(0xff3AAFFC)),
                    child: Text('클럽 생성하기',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  _ClubItem(name, image, user, point, index) {
    return Container(
        width: Get.width,
        height: 120,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: _selectindex == index ? Colors.blue[50] : Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
              color: _selectindex == index ? Colors.blue : Color(0xffd6d6d6),
              width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (_selectindex == index) {
                _selectindex = null;
                _selectclub = '';
              } else {
                _selectindex = index;
                _selectclub = name;
              }
            });
          },
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(left: 15, top: 10),
                      decoration: BoxDecoration(
                          color:
                              _selectindex == index ? Color(0xff3AAFFC) : null,
                          shape: BoxShape.circle,
                          border: _selectindex == index
                              ? null
                              : Border.all(color: Color(0xffd6d6d6))),
                      child: _selectindex == index
                          ? Icon(Icons.done, color: Colors.white)
                          : null)
                ],
              ),
              SizedBox(width: 15),
              Container(
                width: 80,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: Color(0xff3AAFFC),
                              )),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(image))),
                      SizedBox(height: 10),
                      Text(name,
                          style: TextStyle(
                              fontSize: 11, color: Color(0xff3AAFFC))),
                    ]),
              ),
              SizedBox(width: 15),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Container(
                        width: 60,
                        child: Text('회원 수',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 100,
                        child: Text(user.toString() + ' 명',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(fontSize: 13, color: Colors.black)),
                      ),
                    ]),
                    SizedBox(height: 15),
                    Row(children: [
                      Container(
                        width: 60,
                        child: Text('총 기부금',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 100,
                        child: Text(point.toString() + ' 원',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(fontSize: 13, color: Colors.black)),
                      ),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _clubimage() {
    return Flexible(
        fit: FlexFit.tight,
        child: _image == null
            ? ElevatedButton(
                onPressed: () {
                  _getImage();
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffd6d6d6),
                  radius: 50,
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0, shape: CircleBorder()),
              )
            : ElevatedButton(
                onPressed: () {
                  _getImage();
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(File(_image!.path)),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0, shape: CircleBorder()),
              ));
  }

  _isEnabldcheck() {
    if (_clubNameController.text.isEmpty == false || _image != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _clubStream = FirebaseFirestore.instance
        .collection('clubs')
        .orderBy('clubuser')
        .snapshots();
    return GetBuilder(
        builder: (AppData appdata) => Loading(
                child: Stack(
              children: [
                Scaffold(
                    appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        centerTitle: true,
                        leading: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back,
                                color: Color(0xff3AAFFC))),
                        title: Text('클럽 추가',
                            style: TextStyle(
                              fontSize: 15,
                            ))),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
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
                                      controller: _searchController,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff3AAFFC),
                                                  width: 2))),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isSearch = true;
                                          });
                                        },
                                        icon: Icon(Icons.search,
                                            color: Color(0xff3AAFFC),
                                            size: 30)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                                child: _isClubcreate == false
                                    ? _clubeCreateOff()
                                    : _clubeCreateOn()),
                            StreamBuilder<QuerySnapshot>(
                                stream: _clubStream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return Center(child: Text('오류가 발생했습니다.'));
                                  }

                                  if (snapshot.data == null) {
                                    return Container();
                                  }

                                  List<ClubModel> clubmodels = [];

                                  if (_isSearch) {
                                    for (var element in snapshot.data!.docs) {
                                      ClubModel clubmodel = ClubModel.fromJson(
                                          element.data()
                                              as Map<String, dynamic>);
                                      if (_hasSearchWords(
                                          clubmodel: clubmodel,
                                          searchWords:
                                              _searchController.text)) {
                                        if (clubmodel.isaccsess == true) {
                                          clubmodels.add(clubmodel);
                                        }
                                      } else {}
                                    }
                                  } else {
                                    for (var value in snapshot.data!.docs) {
                                      ClubModel clubmodel = ClubModel.fromJson(
                                          value.data() as Map<String, dynamic>);
                                      if (clubmodel.isaccsess == true) {
                                        clubmodels.add(clubmodel);
                                      }
                                    }
                                  }

                                  clubmodels = clubmodels.reversed.toList();

                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.68,
                                    child: ListView.builder(
                                        itemCount: clubmodels.length,
                                        itemBuilder: (context, index) {
                                          ClubModel clubmodel =
                                              clubmodels.elementAt(index);
                                          return _ClubItem(
                                              clubmodel.name,
                                              clubmodel.image,
                                              clubmodel.clubuser,
                                              clubmodel.clubdonatepoint,
                                              index);
                                        }),
                                  );
                                }),
                          ],
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: 400,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                          onPressed: () async {
                            QuerySnapshot querySnapshot =
                                await FirebaseFirestore.instance
                                    .collection('clubs')
                                    .where('name', isEqualTo: _selectclub)
                                    .get();
                            ClubModel clubmodel = ClubModel.fromJson(
                                querySnapshot.docs.first.data()
                                    as Map<String, dynamic>);
                            if (_selectindex == null || _selectclub == '') {
                              toastMessage('추가 할 클럽을 선택해주세요.');
                            } else if (appdata.myInfo.myclubs.length == 3) {
                              toastMessage('클럽 가입 및 생성은 3개까지 가능합니다.');
                            } else if (_isduplicateClubApply(_selectclub) ==
                                false) {
                              toastMessage('이미 가입한 클럽입니다.');
                            } else {
                              appdata.myInfo.myclubs.add(_selectclub);
                              clubmodel.clubuserlist.add(_selectclub);
                              userCollection
                                  .doc(appdata.myInfo.uid)
                                  .update({'myclubs': appdata.myInfo.myclubs});
                              clubCollection.doc(_selectclub).update({
                                'clubuser': clubmodel.clubuser + 1,
                                'clubuserlist': clubmodel.clubuserlist
                              });
                              Get.back();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            primary: Color(0xff3AAFFC),
                            side: BorderSide(color: Colors.white, width: 2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          child: Text('선택한 클럽 추가하기',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              )))),
                )
              ],
            )));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/classes/right_drawer.dart';
import 'package:dreamproject/classes/toast_message.dart';
import 'package:dreamproject/controller/database_controller.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/model/club_model.dart';
import 'package:dreamproject/repo/image_service.dart';
import 'package:dreamproject/screens/pages/subpages/infosub/club_add.dart';
import 'package:dreamproject/screens/pages/subpages/infosub/point_add.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'subpages/infosub/fix_info.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference clubCollection =
      FirebaseFirestore.instance.collection('clubs');

  AppData appdata = Get.find();
  final _picker = ImagePicker();

  String resultURL = '';
  String clubURL = '';
  bool isProfile = false;
  var _member = 0;
  var _donation = 0;

  @override
  void initState() {
    resultURL = appdata.myInfo.image;

    super.initState();
  }

  void connectKakaoUrl() async {
    Uri url = await TalkApi.instance.addChannelUrl('_ZeUTxl');
    try {
      await launchBrowserTab(url);
    } catch (error) {
      print("실패");
      print(error);
    }
  }

  _profileImage(context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 15,
              right: 30,
            ),
            child: Container(width: 70, height: 70, child: _profileImageOn())),
        Positioned(
            right: 22,
            top: 60,
            child: Container(
              width: 25,
              height: 25,
              child: CircleAvatar(
                backgroundColor: Color(0xff3AAFFC),
                child: IconButton(
                  onPressed: () async {
                    try {
                      XFile? result =
                          await _picker.pickImage(source: ImageSource.gallery);
                      resultURL = await imageservice
                          .uploadProfileImageToStorage(result!);
                      toastMessage('프로필 사진이 변경되었습니다.');
                    } catch (e) {
                      toastMessage('오류가 발생했습니다.');
                      print(e);
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.edit, color: Colors.white),
                  iconSize: 15,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
            ))
      ],
    );
  }

  _profileImageOn() {
    return resultURL == ''
        ? Container(
            width: 70,
            height: 70,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                backgroundImage: AssetImage('assets/imgs/basic.png')))
        : Container(
            width: 70,
            height: 70,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                backgroundImage: NetworkImage(resultURL)));
  }

  _myclublistOn(ClubModel clubmodel, double margin) {
    return clubmodel.isaccsess
        ? _myclublistItem(clubmodel, margin)
        : Container(
            margin: EdgeInsets.only(left: margin),
            width: 100,
            height: 220,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        margin: EdgeInsets.only(left: 20.0, top: 12),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(clubmodel.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, bottom: 7, left: 20),
                        child: Text(clubmodel.name,
                            style: TextStyle(
                              fontSize: 11,
                            )),
                      ),
                    ]),
                    Container(
                      margin: EdgeInsets.only(top: 7, right: 3),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert, color: Colors.blue),
                            iconSize: 15,
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(width: 80, height: 1, color: Colors.grey[350]),
                SizedBox(height: 10),
                Container(
                  width: 80,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("회원 수",
                              style: TextStyle(
                                  fontSize: 9, color: Colors.grey[300])),
                          SizedBox(width: 9),
                          Text(clubmodel.clubuser.toString() + ' 명',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300])),
                        ],
                      ),
                      SizedBox(height: 7),
                      Text("총 기부금",
                          style:
                              TextStyle(fontSize: 9, color: Colors.grey[300])),
                      SizedBox(height: 3),
                      Text(clubmodel.clubdonatepoint.toString() + ' 원',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[300])),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(width: Get.width, height: 1, color: Colors.blue),
                Flexible(
                  fit: FlexFit.tight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    child: Container(
                      width: 98,
                      height: 35,
                      child: Center(
                        child: Text('승인 대기중',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  _myclublistItem(ClubModel clubmodel, double margin) {
    clubURL = clubmodel.image;
    return appdata.myInfo.uid == clubmodel.clubmaster
        ? Container(
            margin: EdgeInsets.only(left: margin),
            width: 100,
            height: 220,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        margin: EdgeInsets.only(left: 20.0, top: 12),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(clubURL),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, bottom: 7, left: 20),
                        child: Text(clubmodel.name,
                            style: TextStyle(
                              fontSize: 11,
                            )),
                      ),
                    ]),
                    Container(
                      margin: EdgeInsets.only(top: 7, right: 3),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert, color: Colors.blue),
                            iconSize: 15,
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(width: 80, height: 1, color: Colors.grey[350]),
                SizedBox(height: 10),
                Container(
                  width: 80,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("회원 수",
                              style:
                                  TextStyle(fontSize: 9, color: Colors.grey)),
                          SizedBox(width: 9),
                          Text(clubmodel.clubuser.toString() + ' 명',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 7),
                      Text("총 기부금",
                          style: TextStyle(fontSize: 9, color: Colors.grey)),
                      SizedBox(height: 3),
                      Text(clubmodel.clubdonatepoint.toString() + ' 원',
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Flexible(
                  fit: FlexFit.tight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    child: Container(
                        width: 98,
                        height: 35,
                        color: Colors.blue,
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                    cancelTextColor: Color(0xff3AAFFC),
                                    title: '',
                                    content: Text('정말 해체하시겠습니까?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          appdata.myInfo.myclubs
                                              .remove(clubmodel.name);
                                          userCollection
                                              .doc(appdata.myInfo.uid)
                                              .update({
                                            'myclubs': appdata.myInfo.myclubs
                                          });
                                          clubCollection
                                              .doc(clubmodel.name)
                                              .delete();
                                          FirebaseFirestore.instance
                                              .doc('club/${clubmodel.name}')
                                              .delete();

                                          toastMessage('해체 되었습니다.');
                                          Get.back();
                                        },
                                        child: Text('확인'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text('취소'),
                                      ),
                                    ],
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(6),
                                  primary: Colors.blue,
                                  elevation: 0,
                                ),
                                child: Text("해체",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            Container(
                              width: 0.5,
                              height: 22,
                              color: Colors.white54,
                            ),
                            Container(
                              width: 57.5,
                              child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    XFile? result = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                    clubURL = await imageservice
                                        .uploadClubImageToStorage(
                                            clubmodel.name, result!);
                                    clubmodel.image = clubURL;
                                    toastMessage('클럽 사진이 변경되었습니다.');
                                  } catch (e) {
                                    toastMessage('오류가 발생했습니다.');
                                    print(e);
                                  }
                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(6),
                                  primary: Colors.blue,
                                  elevation: 0,
                                ),
                                child: Text("로고변경",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(left: margin),
            width: 100,
            height: 220,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        margin: EdgeInsets.only(left: 20.0, top: 12),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(clubmodel.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, bottom: 7, left: 20),
                        child: Text(clubmodel.name,
                            style: TextStyle(
                              fontSize: 11,
                            )),
                      ),
                    ]),
                    Container(
                      margin: EdgeInsets.only(top: 7, right: 3),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert, color: Colors.blue),
                            iconSize: 15,
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(width: 80, height: 1, color: Colors.grey[350]),
                SizedBox(height: 10),
                Container(
                  width: 80,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("회원 수",
                              style:
                                  TextStyle(fontSize: 9, color: Colors.grey)),
                          SizedBox(width: 9),
                          Text(clubmodel.clubuser.toString() + ' 명',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 7),
                      Text("총 기부금",
                          style: TextStyle(fontSize: 9, color: Colors.grey)),
                      SizedBox(height: 3),
                      Text(clubmodel.clubdonatepoint.toString() + ' 원',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Flexible(
                  fit: FlexFit.tight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    child: Container(
                        width: 98,
                        height: 35,
                        color: Colors.blue,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              cancelTextColor: Color(0xff3AAFFC),
                              title: '',
                              content: Text('정말 탈퇴하시겠습니까?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    appdata.myInfo.myclubs
                                        .remove(clubmodel.name);
                                    clubmodel.clubuserlist
                                        .remove(appdata.myInfo.uid);

                                    userCollection
                                        .doc(appdata.myInfo.uid)
                                        .update({
                                      'myclubs': appdata.myInfo.myclubs
                                    });
                                    clubCollection.doc(clubmodel.name).update({
                                      'clubuserlist': clubmodel.clubuserlist,
                                      'clubuser': clubmodel.clubuser - 1
                                    });
                                    Get.back();
                                    setState(() {});
                                  },
                                  child: Text('확인'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('취소'),
                                ),
                              ],
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(6),
                            primary: Colors.blue,
                            elevation: 0,
                          ),
                          child: Text("클럽 탈퇴",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              )),
                        )),
                  ),
                )
              ],
            ),
          );
  }

  _myclublistOff(double margin) {
    return Container(
      margin: EdgeInsets.only(left: margin),
      width: 100,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xffd6d6d6)),
      ),
      child: Column(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            margin: EdgeInsets.only(top: 12),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => ClubAddPage());
              },
              child: Icon(Icons.add, color: Colors.white),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Color(0xffd6d6d6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "클럽 추가",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ),
          SizedBox(height: 69),
          Flexible(
            fit: FlexFit.tight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
              child: Container(
                width: 98,
                height: 35,
                color: Color(0xffd6d6d6),
              ),
            ),
          )
        ],
      ),
    );
  }

  _getclubmodel() async {
    List<dynamic> clublist = appdata.myInfo.myclubs;
    List<dynamic> resultclublist = [];
    if (clublist.isEmpty) {
      resultclublist.add('');
      resultclublist.add('');
      resultclublist.add('');
    } else {
      for (var element in clublist) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('clubs')
            .where('name', isEqualTo: element)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          ClubModel clubmodel = ClubModel.fromJson(
              querySnapshot.docs.first.data() as Map<String, dynamic>);
          resultclublist.add(clubmodel);
        }
      }

      while (true) {
        if (resultclublist.length == 3) {
          break;
        }
        resultclublist.add('');
      }
    }
    return resultclublist;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AppData appdata) {
      return Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            endDrawer: drawer(context),
            appBar: AppBar(
              title: Text(
                '내 정보',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                    padding: EdgeInsets.only(right: 15),
                    icon: Icon(Icons.more_vert,
                        color: Color(0xff3AAFFC), size: 30),
                    onPressed: () =>
                        _scaffoldKey.currentState!.openEndDrawer()),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 180,
                      margin: EdgeInsets.only(top: 20, bottom: 25),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              _profileImage(context),
                              Container(
                                width: 55,
                                margin: EdgeInsets.only(
                                    top: 10, left: 15, right: 30),
                                child: Text(appdata.myInfo.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                  width: 120,
                                  margin: EdgeInsets.only(left: 15, right: 30),
                                  child: Text(appdata.myInfo.address,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10)))
                            ],
                          ),
                          Container(
                              height: 210, width: 1, color: Colors.grey[300]),
                          Container(
                            width: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "나의 포인트",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // 가용 포인트 변수
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      appdata.myInfo.point.toString(),
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
                                  onPressed: () async {
                                    connectKakaoUrl();
                                  },
                                  child: Text(
                                    "포인트 충전하기",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.white,
                                    minimumSize: Size(20, 30),
                                    side: BorderSide(color: Colors.blue),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                Text(
                                  "후원 총 금액",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      appdata.myInfo.totaldonatepoint
                                          .toString(),
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
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      appdata.myInfo.totaldonatenumber
                                          .toString(),
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
                      width: Get.width,
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
                              elevation: 0,
                              primary: Colors.white,
                              minimumSize: Size(40, 35),
                              side: BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(() => FixInfo());
                            },
                            child: Text(
                              "개인정보 설정",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
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
                              "드럼 파트너 신청",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Color(0xff3AAFFC),
                              minimumSize: Size(40, 35),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "나의 클럽",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    FutureBuilder<dynamic>(
                        future: _getclubmodel(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(child: Text('오류가 발생했습니다.'));
                          } else if (snapshot.data == null) {
                            return Container();
                          } else {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 10),
                              height: 220,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    List<dynamic> clublist = snapshot.data!;
                                    return clublist[index] == ''
                                        ? index == 0
                                            ? _myclublistOff(0)
                                            : _myclublistOff(15)
                                        : index == 0
                                            ? _myclublistOn(clublist[index], 0)
                                            : _myclublistOn(
                                                clublist[index], 15);
                                  }),
                            );
                          }
                        }),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "나의 게시글",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 330,
                      height: 300,
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: List.generate(
                            15,
                            (index) => Container(
                                color: Colors.lightBlue,
                                child: Text('Item $index'))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

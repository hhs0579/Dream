import 'package:dreamproject/classes/toast_message.dart';
import 'package:dreamproject/controller/auth_controller.dart';
import 'package:dreamproject/controller/database_controller.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/repo/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dreamproject/repo/join_validation.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'dart:async';

class FixInfo extends StatefulWidget {
  @override
  _FixInfoState createState() => _FixInfoState();
}

class _FixInfoState extends State<FixInfo> {
  String email = '';
  String name = '';
  String password = '';
  String gender = '';
  String address = '';
  String postcode = '';

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();
  final otpController = TextEditingController();
  final postController = TextEditingController();
  final addressController = TextEditingController();
  final deaddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final verifyPasswordFocusNode = FocusNode();
  final otpFocusNode = FocusNode();
  final deaddressFocusNode = FocusNode();

  bool passwordHide = true;

  DatabaseController databaseController = DatabaseController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  final AppData appdata = Get.find();

  void initState() {
    setState(() {
      nameController.text = appdata.myInfo.name;
      passwordController.text = appdata.myInfo.password;
      verifyPasswordController.text = appdata.myInfo.password;
      gender = appdata.myInfo.gender;
      addressController.text = appdata.myInfo.address;
      deaddressController.text = appdata.myInfo.addressdetail;
      phoneNumberController.text = appdata.myInfo.phone;
      postController.text = appdata.myInfo.postcode;
    });
    super.initState();
  }

  Future<UserCredential?> UpdateUserCredential() async {
    String uid = appdata.myInfo.uid;
    try {
      await DatabaseService(uid: uid).updateUserData(
        nameController.text,
        passwordController.text,
        gender,
        phoneNumberController.text,
        addressController.text,
        deaddressController.text,
        postController.text,
      );
    } catch (e) {
      errorToast(e);
      print(e);
    }
  }

  genderButton(gendert, onPressed) {
    return Container(
      width: 45,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(side: BorderSide(color: Color(0xff3AAFFC))),
          primary: gender == gendert ? Color(0xff3AAFFC) : Colors.white,
        ),
        child: Text(
          gendert,
          style: TextStyle(
              color: gender == gendert ? Colors.white : Color(0xff3AAFFC)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "회원가입",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment(0, 0),
                  height: 70,
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.0, color: Colors.black12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Icon(Icons.create_rounded,
                            color: Color(0xff3AAFFC)),
                      ),
                      Container(
                        width: 60,
                        child: Text("이름",
                            style: TextStyle(
                              color: Color(0xff3AAFFC),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: nameController,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.0, color: Colors.black12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Icon(Icons.male, color: Color(0xff3AAFFC)),
                      ),
                      Container(
                        width: 60,
                        child: Text("성별",
                            style: TextStyle(
                              color: Color(0xff3AAFFC),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        width: 190,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            genderButton("남", () {
                              if (gender == "남") {
                                setState(() {
                                  gender = '';
                                });
                              } else {
                                setState(() {
                                  gender = '남';
                                });
                              }
                            }),
                            SizedBox(width: 10),
                            genderButton("여", () {
                              if (gender == "여") {
                                setState(() {
                                  gender = '';
                                });
                              } else {
                                setState(() {
                                  gender = '여';
                                });
                              }
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment(0, 0),
                  height: 70,
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.0, color: Colors.black12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Icon(Icons.lock, color: Color(0xff3AAFFC)),
                      ),
                      Container(
                        width: 60,
                        child: Text("비밀번호",
                            style: TextStyle(
                              color: Color(0xff3AAFFC),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              errorStyle: TextStyle(color: Color(0xff3AAFFC)),
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(verifyPasswordFocusNode),
                            focusNode: passwordFocusNode,
                            obscureText: passwordHide,
                            controller: passwordController,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment(0, 0),
                  height: 70,
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.0, color: Colors.black12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Icon(Icons.lock, color: Color(0xff3AAFFC)),
                      ),
                      Container(
                        width: 90,
                        child: Text("비밀번호 확인",
                            style: TextStyle(
                              color: Color(0xff3AAFFC),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              errorStyle: TextStyle(color: Color(0xff3AAFFC)),
                            ),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: verifyPasswordFocusNode,
                            obscureText: passwordHide,
                            controller: verifyPasswordController,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment(0, 0),
                  height: 190,
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.0, color: Colors.black12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(Icons.place, color: Color(0xff3AAFFC)),
                          ),
                          Container(
                            width: 90,
                            child: Text("우편번호",
                                style: TextStyle(
                                  color: Color(0xff3AAFFC),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: TextField(
                                controller: postController,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                readOnly: true,
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            child: TextButton(
                              child: Text(
                                "우편번호 검색",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => KpostalView(
                                      useLocalServer: true,
                                      kakaoKey:
                                          'e7332691953b203d499ffb8ad8a411c6',
                                      callback: (Kpostal result) {
                                        deaddressFocusNode.requestFocus();
                                        setState(() {
                                          address = result.address;
                                          postcode = result.postCode;
                                          addressController.text = address;
                                          postController.text = postcode;
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Color(0xff3AAFFC),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 43),
                            width: 90,
                            child: Text("주소",
                                style: TextStyle(
                                  color: Color(0xff3AAFFC),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: TextField(
                                controller: addressController,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                readOnly: true,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 43),
                            width: 90,
                            child: Text("상세주소",
                                style: TextStyle(
                                  color: Color(0xff3AAFFC),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: TextField(
                                controller: deaddressController,
                                focusNode: deaddressFocusNode,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment(0, 0),
                  height: 70,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1.0, color: Colors.black12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Icon(Icons.call, color: Color(0xff3AAFFC)),
                      ),
                      Container(
                        width: 60,
                        child: Text("핸드폰",
                            style: TextStyle(
                              color: Color(0xff3AAFFC),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: TextFormField(
                            controller: phoneNumberController,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 25,
                  ),
                  width: 330,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (vaildationname(nameController.text) == null) {
                        if (gender == '') {
                          toastMessage("성별을 선택해주세요.");
                        } else {
                          if (passwordController.text !=
                              verifyPasswordController.text) {
                            toastMessage("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
                          } else {
                            if (vaildationpassword(passwordController.text) ==
                                null) {
                              if (addressController.text == '') {
                                toastMessage("주소를 입력해주세요.");
                              } else {
                                if (deaddressController.text == '') {
                                  toastMessage("상세주소를 입력해주세요.");
                                } else {
                                  if (vaildationPhoneNumber(
                                          phoneNumberController.text) ==
                                      null) {
                                    UpdateUserCredential();
                                    await databaseController
                                        .fetchMyInfo(appdata.myInfo.email);
                                    toastMessage('수정이 완료되었습니다.');
                                    setState(() {});
                                    Get.back();
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    child: Text(
                      "수정하기",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    bottom: 30,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "뒤로가기",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff3AAFFC),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(330, 45),
                      side: BorderSide(color: Color(0xff3AAFFC)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

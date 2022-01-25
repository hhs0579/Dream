import 'package:dreamproject/classes/toast_message.dart';
import 'package:dreamproject/controller/database_controller.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/home_page.dart';
import 'package:dreamproject/repo/auth_service.dart';
import 'package:dreamproject/repo/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dreamproject/repo/join_validation.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'dart:async';

class FixInfo extends StatefulWidget {
  @override
  _FixInfoState createState() => _FixInfoState();
}

class _FixInfoState extends State<FixInfo> {
  bool _isAuthsms = false;

  Timer? _timer;
  var _time = 0;

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
  final postTextEditor = TextEditingController();
  final addressTextEditor = TextEditingController();
  final deaddressTextEditor = TextEditingController();
  final phoneNumberController = TextEditingController();

  final passwordFocusNode = FocusNode();
  final verifyPasswordFocusNode = FocusNode();
  final otpFocusNode = FocusNode();
  final deaddressFocusNode = FocusNode();

  bool authOk = false;
  bool isotpconfirm = false;
  bool duplicateEmail = false;
  bool passwordHide = true;

  late String verificationId;

  DatabaseController databaseController = DatabaseController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authJoin = AuthService();

  final formKey = GlobalKey<FormState>();
  final AppData appdata = Get.find();

  final AuthService _authService = AuthService();

  void initState() {
    setState(() {
      emailController.text = appdata.myInfo.email;
      nameController.text = appdata.myInfo.name;
      passwordController.text = appdata.myInfo.password;
      verifyPasswordController.text = appdata.myInfo.password;
      addressTextEditor.text = appdata.myInfo.address;
      gender = appdata.myInfo.gender;
      deaddressTextEditor.text = appdata.myInfo.addressdetail;
      phoneNumberController.text = appdata.myInfo.phone;
      postTextEditor.text = appdata.myInfo.postcode;
    });
    super.initState();
  }

  signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        setState(() {
          authOk = true;
          _isAuthsms = true;
          isotpconfirm = false;
        });
        await _auth.currentUser!.delete();
        _auth.signOut();
        return Fluttertoast.showToast(
            msg: '인증이 완료되었습니다',
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightBlue,
            fontSize: 12.0);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        print("인증실패");
        print(e.message);
      });

      toastMessage('오류가 발생했습니다. 인증번호를 확인해주세요.');
    }
  }

  Future<UserCredential?> UpdateUserCredential() async {
    User? user = _auth.currentUser;
    try {
      await DatabaseService(uid: user!.uid).updateUserData(
        nameController.text,
        gender,
        password,
        phoneNumberController.text,
        address,
        deaddressTextEditor.text,
        postcode,
      );
    } catch (e) {
      errorToast(e);
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

  void _timerStart() {
    _time = 120;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _time--;
        if (_time <= 0) {
          _time = 0;
        }
      });
    });
  }

  String _viewTime(int time) {
    final minutes = ((time / 60) % 60).floor().toString();
    final seconds = (time % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
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
                                controller: postTextEditor,
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
                                          addressTextEditor.text = address;
                                          postTextEditor.text = postcode;
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
                                controller: addressTextEditor,
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
                                controller: deaddressTextEditor,
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
                      Container(
                        width: 90,
                        height: 30,
                        child: TextButton(
                          child: Text(
                            "인증번호 보내기",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          onPressed: _isAuthsms
                              ? null
                              : () async {
                                  FocusScope.of(context).unfocus();
                                  Fluttertoast.showToast(
                                      msg:
                                          "${phoneNumberController.text}로 인증코드를 발송하였습니다 잠시만 기다려주세요",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.lightBlue,
                                      fontSize: 12.0);
                                  await _auth.verifyPhoneNumber(
                                      timeout: const Duration(seconds: 120),
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {
                                        setState(() {
                                          _isAuthsms = false;
                                          isotpconfirm = false;
                                          _timer?.cancel();
                                        });
                                        toastMessage(
                                            "인증번호가 만료되었습니다. 다시 시도해 주세요.");
                                      },
                                      phoneNumber: "+8210" +
                                          phoneNumberController.text
                                              .substring(3)
                                              .trim(),
                                      verificationCompleted:
                                          (phoneAuthCredential) async {},
                                      verificationFailed:
                                          (verificationFailed) async {
                                        print(verificationFailed.code);
                                        toastMessage(
                                            "코드 발송 실패했습니다. 전화번호를 확인해주세요");
                                        print("코드 발송 실패");
                                      },
                                      codeSent: (verificationId,
                                          forceResendingToken) async {
                                        print('코드 보냄');

                                        setState(() {
                                          _isAuthsms = true;
                                          isotpconfirm = true;
                                          _timerStart();

                                          this.verificationId = verificationId;
                                        });
                                      });
                                  otpFocusNode.requestFocus();
                                },
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xff3AAFFC),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isotpconfirm,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 170,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: otpController,
                                focusNode: otpFocusNode,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 0.5)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 0.5)),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Text(_viewTime(_time),
                                  style: TextStyle(
                                    color: Color(0xff3AAFFC),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 60,
                              height: 30,
                              child: TextButton(
                                child: Text(
                                  "확인",
                                  style: TextStyle(fontSize: 10),
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  PhoneAuthCredential phoneAuthCredential =
                                      PhoneAuthProvider.credential(
                                          verificationId: verificationId,
                                          smsCode: otpController.text);

                                  signInWithPhoneAuthCredential(
                                      phoneAuthCredential);
                                },
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Color(0xff3AAFFC),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                          ],
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
                          Fluttertoast.showToast(
                              msg: "성별을 선택해주세요.",
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.lightBlue,
                              fontSize: 12.0);
                        } else {
                          if (passwordController.text !=
                              verifyPasswordController.text) {
                            Fluttertoast.showToast(
                                msg: "비밀번호가 일치하지 않습니다. 다시 확인해주세요.",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.lightBlue,
                                fontSize: 12.0);
                          } else {
                            if (vaildationpassword(passwordController.text) ==
                                null) {
                              if (addressTextEditor.text == '') {
                                Fluttertoast.showToast(
                                    msg: "주소를 입력해주세요.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.lightBlue,
                                    fontSize: 12.0);
                              } else {
                                if (deaddressTextEditor.text == '') {
                                  Fluttertoast.showToast(
                                      msg: "상세주소를 입력해주세요.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.lightBlue,
                                      fontSize: 12.0);
                                } else {
                                  if (authOk == false) {
                                    Fluttertoast.showToast(
                                        msg: "핸드폰 인증을 완료해주세요.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.lightBlue,
                                        fontSize: 12.0);
                                  } else {
                                    UpdateUserCredential();
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

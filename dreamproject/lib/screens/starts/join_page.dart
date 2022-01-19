import 'package:dreamproject/controller/database_controller.dart';
import 'package:dreamproject/repo/auth_service.dart';
import 'package:dreamproject/repo/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dreamproject/repo/join_validation.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'dart:async';

import 'login_page.dart';

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
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

  final passwordFocusNode = FocusNode();
  final verifyPasswordFocusNode = FocusNode();
  final otpFocusNode = FocusNode();
  final deaddressFocusNode = FocusNode();

  bool authOk = false;
  bool duplicateEmail = false;
  bool passwordHide = true;

  late String verificationId;

  DatabaseController databaseController = DatabaseController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authJoin = AuthService();

  final _postTextEditor = TextEditingController();
  final _addressTextEditor = TextEditingController();
  final _deaddressTextEditor = TextEditingController();
  final phoneNumber = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        setState(() {
          authOk = true;
          _isAuthsms = false;
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

      await Fluttertoast.showToast(
          msg: '오류가 발생했습니다. 인증번호를 확인해주세요.',
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          fontSize: 12.0);
    }
  }

  Future<UserCredential?> signUpUserCredential(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateUserData(
          email,
          nameController.text,
          gender,
          phoneNumber.text,
          [],
          [],
          [3],
          address + ' ' + _deaddressTextEditor.text,
          postcode,
          '0',
          '0',
          '0');
    } catch (e) {
      void errorToast(e) {
        Fluttertoast.showToast(
            msg: e.message,
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            fontSize: 12.0);
      }

      switch (e) {
        default:
          errorToast(e);
      }
      return null;
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
                SizedBox(height: 30.0),
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
                        child: Icon(Icons.person, color: Color(0xff3AAFFC)),
                      ),
                      Container(
                        width: 60,
                        child: Text("Email",
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
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(passwordFocusNode),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 30,
                        child: TextButton(
                          child: Text(
                            "확인",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          onPressed: () async {
                            if (vaildationemail(emailController.text) == null) {
                              if (await databaseController.isDuplicatedEmail(
                                      emailController.text) ==
                                  true) {
                                Fluttertoast.showToast(
                                    msg: '중복된 이메일입니다. 다시 한번 확인해주세요.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.lightBlue,
                                    fontSize: 12.0);
                              } else {
                                duplicateEmail = true;
                                Fluttertoast.showToast(
                                    msg: '사용가능한 이메일입니다',
                                    toastLength: Toast.LENGTH_SHORT,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.lightBlue,
                                    fontSize: 12.0);
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color(0xff3AAFFC),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
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
                        width: 200,
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
                                controller: _postTextEditor,
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
                                          _addressTextEditor.text = address;
                                          _postTextEditor.text = postcode;
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
                                controller: _addressTextEditor,
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
                                controller: _deaddressTextEditor,
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
                            controller: phoneNumber,
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
                                  Fluttertoast.showToast(
                                      msg:
                                          "${phoneNumber.text}로 인증코드를 발송하였습니다 잠시만 기다려주세요",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.lightBlue,
                                      fontSize: 12.0);
                                  await _auth.verifyPhoneNumber(
                                      timeout: const Duration(seconds: 120),
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {},
                                      phoneNumber: "+8210" +
                                          phoneNumber.text.substring(3).trim(),
                                      verificationCompleted:
                                          (phoneAuthCredential) async {},
                                      verificationFailed:
                                          (verificationFailed) async {
                                        print(verificationFailed.code);
                                        Fluttertoast.showToast(
                                            msg: "코드 발송 실패했습니다. 전화번호를 확인해주세요",
                                            toastLength: Toast.LENGTH_SHORT,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.lightBlue,
                                            fontSize: 12.0);
                                        print("코드 발송 실패");
                                      },
                                      codeSent: (verificationId,
                                          forceResendingToken) async {
                                        print('코드 보냄');

                                        setState(() {
                                          _isAuthsms = true;
                                          _timerStart();

                                          FocusScope.of(context)
                                              .requestFocus(otpFocusNode);

                                          this.verificationId = verificationId;
                                        });
                                      });
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
                  visible: _isAuthsms,
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
                      if (duplicateEmail == false) {
                        Fluttertoast.showToast(
                            msg: '이메일 인증을 완료해 주세요.',
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightBlue,
                            fontSize: 12.0);
                      } else {
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
                                if (_addressTextEditor.text == '') {
                                  Fluttertoast.showToast(
                                      msg: "주소를 입력해주세요.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.lightBlue,
                                      fontSize: 12.0);
                                } else {
                                  if (_deaddressTextEditor.text == '') {
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
                                      signUpUserCredential(
                                          email: emailController.text,
                                          password: passwordController.text);
                                      Get.offAll(LoginPage());
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    child: Text(
                      "가입하기",
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
                      Get.to(LoginPage());
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

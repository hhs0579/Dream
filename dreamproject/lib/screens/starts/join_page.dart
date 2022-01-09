// import 'package:firebase_auth/firebase_auth.dart';
// z
import 'package:dreamproject/repo/auth_service.dart';
import 'package:dreamproject/repo/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'dart:async';

import 'login_page.dart';

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final _formKey = GlobalKey<FormState>();

  Color _maleButtonColor = Colors.white;
  Color _femaleButtonColor = Colors.white;
  Color _maleTextColor = Colors.blue;
  Color _femaleTextColor = Colors.blue;
  bool _maleswitchState = false;
  bool _femaleswitchState = false;
  bool _isAuthsms = false;

  Timer? _timer;
  var _time = 0;

  String? id;
  String? name;
  String email = '';
  String password = '';
  String? gender;
  String? address;
  String? postCode;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();
  TextEditingController phoneNumberController1 = TextEditingController();
  TextEditingController phoneNumberController2 = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode verifyPasswordFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode1 = FocusNode();
  FocusNode phoneNumberFocusNode2 = FocusNode();
  FocusNode otpFocusNode = FocusNode();

  bool authOk = false;

  bool passwordHide = true;
  bool requestedAuth = false;
  late String verificationId;
  bool showLoading = true;

  FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authJoin = AuthService();

  final _idTextEditor = TextEditingController();
  final _passwordTextEditor = TextEditingController();
  final _postTextEditor = TextEditingController();
  final _addressTextEditor = TextEditingController();
  final phoneNumber = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        setState(() {
          print("인증완료 및 로그인성공");
          authOk = true;
          requestedAuth = false;
        });
        await _auth.currentUser!.delete();
        print("auth정보삭제");
        _auth.signOut();
        print("phone로그인된것 로그아웃");
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        print("인증실패..로그인실패");
      });

      await Fluttertoast.showToast(
          msg: (e.code),
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          fontSize: 16.0);
    }
  }

  Future<UserCredential?> signUpUserCredential(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateUserData(
          '$address', '$email', '$password', '$phoneNumber', '$name');
    } catch (e) {
      void errorToast(String message) {
        Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            fontSize: 16.0);
      }

      switch (e) {
        case "email-already-in-use":
          errorToast("이미 사용중인 이메일입니다");

          break;
        case "invalid-email":
          errorToast("잘못된 이메일 형식입니다");
          break;
        case "operation-not-allowed":
          errorToast("사용할 수 없는 방식입니다");

          break;
        case "weak-password":
          errorToast("비밀번호 보안 수준이 너무 낮습니다");

          break;
        default:
          errorToast("알수없는 오류가 발생했습니다");
      }
      return null;
    }
  }

  void setMaleStateOn() {
    _maleButtonColor = Colors.blue;
    _maleTextColor = Colors.white;
    _maleswitchState = true;
  }

  void setMaleStateOff() {
    _maleButtonColor = Colors.white;
    _maleTextColor = Colors.blue;
    _maleswitchState = false;
  }

  void setFemaleStateOn() {
    _femaleButtonColor = Color(0xff3AAFFC);
    _femaleTextColor = Colors.white;
    _femaleswitchState = true;
  }

  void setFemaleStateOff() {
    _femaleButtonColor = Colors.white;
    _femaleTextColor = Color(0xff3AAFFC);
    _femaleswitchState = false;
  }

  genderButton(
      String gender, Color primaryColor, Color textColor, dynamic onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(side: BorderSide(color: Color(0xff3AAFFC))),
        primary: primaryColor,
        minimumSize: Size(60, 50),
      ),
      child: Text(
        gender,
        style: TextStyle(color: textColor),
      ),
    );
  }

  IdTextformfield({
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
    required TextEditingController controller,
  }) {
    assert(onSaved != null);
    assert(validator != null);

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: TextFormField(
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            errorStyle: TextStyle(color: Colors.blue),
          ),
          textInputAction: TextInputAction.next,
          onEditingComplete: () =>
              FocusScope.of(context).requestFocus(passwordFocusNode),
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
      ),
    );
  }

  Textformfield({
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
  }) {
    assert(onSaved != null);
    assert(validator != null);

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: TextFormField(
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            errorStyle: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  passwordTextformfield({
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
    required TextEditingController controller,
  }) {
    assert(onSaved != null);
    assert(validator != null);

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: TextFormField(
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            errorStyle: TextStyle(color: Colors.blue),
          ),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          focusNode: verifyPasswordFocusNode,
          obscureText: passwordHide,
          controller: verifyPasswordController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
    return Form(
      key: _formKey,
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      "회원가입",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    alignment: Alignment(0, 0),
                    height: 70,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 15),
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
                            child: TextFormField(
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                errorStyle: TextStyle(color: Colors.blue),
                              ),
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(passwordFocusNode),
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment(0, 0),
                    height: 70,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 15),
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
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Textformfield(
                            onSaved: (val) {
                              name = val;
                            },
                            validator: (val) {}),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment(0, 0),
                    height: 70,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                    padding: EdgeInsets.only(left: 20, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1.0, color: Colors.black12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(Icons.male, color: Colors.blue),
                        ),
                        Container(
                          width: 60,
                          child: Text("성별",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(
                          width: 75,
                        ),
                        Row(
                          children: [
                            genderButton("남", _maleButtonColor, _maleTextColor,
                                () {
                              if (_maleswitchState == false) {
                                if (_femaleswitchState == true) {
                                  setState(() {
                                    setMaleStateOn();
                                    setFemaleStateOff();
                                    gender = '남자';
                                  });
                                } else {
                                  setState(() {
                                    setMaleStateOn();
                                    gender = '남자';
                                  });
                                }
                              } else {
                                setState(() {
                                  setMaleStateOff();
                                  gender = '';
                                });
                              }
                              print(gender);
                            }),
                            SizedBox(width: 1),
                            genderButton(
                                "여", _femaleButtonColor, _femaleTextColor, () {
                              if (_femaleswitchState == false) {
                                if (_maleswitchState == true) {
                                  setState(() {
                                    setFemaleStateOn();
                                    setMaleStateOff();
                                    gender = '여자';
                                  });
                                } else {
                                  setState(() {
                                    setFemaleStateOn();
                                    gender = '여자';
                                  });
                                }
                              } else {
                                setState(() {
                                  setFemaleStateOff();
                                  gender = '';
                                });
                              }
                              print(gender);
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment(0, 0),
                    height: 70,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 15),
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
                          child: Icon(Icons.lock, color: Colors.blue),
                        ),
                        Container(
                          width: 60,
                          child: Text("비밀번호",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: TextFormField(
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                errorStyle: TextStyle(color: Colors.blue),
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
                    margin: EdgeInsets.only(left: 30, right: 30, top: 15),
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
                          child: Icon(Icons.lock, color: Colors.blue),
                        ),
                        Container(
                          width: 90,
                          child: Text("비밀번호 확인",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: TextFormField(
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                errorStyle: TextStyle(color: Colors.blue),
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
                    margin: EdgeInsets.only(left: 30, right: 30),
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
                              child: Icon(Icons.place, color: Colors.blue),
                            ),
                            Container(
                              width: 90,
                              child: Text("우편번호",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: TextField(
                                  controller: _postTextEditor,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  readOnly: true,
                                ),
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 35,
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
                                          setState(() {
                                            address = '${result.address}';
                                            postCode = '${result.postCode}';
                                            _addressTextEditor.text = address!;
                                            _postTextEditor.text = postCode!;
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: TextField(
                                  controller: _addressTextEditor,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
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
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: TextField(
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
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
                    margin: EdgeInsets.only(left: 30, right: 30),
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
                          child: Icon(Icons.call, color: Colors.blue),
                        ),
                        Container(
                          width: 60,
                          child: Text("핸드폰",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: TextFormField(
                              controller: phoneNumber,
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            onPressed: _isAuthsms
                                ? null
                                : () async {
                                    await _auth.verifyPhoneNumber(
                                        timeout: const Duration(seconds: 120),
                                        codeAutoRetrievalTimeout:
                                            (String verificationId) {},
                                        phoneNumber: "+8210" +
                                            phoneNumber.text.substring(3),
                                        verificationCompleted:
                                            (phoneAuthCredential) async {
                                          print('otp문자옴');
                                        },
                                        verificationFailed:
                                            (verificationFailed) async {
                                          print(verificationFailed.code);

                                          print("코드 발송 실패");
                                          print(phoneNumber.text.substring(3));
                                        },
                                        codeSent: (verificationId,
                                            forceResendingToken) async {
                                          print('코드 보냄');
                                          Fluttertoast.showToast(
                                              msg:
                                                  "${phoneNumber.text}로 인증코드를 발송하였습니다 잠시만 기다려주세요",
                                              toastLength: Toast.LENGTH_SHORT,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.lightBlue,
                                              fontSize: 12.0);
                                          setState(() {
                                            _isAuthsms = true;
                                            _timerStart();

                                            FocusScope.of(context)
                                                .requestFocus(otpFocusNode);

                                            this.verificationId =
                                                verificationId;
                                          });
                                        });
                                  },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 60, top: 10),
                    child: Visibility(
                      visible: _isAuthsms,
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            child: TextField(
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
                          Container(
                            child: Text(_viewTime(_time),
                                style: TextStyle(
                                  color: Colors.blue,
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
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 60,
                            height: 30,
                            child: TextButton(
                              child: Text(
                                "재전송",
                                style: TextStyle(fontSize: 10),
                              ),
                              onPressed: () {
                                setState(() {
                                  _time = 120;
                                });
                                () async {
                                  await _auth.verifyPhoneNumber(
                                      timeout: const Duration(seconds: 120),
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {},
                                      phoneNumber: "+8210" +
                                          phoneNumber.text.substring(3),
                                      verificationCompleted:
                                          (phoneAuthCredential) async {
                                        print('otp문자옴');
                                      },
                                      verificationFailed:
                                          (verificationFailed) async {
                                        print(verificationFailed.code);
                                        print("코드 발송 실패");
                                      },
                                      codeSent: (verificationId,
                                          forceResendingToken) async {
                                        print('코드 보냄');
                                        Fluttertoast.showToast(
                                            msg:
                                                "${phoneNumber.text}로 인증코드를 재전송하였습니다 잠시만 기다려주세요",
                                            toastLength: Toast.LENGTH_SHORT,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.lightBlue,
                                            fontSize: 12.0);
                                        setState(() {
                                          FocusScope.of(context)
                                              .requestFocus(otpFocusNode);

                                          this.verificationId = verificationId;
                                        });
                                      });
                                };
                              },
                              style: TextButton.styleFrom(
                                  primary: Colors.blue,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                        ],
                      ),
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
                        if (emailController.text.length > 1 &&
                            passwordController.text.length > 1 &&
                            verifyPasswordController.text.length > 1) {
                          if (passwordController.text ==
                              verifyPasswordController.text) {
                            if (authOk) {
                              await signUpUserCredential(
                                  email: emailController.text,
                                  password: passwordController.text);

                              setState(() {
                                Get.to(LoginPage());
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg: "휴대폰 인증을 완료해주세요.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  fontSize: 16.0);
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "비밀번호를 확인해 주세요.",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                fontSize: 16.0);
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: "이메일 및 비밀번호를 입력해 주세요.",
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              fontSize: 16.0);
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
                          color: Colors.blue,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(330, 45),
                        side: BorderSide(color: Colors.blue),
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
      ),
    );
  }
}

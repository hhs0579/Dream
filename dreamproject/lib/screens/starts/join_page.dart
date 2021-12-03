import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';

import 'login_page.dart';

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  Color _maleButtonColor = Colors.white;
  Color _femaleButtonColor = Colors.white;
  Color _maleTextColor = Colors.blue;
  Color _femaleTextColor = Colors.blue;
  bool _maleswitchState = false;
  bool _femaleswitchState = false;

  String? id;
  String? name;
  String? password;
  String? gender;
  String? address;
  String? postCode;

  final _idTextEditor = TextEditingController();
  final _passwordTextEditor = TextEditingController();
  final _postTextEditor = TextEditingController();
  final _addressTextEditor = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
    _femaleButtonColor = Colors.blue;
    _femaleTextColor = Colors.white;
    _femaleswitchState = true;
  }

  void setFemaleStateOff() {
    _femaleButtonColor = Colors.white;
    _femaleTextColor = Colors.blue;
    _femaleswitchState = false;
  }

  genderButton(
      String gender, Color primaryColor, Color textColor, dynamic onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(side: BorderSide(color: Colors.blue)),
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
          controller: controller,
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            errorStyle: TextStyle(color: Colors.blue),
          ),
          onSaved: onSaved,
          validator: validator,
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
          obscureText: true,
          onSaved: onSaved,
          validator: validator,
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
          controller: controller,
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            errorStyle: TextStyle(color: Colors.blue),
          ),
          obscureText: true,
          onSaved: onSaved,
          validator: validator,
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
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
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
                        child: Icon(Icons.person, color: Colors.blue),
                      ),
                      Container(
                        width: 60,
                        child: Text("ID",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      IdTextformfield(
                          onSaved: (val) {
                            id = val;
                          },
                          validator: (val) {},
                          controller: _idTextEditor),
                      Container(
                        width: 60,
                        height: 35,
                        child: TextButton(
                          child: Text("확인"),
                          onPressed: () {
                            setState(() {
                              _idTextEditor.text = "완료";
                            });
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
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
                        child: Icon(Icons.create_rounded, color: Colors.blue),
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
                SizedBox(height: 30),
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
                          SizedBox(width: 10),
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
                SizedBox(height: 30),
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
                      passwordTextformfield(
                          onSaved: (val) {},
                          validator: (val) {
                            if (val.length < 8 || val.length > 12) {
                              return "8~12자 비밀번호를 설정해 주세요 ";
                            }
                            if (val.isEmpty()) {
                              return "비밀번호는 필수 입력사항 입니다";
                            }
                            return null;
                          },
                          controller: _passwordTextEditor),
                    ],
                  ),
                ),
                SizedBox(height: 30),
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
                      Textformfield(
                          onSaved: (val) {},
                          validator: (val) {
                            if (val != _passwordTextEditor.text) {
                              return "비밀번호가 틀립니다. 다시 확인해 주세요.";
                            }
                            if (val.isEmpty()) {
                              return "비밀번호는 필수 입력사항 입니다";
                            }
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  alignment: Alignment(0, 0),
                  height: 170,
                  margin: EdgeInsets.only(left: 30, right: 30),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
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
                                  fontSize: 11,
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
                SizedBox(height: 10.0),
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
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ),
                      Container(
                        width: 85,
                        height: 30,
                        child: TextButton(
                          child: Text(
                            "인증번호 보내기",
                            style: TextStyle(fontSize: 10),
                          ),
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  width: 330,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Get.to(LoginPage());

                        formKey.currentState!.save();
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PossibleEmailText {
  bool isEmail;
  PossibleEmailText({
    this.isEmail = false,
  });
}

PossibleEmailText checkEmailText(String value) {
  var checkEmailText = PossibleEmailText();
  final validEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (validEmail.hasMatch(value)) {
    checkEmailText.isEmail = true;
  } else {
    checkEmailText.isEmail = false;
  }
  return checkEmailText;
}

vaildationemail(String value) {
  var vaildationemail = checkEmailText(value);

  if (value.isEmpty) {
    print(value);
    return Fluttertoast.showToast(
        msg: "이메일을 작성해주세요",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlue,
        fontSize: 12.0);
  } else {
    if (vaildationemail.isEmail == false) {
      return Fluttertoast.showToast(
          msg: "잘못된 이메일 형식입니다.",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightBlue,
          fontSize: 12.0);
    } else {
      return null;
    }
  }
}

class PossibleNameText {
  bool is8Characters;
  bool is1Symbol;
  bool is1Letter;
  bool is1Number;
  PossibleNameText(
      {this.is8Characters = false,
      this.is1Symbol = false,
      this.is1Letter = false,
      this.is1Number = false});
  bool get isCorrectWord =>
      (is8Characters && is1Symbol && is1Letter && is1Number);
}

PossibleNameText checkNameText(String value) {
  var possibleNameText = PossibleNameText();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'^[a-zA-Z0-9 ]+$');

  if (value.isEmpty) {
    // 문자가 비었다면 모드 false로 리턴
    return PossibleNameText();
  }

  //8자 이상인지 확인
  if (value.length >= 2 || value.length <= 5) {
    possibleNameText.is8Characters = true;
  } else {
    possibleNameText.is8Characters = false;
  }

  //특수기호가 있는지 확인
  if (!validSpecial.hasMatch(value)) {
    possibleNameText.is1Symbol = true;
  } else {
    possibleNameText.is1Symbol = false;
  }

  //문자가 있는지 확인
  if (!validAlphabet.hasMatch(value)) {
    possibleNameText.is1Letter = true;
  } else {
    possibleNameText.is1Letter = false;
  }

  //숫자가 있는지 확인
  if (!validNumbers.hasMatch(value)) {
    possibleNameText.is1Number = true;
  } else {
    possibleNameText.is1Number = false;
  }
  return possibleNameText;
}

vaildationname(String value) {
  var vaildationname = checkNameText(value);

  if (value.isEmpty) {
    return Fluttertoast.showToast(
        msg: "이름을 작성해주세요",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlue,
        fontSize: 12.0);
  } else {
    if (vaildationname.isCorrectWord == false) {
      return Fluttertoast.showToast(
          msg: "실명을 입력해주세요.",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightBlue,
          fontSize: 12.0);
    } else {
      return null;
    }
  }
}

class PossiblePasswordText {
  bool is8Characters;
  bool is1Symbol;
  bool is1Letter;
  bool is1Number;
  PossiblePasswordText(
      {this.is8Characters = false,
      this.is1Symbol = false,
      this.is1Letter = false,
      this.is1Number = false});
  bool get isCorrectWord =>
      (is8Characters && is1Symbol && is1Letter && is1Number);
}

PossiblePasswordText checkPasswordText(String value) {
  var possiblePasswordText = PossiblePasswordText();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'^[a-zA-Z0-9 ]+$');

  if (value.isEmpty) {
    // 문자가 비었다면 모드 false로 리턴
    return PossiblePasswordText();
  }

  //8자 이상인지 확인
  if (value.length >= 8 || value.length <= 12) {
    possiblePasswordText.is8Characters = true;
  } else {
    possiblePasswordText.is8Characters = false;
  }

  //특수기호가 있는지 확인
  if (validSpecial.hasMatch(value)) {
    possiblePasswordText.is1Symbol = true;
  } else {
    possiblePasswordText.is1Symbol = false;
  }

  //문자가 있는지 확인
  if (validAlphabet.hasMatch(value)) {
    possiblePasswordText.is1Letter = false;
  } else {
    possiblePasswordText.is1Letter = true;
  }

  //숫자가 있는지 확인
  if (validNumbers.hasMatch(value)) {
    possiblePasswordText.is1Number = true;
  } else {
    possiblePasswordText.is1Number = false;
  }
  return possiblePasswordText;
}

vaildationpassword(String value) {
  var vaildationpassword = checkPasswordText(value);

  if (value.isEmpty) {
    return Fluttertoast.showToast(
        msg: "비밀번호를 작성해주세요",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightBlue,
        fontSize: 12.0);
  } else {
    if (vaildationpassword.isCorrectWord == false) {
      if (vaildationpassword.is8Characters == false) {
        return Fluttertoast.showToast(
            msg: "8~12자리 비밀번호를 설정해주세요.",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightBlue,
            fontSize: 12.0);
      } else if (vaildationpassword.is1Symbol == false &&
          vaildationpassword.is1Number == false &&
          vaildationpassword.is1Letter == false) {
        return Fluttertoast.showToast(
            msg: "비밀번호에 문자, 숫자, 특수기호는 필수입니다.",
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightBlue,
            fontSize: 12.0);
      }
    } else {
      return null;
    }
  }
}

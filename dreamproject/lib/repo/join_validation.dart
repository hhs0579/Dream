import 'package:fluttertoast/fluttertoast.dart';

class CorrectWordParameter {
  bool isCharacters;
  bool is1Symbol;
  bool is1Letter;
  bool is1Number;
  CorrectWordParameter(
      {this.isCharacters = false,
      this.is1Symbol = false,
      this.is1Letter = false,
      this.is1Number = false});
  bool get isCorrectWord =>
      (isCharacters && is1Symbol && is1Letter && is1Number);
}

CorrectWordParameter checkPossibleEmailText(String value) {
  var correctWordParameter = CorrectWordParameter();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'^[a-zA-Z0-9 ]+$');

  if (value.isEmpty) {
    // 문자가 비었다면 모드 false로 리턴
    return CorrectWordParameter();
  }

  //8자 이상인지 확인
  if (value.length >= 8 || value.length <= 12) {
    correctWordParameter.isCharacters = true;
  } else {
    correctWordParameter.isCharacters = false;
  }

  //특수기호가 있는지 확인
  if (!validSpecial.hasMatch(value)) {
    correctWordParameter.is1Symbol = true;
  } else {
    correctWordParameter.is1Symbol = false;
  }

  //문자가 있는지 확인
  if (!validAlphabet.hasMatch(value)) {
    correctWordParameter.is1Letter = false;
  } else {
    correctWordParameter.is1Letter = true;
  }

  //숫자가 있는지 확인
  if (validNumbers.hasMatch(value)) {
    correctWordParameter.is1Number = true;
  } else {
    correctWordParameter.is1Number = false;
  }
  return correctWordParameter;
}

CorrectWordParameter checkPossibleNameText(String value) {
  var correctWordParameter = CorrectWordParameter();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'^[a-zA-Z0-9 ]+$');

  if (value.isEmpty) {
    // 문자가 비었다면 모드 false로 리턴
    return CorrectWordParameter();
  }

  //8자 이상인지 확인
  if (value.length >= 8 || value.length <= 12) {
    correctWordParameter.isCharacters = true;
  } else {
    correctWordParameter.isCharacters = false;
  }

  //특수기호가 있는지 확인
  if (!validSpecial.hasMatch(value)) {
    correctWordParameter.is1Symbol = true;
  } else {
    correctWordParameter.is1Symbol = false;
  }

  //문자가 있는지 확인
  if (!validAlphabet.hasMatch(value)) {
    correctWordParameter.is1Letter = false;
  } else {
    correctWordParameter.is1Letter = true;
  }

  //숫자가 있는지 확인
  if (validNumbers.hasMatch(value)) {
    correctWordParameter.is1Number = true;
  } else {
    correctWordParameter.is1Number = false;
  }
  return correctWordParameter;
}

CorrectWordParameter checkPossiblePasswordText(String value) {
  var correctWordParameter = CorrectWordParameter();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'^[a-zA-Z0-9 ]+$');

  if (value.isEmpty) {
    // 문자가 비었다면 모드 false로 리턴
    return CorrectWordParameter();
  }

  //8자 이상인지 확인
  if (value.length >= 8 || value.length <= 12) {
    correctWordParameter.isCharacters = true;
  } else {
    correctWordParameter.isCharacters = false;
  }

  //특수기호가 있는지 확인
  if (!validSpecial.hasMatch(value)) {
    correctWordParameter.is1Symbol = true;
  } else {
    correctWordParameter.is1Symbol = false;
  }

  //문자가 있는지 확인
  if (!validAlphabet.hasMatch(value)) {
    correctWordParameter.is1Letter = false;
  } else {
    correctWordParameter.is1Letter = true;
  }

  //숫자가 있는지 확인
  if (validNumbers.hasMatch(value)) {
    correctWordParameter.is1Number = true;
  } else {
    correctWordParameter.is1Number = false;
  }
  return correctWordParameter;
}

CorrectWordParameter checkPossibleAdressText(String value) {
  var correctWordParameter = CorrectWordParameter();
  final validNumbers = RegExp(r'(\d+)');
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final validSpecial = RegExp(r'^[a-zA-Z0-9 ]+$');

  if (value.isEmpty) {
    // 문자가 비었다면 모드 false로 리턴
    return CorrectWordParameter();
  }

  //8자 이상인지 확인
  if (value.length >= 8 || value.length <= 12) {
    correctWordParameter.isCharacters = true;
  } else {
    correctWordParameter.isCharacters = false;
  }

  //특수기호가 있는지 확인
  if (!validSpecial.hasMatch(value)) {
    correctWordParameter.is1Symbol = true;
  } else {
    correctWordParameter.is1Symbol = false;
  }

  return correctWordParameter;
}

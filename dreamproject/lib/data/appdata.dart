import 'package:dreamproject/model/myinfo.dart';
import 'package:get/get.dart';

class AppData extends GetxController {
  int _myVersion = 0;
  int _latestVersion = 0;
  int _currentScreenIndex = 0;

  bool _isLoadingScreen = false;
  String _userEmail = '';
  // bool _isExpertMode = false;
  MyInfo _myInfo = MyInfo(
    date: DateTime.now(),
    email: '',
    image: '',
    name: '',
    nickname: '',
    phone: '',
    point: 0,
    userType: 'user',
    questionCount: 0,
    pushToken: '',
  );
  List<String> adsImage = [];
  List<String> adsLink = [];

  var accessToken;

  int get currentScreenIndex => _currentScreenIndex;

  set currentScreenIndex(int currentScreenIndex) {
    _currentScreenIndex = currentScreenIndex;
    update();
  }

  int get myVersion => _myVersion;

  set myVersion(int version) {
    _myVersion = version;
    update();
  }

  int get latestVersion => _latestVersion;

  set latestVersion(int latestVersion) {
    _latestVersion = latestVersion;
    update();
  }

  MyInfo get myInfo => _myInfo;

  set myInfo(MyInfo myInfo) {
    _myInfo = myInfo;
    update();
  }
}

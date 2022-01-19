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
    email: '',
    image: '',
    gender: '',
    name: '',
    phone: '',
    myposts: [],
    myempathyposts: [],
    myclubs: [],
    point: 0,
    totaldonatepoint: 0,
    totaldonatenumber: 0,
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

  // bool get isExpertMode => _isExpertMode;
  //
  // set isExpertMode(bool isExpertMode) {
  //   _isExpertMode = isExpertMode;
  //   update();
  // }

  String get userEmail => _userEmail;

  set userEmail(String userEmail) {
    _userEmail = userEmail;
    update();
  }

  bool get isLoadingScreen => _isLoadingScreen;

  set isLoadingScreen(bool isLoadingScreen) {
    _isLoadingScreen = isLoadingScreen;
    update();
  }
}

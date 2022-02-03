import 'package:dreamproject/model/myinfo.dart';
import 'package:dreamproject/model/postitem.dart';
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
    gender: '',
    password: '',
    name: '',
    phone: '',
    address: '',
    addressdetail: '',
    postcode: '',
    myposts: [],
    myempathyposts: [],
    myclubs: [],
    point: 0,
    totaldonatepoint: 0,
    totaldonatenumber: 0,
    pushToken: '',
    uid: '',
  );
  PostItem _postItem = PostItem(
      date: '',
      commentList: [],
      future: '',
      image: '',
      key: '',
      name: '',
      now: '',
      post: '',
      postcode: '',
      profile: '',
      select: [],
      uid: '');

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

  PostItem get postItem => _postItem;

  set postItem(PostItem postItem) {
    _postItem = postItem;
    update();
  }

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

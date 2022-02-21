import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/model/comment_item.dart';
import 'package:dreamproject/model/empathy_item.dart';
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
    mydonations: [],
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
    image: [],
    key: '',
    name: '',
    now: '',
    post: '',
    postcode: '',
    profile: '',
    select: [],
    uid: '',
    commentNum: 0,
    likeNum: 0,
    like: [],
    dateutc: DateTime.now(),
  );

  CommentItem _commentItem = CommentItem(
      comment: '',
      date: '',
      name: '',
      key: '',
      profile: '',
      select: [],
      commentsList: []);

  EmpathyItem _empathyItem = EmpathyItem(
      like: [],
      dateutc: DateTime.now(),
      name: '',
      postkey: '',
      profile: '',
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

  CommentItem get commentItem => _commentItem;

  set commentItem(CommentItem commentItem) {
    _commentItem = commentItem;
    update();
  }

  EmpathyItem get empathyItem => _empathyItem;

  set empathyItem(EmpathyItem empathyItem) {
    _empathyItem = empathyItem;
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

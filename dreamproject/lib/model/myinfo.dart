MyInfo? myInfo;

class MyInfo {
  DateTime date;
  String email;
  String image;
  String name;
  String gender;
  String password;
  String phone;
  String address;
  String addressdetail;
  String postcode;
  List<dynamic> myposts;
  List<dynamic> myempathyposts;
  List<dynamic> myclubs;
  List<dynamic> mydonations;
  int point;
  int totaldonatepoint;
  int totaldonatenumber;
  String pushToken;
  String uid;

  MyInfo(
      {required this.date,
      required this.email,
      required this.image,
      required this.gender,
      required this.password,
      required this.name,
      required this.phone,
      required this.address,
      required this.addressdetail,
      required this.postcode,
      required this.myposts,
      required this.myempathyposts,
      required this.myclubs,
      required this.mydonations,
      required this.point,
      required this.totaldonatepoint,
      required this.totaldonatenumber,
      required this.pushToken,
      required this.uid});

  MyInfo.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        email = json['email'],
        image = json['image'],
        gender = json['gender'],
        password = json['password'],
        name = json['name'],
        phone = json['phone'],
        address = json['address'],
        addressdetail = json['addressdetail'],
        postcode = json['postcode'],
        myposts = json['myposts'],
        myempathyposts = json['myempathyposts'],
        myclubs = json['myclubs'],
        mydonations = json['mydonations'],
        point = json['point'] ?? 0,
        totaldonatepoint = json['totaldonatepoint'] ?? 0,
        totaldonatenumber = json['totaldonaenumber'] ?? 0,
        pushToken = json['pushToken'] ?? '',
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'email': email,
        'image': image,
        'gender': gender,
        'password': password,
        'name': name,
        'phone': phone,
        'adrress': address,
        'addressdetail': addressdetail,
        'postcode': postcode,
        'myposts': myposts,
        'myempathyposts': myempathyposts,
        'myclubs': myclubs,
        'mydonations': mydonations,
        'point': point,
        'totaldonatepoint': totaldonatepoint,
        'totaldonatenumber': totaldonatenumber,
        'pushToken': pushToken,
        'uid': uid
      };
}

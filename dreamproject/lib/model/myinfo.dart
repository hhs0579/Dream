MyInfo? myInfo;

class MyInfo {
  static List<String> userTypes = [
    'user',
    'expert',
    'admin',
  ];

  DateTime date;
  String email;
  String image;
  String name;
  String nickname;
  String phone;
  int point;
  String userType; // user, expert, normal-admin, super-admin
  int questionCount;
  String pushToken;

  MyInfo({
    required this.date,
    required this.email,
    required this.image,
    required this.name,
    required this.nickname,
    required this.phone,
    required this.point,
    required this.userType,
    required this.questionCount,
    required this.pushToken,
  });

  MyInfo.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        email = json['email'],
        image = json['image'],
        name = json['name'],
        nickname = json['nickname'],
        phone = json['phone'],
        pushToken = json['pushToken'] ?? '',
        point = json['point'] ?? 0,
        userType = json['userType'] ?? 'user',
        questionCount = json['questionCount'] ?? 0;

  Map<String, dynamic> toJson() => {
        'date': date,
        'email': email,
        'image': image,
        'name': name,
        'nickname': nickname,
        'phone': phone,
        'point': point,
        'userType': userType,
        'questionCount': questionCount,
        'pushToken': pushToken,
      };

  get isUser => userType == 'user';
  get isExpert => userType == 'expert';
  get isAdmin => (userType == 'normal-admin' || userType == 'super-admin');
  get isNormalAdmin => userType == 'normal-admin';
  get isSuperAdmin => userType == 'super-admin';
}

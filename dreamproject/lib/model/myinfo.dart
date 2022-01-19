MyInfo? myInfo;

class MyInfo {
  String email;
  String image;
  String name;
  String gender;
  String phone;
  List<dynamic> myposts;
  List<dynamic> myempathyposts;
  List<dynamic> myclubs;
  int point;
  int totaldonatepoint;
  int totaldonatenumber;

  MyInfo({
    required this.email,
    required this.image,
    required this.gender,
    required this.name,
    required this.phone,
    required this.myposts,
    required this.myempathyposts,
    required this.myclubs,
    required this.point,
    required this.totaldonatepoint,
    required this.totaldonatenumber,
  });

  MyInfo.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        image = json['image'],
        gender = json['gender'],
        name = json['name'],
        phone = json['phone'],
        point = json['point'] ?? 0;

  Map<String, dynamic> toJson() => {
        'email': email,
        'image': image,
        'gender': gender,
        'name': name,
        'phone': phone,
        'point': point,
      };
}

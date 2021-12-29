import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class UserModel {
  late String userKey;
  late String id;
  late String password;
  late String name;
  late String sex;
  late String phoneNumber;
  late String address;
  late num lat;
  late num log;
  late GeoFirePoint geoFirePoint;
  late DateTime createDate;
  DocumentReference? refernce;
  UserModel(
      {required this.userKey,
      required this.id,
      required this.password,
      required this.name,
      required this.sex,
      required this.phoneNumber,
      required this.address,
      required this.lat,
      required this.log,
      required this.geoFirePoint,
      required this.createDate,
      this.refernce});

  UserModel.fromJson(Map<String, dynamic> json, this.userKey, this.refernce) {
    userKey = json['userKey'];
    phoneNumber = json['phoneNumber'];
    id = json['id'];
    password = json['password'];
    name = json['name'];
    sex = json['sex'];
    address = json['address'];
    lat = json['lat'];
    log = json['log'];
    geoFirePoint = GeoFirePoint((json['geoFirePoint']['geopoint']).latitude,
        (json['geoFirePoint']['geopoint']).logitude);
    createDate = json['createDate'] == null
        ? DateTime.now().toUtc()
        : (json['createDate'] as Timestamp).toDate();
    refernce = json['refernce'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['password'] = password;
    map['name'] = name;
    map['sex'] = sex;
    map['phoneNumber'] = phoneNumber;
    map['address'] = address;
    map['lat'] = lat;
    map['log'] = log;
    map['geoFirePoint'] = geoFirePoint;
    map['createDate'] = createDate;

    return map;
  }
}

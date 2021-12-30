/// userKey : "userKey"
/// phoneNumber : "phoneNumber"
/// address : "address"
/// lat : 123
/// log : 123
/// geoFirePoint : "geoFirePoint"
/// createDate : "createdData"
/// refernce : "refernce"

class UserModelTemp {
  UserModelTemp({
    this.userKey,
    this.phoneNumber,
    this.address,
    this.createDate,
    this.refernce,
  });

  UserModelTemp.fromJson(dynamic json) {
    userKey = json['userKey'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    createDate = json['createDate'];
    refernce = json['refernce'];
  }
  String? userKey;
  String? phoneNumber;
  String? address;
  String? createDate;
  String? refernce;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userKey'] = userKey;
    map['phoneNumber'] = phoneNumber;
    map['address'] = address;
    map['createDate'] = createDate;
    map['refernce'] = refernce;
    return map;
  }
}

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
      this.lat, 
      this.log, 
      this.geoFirePoint, 
      this.createDate, 
      this.refernce,});

  UserModelTemp.fromJson(dynamic json) {
    userKey = json['userKey'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    lat = json['lat'];
    log = json['log'];
    geoFirePoint = json['geoFirePoint'];
    createDate = json['createDate'];
    refernce = json['refernce'];
  }
  String? userKey;
  String? phoneNumber;
  String? address;
  int? lat;
  int? log;
  String? geoFirePoint;
  String? createDate;
  String? refernce;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userKey'] = userKey;
    map['phoneNumber'] = phoneNumber;
    map['address'] = address;
    map['lat'] = lat;
    map['log'] = log;
    map['geoFirePoint'] = geoFirePoint;
    map['createDate'] = createDate;
    map['refernce'] = refernce;
    return map;
  }

}
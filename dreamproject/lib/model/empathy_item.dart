EmpathyItem? empathyItem;

class EmpathyItem {
  String name;
  String profile;
  String postkey;
  String uid;
  List<dynamic> like;
  DateTime dateutc;

  EmpathyItem(
      {required this.profile,
      required this.name,
      required this.postkey,
      required this.uid,
      required this.like,
      required this.dateutc});

  EmpathyItem.fromJson(Map<String, dynamic> json)
      : profile = json['profile'],
        name = json['name'],
        postkey = json['postcode'],
        uid = json['uid'],
        like = json['like'] ?? [],
        dateutc = json['dateutc'].toDate();
  Map<String, dynamic> toJson() => {
        'profile': profile,
        'name': name,
        'postcode': postkey,
        'uid': uid,
        'like': like,
        'dateutc': dateutc
      };
}

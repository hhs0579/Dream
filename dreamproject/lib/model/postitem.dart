PostItem? postItem;

class PostItem {
  String date;
  String key;
  String post;
  String image;
  String now;
  String future;
  String name;
  String profile;
  String postcode;
  List<dynamic> commentList;
  List<dynamic> select;
  String uid;

  PostItem(
      {required this.date,
      required this.key,
      required this.post,
      required this.now,
      required this.future,
      required this.profile,
      required this.commentList,
      required this.select,
      required this.image,
      required this.name,
      required this.postcode,
      required this.uid});

  PostItem.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        key = json['key'],
        post = json['post'],
        now = json['now'],
        future = json['future'],
        profile = json['profile'],
        commentList = json['commentList'],
        select = json['select'],
        image = json['image'],
        name = json['name'],
        postcode = json['postcode'],
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'key': key,
        'post': post,
        'now': now,
        'future': future,
        'profile': profile,
        'commentList': commentList,
        'select': select,
        'image': image,
        'name': name,
        'postcode': postcode,
        'uid': uid
      };
}

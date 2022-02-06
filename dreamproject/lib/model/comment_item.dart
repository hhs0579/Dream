CommentItem? commentItem;

class CommentItem {
  String comment;
  String key;
  String date;
  List<dynamic> select;
  String name;
  String profile;
  List<dynamic> commentsList;

  CommentItem(
      {required this.comment,
      required this.key,
      required this.date,
      required this.select,
      required this.name,
      required this.profile,
      required this.commentsList});
  CommentItem.fromJson(Map<String, dynamic> json)
      : comment = json["comment"],
        key = json["key"],
        date = json["date"],
        select = json["select"],
        name = json["name"],
        profile = json["profile"],
        commentsList = json["commentsList"] ?? [];

  Map<String, dynamic> toJson() => {
        'comment': comment,
        'key': key,
        'date': date,
        'select': select,
        'name': name,
        'profile': profile,
        'commentList': commentsList
      };
}

import 'package:json_annotation/json_annotation.dart';

part 'clubitem.g.dart';

@JsonSerializable()
class ClubList {
  List<ClubItem>? list;
  ClubList({
    required this.list,
  });

  factory ClubList.fromJson(Map<String, dynamic> json) =>
      _$ClubListFromJson(json);
  Map<String, dynamic> toJson() => _$ClubListToJson(this);
}

@JsonSerializable()
class ClubItem {
  String? money;
  String? image;
  String? clubname;
  String? member;

  ClubItem(
      {required this.image,
      required this.money,
      required this.clubname,
      required this.member});

  factory ClubItem.fromJson(Map<String, dynamic> json) =>
      _$ClubItemFromJson(json);

  Map<String, dynamic> toJson() => _$ClubItemToJson(this);
}

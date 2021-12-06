import 'package:json_annotation/json_annotation.dart';

part 'withitem.g.dart';

@JsonSerializable()
class WithList {
  List<WithItem>? list;
  WithList({
    required this.list,
  });

  factory WithList.fromJson(Map<String, dynamic> json) =>
      _$WithListFromJson(json);
  Map<String, dynamic> toJson() => _$WithListToJson(this);
}

@JsonSerializable()
class WithItem {
  String? money;
  String? image;
  String? name;
  String? areaname;

  WithItem({
    required this.image,
    required this.name,
    required this.money,
    required this.areaname,
  });

  factory WithItem.fromJson(Map<String, dynamic> json) =>
      _$WithItemFromJson(json);

  Map<String, dynamic> toJson() => _$WithItemToJson(this);
}

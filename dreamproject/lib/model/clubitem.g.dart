// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubList _$ClubListFromJson(Map<String, dynamic> json) => ClubList(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ClubItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClubListToJson(ClubList instance) => <String, dynamic>{
      'list': instance.list,
    };

ClubItem _$ClubItemFromJson(Map<String, dynamic> json) => ClubItem(
      image: json['image'] as String?,
      money: json['money'] as String?,
      clubname: json['clubname'] as String?,
      member: json['member'] as String?,
    );

Map<String, dynamic> _$ClubItemToJson(ClubItem instance) => <String, dynamic>{
      'money': instance.money,
      'image': instance.image,
      'clubname': instance.clubname,
      'member': instance.member,
    };

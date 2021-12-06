// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithList _$WithListFromJson(Map<String, dynamic> json) => WithList(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => WithItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WithListToJson(WithList instance) => <String, dynamic>{
      'list': instance.list,
    };

WithItem _$WithItemFromJson(Map<String, dynamic> json) => WithItem(
      image: json['image'] as String?,
      name: json['name'] as String?,
      money: json['money'] as String?,
      areaname: json['areaname'] as String?,
    );

Map<String, dynamic> _$WithItemToJson(WithItem instance) => <String, dynamic>{
      'money': instance.money,
      'image': instance.image,
      'name': instance.name,
      'areaname': instance.areaname,
    };

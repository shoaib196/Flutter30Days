// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item()
    ..id = json['id'] as int
    ..desc = json['desc'] as String
    ..image = json['image'] as String
    ..name = json['name'] as String
    ..price = json['price'] as int
    ..color = json['color'] as String;
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'color': instance.color,
    };

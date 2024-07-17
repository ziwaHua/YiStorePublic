// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BannerItemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerItemModel _$BannerItemModelFromJson(Map<String, dynamic> json) =>
    BannerItemModel(
      json['desc'] as String,
      (json['id'] as num).toInt(),
      json['imagePath'] as String,
      (json['isVisible'] as num).toInt(),
      (json['order'] as num).toInt(),
      json['title'] as String,
      (json['type'] as num).toInt(),
      json['url'] as String,
    );

Map<String, dynamic> _$BannerItemModelToJson(BannerItemModel instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };

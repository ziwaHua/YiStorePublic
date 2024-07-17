// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticleListDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleListDataModel _$ArticleListDataModelFromJson(
        Map<String, dynamic> json) =>
    ArticleListDataModel(
      (json['curPage'] as num).toInt(),
      (json['datas'] as List<dynamic>)
          .map((e) => ArticleItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['offset'] as num).toInt(),
      json['over'] as bool,
      (json['pageCount'] as num).toInt(),
      (json['size'] as num).toInt(),
      (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$ArticleListDataModelToJson(
        ArticleListDataModel instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

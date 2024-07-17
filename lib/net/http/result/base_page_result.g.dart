// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_page_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePageResult<T> _$BasePageResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePageResult<T>(
      (json['offse'] as num?)?.toInt(),
      (json['size'] as num?)?.toInt(),
      (json['pageCount'] as num?)?.toInt(),
      (json['total'] as num?)?.toInt(),
      (json['datas'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$BasePageResultToJson<T>(
  BasePageResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'offse': instance.offset,
      'size': instance.size,
      'pageCount': instance.pageCount,
      'total': instance.total,
      'datas': instance.datas?.map(toJsonT).toList(),
    };

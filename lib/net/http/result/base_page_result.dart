import 'package:json_annotation/json_annotation.dart';

part 'base_page_result.g.dart';

///wanAndroid基本列表数据基类
///带有范型的基类必须genericArgumentFactories: true  和 JsonKey
@JsonSerializable(genericArgumentFactories: true)
class BasePageResult<T> {
  @JsonKey(name: "offse")
  int? offset;
  @JsonKey(name: "size")
  int? size;
  @JsonKey(name: "pageCount")
  int? pageCount;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "datas")
  List<T>? datas;

  BasePageResult(
      this.offset, this.size, this.pageCount, this.total, this.datas);

  factory BasePageResult.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BasePageResultFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BasePageResultToJson(this, toJsonT);
}
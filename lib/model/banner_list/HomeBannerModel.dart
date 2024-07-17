import 'package:json_annotation/json_annotation.dart';
import 'package:yistore/model/banner_list/BannerItemModel.dart';

part 'HomeBannerModel.g.dart';

@JsonSerializable()
class HomeBannerModel {
  List<BannerItemModel> data;
  int errorCode;
  String errorMsg;

  HomeBannerModel(this.data, this.errorCode, this.errorMsg);

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) => _$HomeBannerModelFromJson(json);

  toJson() => _$HomeBannerModelToJson(this);

}
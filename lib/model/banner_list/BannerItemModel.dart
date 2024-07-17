
import 'package:json_annotation/json_annotation.dart';

part 'BannerItemModel.g.dart';

@JsonSerializable()
class BannerItemModel {
 String desc;
 int id;
 String imagePath;
 int isVisible;
 int order;
 String title;
 int type;
 String url;


 BannerItemModel(
  this.desc,
  this.id,
  this.imagePath,
  this.isVisible,
  this.order,
  this.title,
  this.type,
  this.url);

 factory BannerItemModel.fromJson(Map<String, dynamic> json) => _$BannerItemModelFromJson(json);

 toJson() => _$BannerItemModelToJson(this);
}

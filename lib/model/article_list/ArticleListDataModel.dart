import 'package:json_annotation/json_annotation.dart';
import 'package:yistore/model/article_list/ArticleItemModel.dart';

part 'ArticleListDataModel.g.dart';

@JsonSerializable()
class ArticleListDataModel {
  int curPage;
  List<ArticleItemModel> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  ArticleListDataModel(this.curPage, this.datas, this.offset, this.over,
      this.pageCount, this.size, this.total);

  factory ArticleListDataModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleListDataModelFromJson(json);
}
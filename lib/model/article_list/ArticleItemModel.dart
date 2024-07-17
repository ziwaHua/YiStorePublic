import 'package:json_annotation/json_annotation.dart';

import 'ArticleTagModel.dart';

part 'ArticleItemModel.g.dart';

@JsonSerializable()
class ArticleItemModel {
   bool adminAdd;
   String apkLink;
   int audit;
   String author;
   bool canEdit;
   int chapterId;
   String chapterName;
   bool collect;
   int courseId;
   String desc;
   String descMd;
   String envelopePic;
   bool fresh;
   String host;
   int id;
   bool isAdminAdd;
   String link;
   String niceDate;
   String niceShareDate;
   String origin;
   String prefix;
   String projectLink;
   int publishTime;
   int realSuperChapterId;
   int selfVisible;
   int shareDate;
   String shareUser;
   int superChapterId;
   String superChapterName;
   List<ArticleTagModel> tags;
   String title;
   int type;
   int userId;
   int visible;
   int zan;

  ArticleItemModel(
      this.adminAdd,
      this.apkLink,
      this.audit,
      this.author,
      this.canEdit,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
      this.desc,
      this.descMd,
      this.envelopePic,
      this.fresh,
      this.host,
      this.id,
      this.isAdminAdd,
      this.link,
      this.niceDate,
      this.niceShareDate,
      this.origin,
      this.prefix,
      this.projectLink,
      this.publishTime,
      this.realSuperChapterId,
      this.selfVisible,
      this.shareDate,
      this.shareUser,
      this.superChapterId,
      this.superChapterName,
      this.tags,
      this.title,
      this.type,
      this.userId,
      this.visible,
      this.zan
    );

  factory ArticleItemModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleItemModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ArticleItemModelToJson(this);
  }
}
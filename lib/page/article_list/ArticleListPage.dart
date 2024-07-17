import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yistore/until/log_util.dart';
import '../../base/base_controller.dart';
import '../../base/pageWidget/base_stateless_widget.dart';
import '../../model/article_list/ArticleItemModel.dart';
import '../../model/article_list/ArticleListModel.dart';
import '../../net/http/apiservice/api_service.dart';
import '../../widgets/EmptyHolder.dart';

class ArticleListPage extends BaseStatelessWidget<ArticleListController> {

  final controller = Get.find<ArticleListController>();
  @override
  bool showTitleBar() {
    return false;
  }

  @override
  Widget buildContent(BuildContext context) {
    logV("ArticleListPage  buildContent----->");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article List"),
      ),
      body: Obx(() {
        if (controller.dataList.isEmpty) {
          return EmptyHolder(msg: "No Data");
        }
        return ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.dataList[index].title),
              subtitle: Text(controller.dataList[index].author),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // TODO: 跳转到详情页
              },
            );
          },
        );
      }),
    );
  }

}


class ArticleListController extends BaseController<ApiService> {
  RxList<ArticleItemModel> dataList = <ArticleItemModel>[].obs;
  RxInt page = 0.obs;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    queryArticleListData();
  }

  void queryArticleListData() {
    httpRequest<ArticleListModel>(api.queryArticleList(page.value), (response) {
      var newList = response.data.datas;
      var originListLength = dataList.length;
      if (null != newList && newList.isNotEmpty) {
//        _listData.addAll(newList);
        //防止添加进重复数据
        for (var item in newList) {
          if (!dataList.contains(item.id)) {
            dataList.add(item);
          }
        }
      }
    });
  }

  @override
  void onHidden() {

  }
}

class ArticleListBinding implements Bindings {
  @override
  void dependencies() {
    logV("ArticleListBinding----->");
    Get.lazyPut(() => ArticleListController());
  }
}
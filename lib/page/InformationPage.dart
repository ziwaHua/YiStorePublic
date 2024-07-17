import 'package:banners/banners.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yistore/base/base_controller.dart';
import 'package:yistore/base/pageWidget/base_stateless_widget.dart';
import 'package:yistore/model/banner_list/BannerItemModel.dart';
import 'package:yistore/model/banner_list/HomeBannerModel.dart';
import 'package:yistore/net/http/apiservice/api_service.dart';
import 'package:yistore/until/log_util.dart';
import 'package:yistore/widgets/YiBanner.dart';

class InformationPage extends BaseStatelessWidget<InformationCollector> {
  InformationPage({Key? key}) : super(key: key);
  InformationCollector controller = Get.find<InformationCollector>();
  final _banners = <Widget>[];
  final List<String> banners  = [];
  @override
  bool showTitleBar() {
    return false;
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('资讯'),
        centerTitle: true,
      ),
      body: Obx(() => _buildBanner(context)),
    );
  }

  Widget _buildBanner(BuildContext context) {
    if (controller.dataList.isEmpty) {
      return const Center(
        child: Text("Loading"),
      );
    } else {
      banners.clear();
      for (var item in controller.dataList) {
        banners.add(item.imagePath);
      }
      double screenWidth = MediaQuery.of(context).size.width;
      return Container(
        height: screenWidth * 500 / 900,
        width: screenWidth,
        child:YiBanner(
          imagesUrls: banners,
          duration: const Duration(seconds: 5),
        )
      );
    }
  }
}

class BannerItem extends StatelessWidget {

  BannerItem({required this.item});

  final BannerItemModel item;

  Widget build(BuildContext context) {
    logD("BannerItem build---->${item.imagePath}");
    return GestureDetector(
      child: Image.network(item.imagePath, fit: BoxFit.cover),
      onTap: () {
        //Get.toNamed('/detail', arguments: item);
      },
    );
  }
}


class InformationCollector extends BaseController<ApiService>{
  RxList<BannerItemModel> dataList = <BannerItemModel>[].obs;

  @override
  void onReady() {
    logD('InformationCollector onReady---->');
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    queryBannerData();
  }

  void queryBannerData() {
    httpRequest<HomeBannerModel>(api.queryBannerList(), (response) {
      var newList = response.data;
      var originListLength = dataList.length;
      if (newList.isNotEmpty) {
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

class InformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationCollector>(() => InformationCollector());

  }
}
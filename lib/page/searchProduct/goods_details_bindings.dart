import 'package:get/get.dart';
import '../../until/log_util.dart';
import 'goods_details_controller.dart';

class GoodsDetailsBindings implements Bindings {
  @override
  void dependencies() {
    logV("goodsDetailsBindings dependencies------------");
    Get.lazyPut(() => GoodsDetailsController());
  }

}
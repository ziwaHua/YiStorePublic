import 'package:get/get.dart';

import '../../until/log_util.dart';
import 'entry_product_controller.dart';

class entryProductBindings implements Bindings {
  @override
  void dependencies() {
    logV("entryProductBindings");
    Get.lazyPut(() => EntryProductController());
  }


}
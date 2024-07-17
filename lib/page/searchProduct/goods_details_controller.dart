import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../db/database.dart';

class GoodsDetailsController extends GetxController{

  // var productName = "".obs;
  // var productCode = "".obs;
  // var productPrice = 0.0.obs;
  // var productContent = "".obs;
  // var productCount = 0.obs;

  final TextEditingController codeController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController countController = TextEditingController();

  final TextEditingController contentController = TextEditingController();

  @override
  void onClose() {
    codeController.dispose();
    priceController.dispose();
    nameController.dispose();
    countController.dispose();
    contentController.dispose();
    super.onClose();
  }

  void updateGood(Good good) {
    codeController.text = good.code;
    priceController.text = good.price.toString();
    nameController.text = good.name;
    countController.text = good.count.toString();
    contentController.text = good.content ?? "";
    // productCode.value = good.code;
    // productName.value = good.name;
    // productPrice.value = good.price;
    // productContent.value = good.content ?? "";
    // productCount.value = good.count;
    update();
  }

}
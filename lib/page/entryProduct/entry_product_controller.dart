import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryProductController extends GetxController{

  // var productCode = 0.obs;
  // setProductCode(int value) => productCode.value = value;
  // getProductCode() => productCode.value;
  final _works = ["保洁", "月嫂", "育婴师"];
  List<String> get works => _works;

  var productName = "".obs;

  final TextEditingController codeController = TextEditingController();
  final myText = ''.obs; // 使用 RxString 类型

  @override
  void onClose() {
    codeController.dispose(); // 在控制器关闭时释放 TextEditingController
    super.onClose();
  }

  void updateText(String newText) {
    myText.value = newText;
    codeController.text = newText; // 更新 TextEditingController 的值
  }


  //setProductName(String value) => productName.value = value;
  //getProductName() => productName.value;

  // var productPrice = 0.0.obs;
  // setProductPrice(double value) => productPrice.value = value;
  // getProductPrice() => productPrice.value;
  //
  // var productDescription = "".obs;
  // setProductDescription(String value) => productDescription.value = value;
  // getProductDescription() => productDescription.value;
  //
  // var productImage = "".obs;
  // setProductImage(String value) => productImage.value = value;
  // getProductImage() => productImage.value;



}
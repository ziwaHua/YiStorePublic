import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yistore/db/database.dart';
import '../../const/data_static.dart';
import '../../res/Strings.dart';
import '../../theme/buttonStyle.dart';
import '../../widgets/item_entryProduct.dart';
import '../MobileScannerPage.dart';
import 'entry_product_controller.dart';
import 'package:drift/drift.dart' as drift;

class entryProductPage extends GetView<EntryProductController> {
  final controller = Get.find<EntryProductController>();

  final db = Get.find<MyDb>();


  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _countController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 禁用自动调整大小以避免被软键盘遮挡
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(Strings.entryProduct),
        backgroundColor: Colors.amber,
      ),
      body:Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          ListView(
            children: [
              const SizedBox(height: 10),

              itemEntryProduct(
                title: '条码',
                controller: controller.codeController,
                onIconTap: () {
                  Get.to(() => const MobileScannerSimpleExample(),arguments: {DataStatic.pageId: DataStatic.insertPageId});
                },
                isShowIcon: true,
              ),

              const SizedBox(height: 20),

              itemEntryProduct(
                title: '名称',
                controller: _nameController,
                onIconTap: () {
                },
                isShowIcon: false,
              ),

              const SizedBox(height: 20),

              itemEntryProduct(
                title: '价格',
                controller: _priceController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onIconTap: () {
                },
                isShowIcon: false,
              ),

              const SizedBox(height: 20),

              itemEntryProduct(
                title: '数量',
                controller: _countController,
                keyboardType: TextInputType.number,
                onIconTap: () {
                },
                isShowIcon: false,
              ),
            ],
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right:8,
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child:
              ElevatedButton(
                onPressed: () {
                  saveData();
                },
                style:Buttonstyle.customButtonStyle,
                child: const Text(
                  '添加一条数据',
                  style: TextStyle(
                  color: Colors.black, // 按钮文字颜色
                  fontSize: 18, // 文本大小
                  fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveData(){
    if(_nameController.text.isEmpty || _priceController.text.isEmpty || _countController.text.isEmpty){
      Get.snackbar("提示", "请填写完整信息！");
      return;
    }
    var goodItem =GoodsCompanion(
        name: drift.Value(_nameController.text),
        code: drift.Value(controller.codeController.text),
        price: drift.Value(double.tryParse(_priceController.text) as double),
        count: drift.Value(int.tryParse(_countController.text) as int)
    );
    db.saveGood(goodItem).then((isSuccess) {
      if(isSuccess){
        Get.snackbar("提示","添加成功！");
        _nameController.clear();
        _priceController.clear();
        _countController.clear();
        controller.codeController.clear();
      }else{
        Get.snackbar("提示","添加失败");
      }
    });
  }


}

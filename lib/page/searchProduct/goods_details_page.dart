import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/Strings.dart';
import '../../widgets/item_entryProduct.dart';
import 'goods_details_controller.dart';

class GoodsDetailsPage extends GetView<GoodsDetailsController> {

  final controller = Get.find<GoodsDetailsController>();


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed('/');
          },
        ),
        title: const Text(Strings.goodsDetail),
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
               title: Strings.codeString,
               controller: controller.codeController,
               onIconTap: () {
               },
               isShowIcon: false,
               isHasHint: false,
             ),

             const SizedBox(height: 20),

             itemEntryProduct(
               title: Strings.nameString,
               controller: controller.nameController,
               onIconTap: () {
               },
               isShowIcon: false,
               isHasHint: false,
             ),

             const SizedBox(height: 20),

             itemEntryProduct(
               title: Strings.priceString,
               controller: controller.priceController,
               keyboardType: const TextInputType.numberWithOptions(decimal: true),
               onIconTap: () {
               },
               isShowIcon: false,
               isHasHint: false,
             ),

             const SizedBox(height: 20),

             itemEntryProduct(
               title: Strings.countString,
               controller: controller.countController,
               keyboardType: TextInputType.number,
               onIconTap: () {
               },
               isShowIcon: false,
               isHasHint: false,
             ),
           ],
         ),
       ],
     ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:yistore/page/searchProduct/goods_details_controller.dart';
import '../const/data_static.dart';
import '../db/database.dart';
import '../until/log_util.dart';
import 'entryProduct/entry_product_controller.dart';
import 'searchProduct/goods_details_page.dart';

class MobileScannerSimpleExample extends StatefulWidget {
  const MobileScannerSimpleExample({super.key});

  @override
  State<MobileScannerSimpleExample> createState() => _MobileScannerSimpleState();

}

class _MobileScannerSimpleState extends State<MobileScannerSimpleExample> {
  Barcode? _barcode;
  final controller = Get.put(EntryProductController());
  final detailsController = Get.put(GoodsDetailsController());
  late int number;
  late String pageId;
  final db = Get.find<MyDb>();

  @override
  initState() {
    number = 0;
    pageId = Get.arguments[DataStatic.pageId];

    super.initState();
  }

  Widget _buildBarcode(Barcode? value) {
    if(value == null){
      return const Text(
        '对准条码即可扫描',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }
    return Text(
      value.displayValue ?? '获取条码失败',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if(mounted){
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
        if(_barcode!= null){
          logV('initState：number:$number pageId:$pageId');
          if(number == 0){
            if(pageId == DataStatic.insertPageId){
              controller.updateText(_barcode!.displayValue.toString());
              Get.back();
            }else{
              db.getGoodByCode(_barcode!.displayValue.toString()).then((value) {
                if(value == null){
                  logW('商品不存在');
                  Get.snackbar('商品不存在', '请确认条码是否已录入');
                  return;
                }
                logV('商品详情：$value');
                detailsController.updateGood(value);
                Get.to(GoodsDetailsPage());
              });
            }
          }
          number++;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('扫描条码'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: _handleBarcode,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Center(child: _buildBarcode(_barcode))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}

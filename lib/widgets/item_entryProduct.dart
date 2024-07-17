import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class itemEntryProduct extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final VoidCallback onIconTap;
  final bool isShowIcon ;
  final TextInputType? keyboardType;
  final bool isHasHint;



  itemEntryProduct({
    required this.title,
    required this.controller,
    required this.onIconTap,
    required this.isShowIcon,
    this.keyboardType,
    this.isHasHint = true,
  });

  @override
  _EntryProductWidgetState createState() => _EntryProductWidgetState();
}

class _EntryProductWidgetState extends State<itemEntryProduct> {

    @override
    Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ],
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(top: 10),
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            inputFormatters: getInputFormatters(widget.keyboardType),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: widget.isHasHint?'输入${widget.title.toLowerCase()}':'',
              suffixIcon: widget.isShowIcon? IconButton(
                icon: const Icon(Icons.qr_code_scanner_outlined),
                onPressed: () {widget.onIconTap();},
              ):null,
            ),
          ),
        ),
      ],
    );
  }

    List<TextInputFormatter> getInputFormatters(TextInputType? type) {
      if (type == TextInputType.number) {
        return [FilteringTextInputFormatter.digitsOnly];// 允许输入数字
      } else if(type == const TextInputType.numberWithOptions(decimal: true)){
        return[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),// 允许输入数字和小数点
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))// 限制小数点后两位
        ];
      }else {
        return [];// 不限制输入
        //return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\u4e00-\u9fa5]'))]; // 默认允许字母、数字和中文字符
      }
    }
}






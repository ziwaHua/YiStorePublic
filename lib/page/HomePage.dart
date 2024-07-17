import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.teal,
      Colors.pink,
      Colors.brown,
    ];

    final List<String> texts = [
      '录入商品',
      '查询价格',
      '查看订单',
      '管理商品',
    ];
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            print("Card tapped");
          },
          child: Card(
            color: colors[index],
            elevation: 4,//设置阴影
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),//设置圆角
            ),
            child: Center(
              child: Text(
                texts[index],
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        );
      }),
    );
  }
}
import 'package:flutter/material.dart';
import '../res/yi_colors.dart';


class Buttonstyle {
  static ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.amber, // 背景颜色
    shadowColor: Colors.grey[300], // 阴影颜色
    elevation: 5, // 阴影强度
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // 边框半径
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 内边距

  );
}


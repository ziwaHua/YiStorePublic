import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.blueAccent,
  fontFamily: 'Georgia',
  appBarTheme: _appbarTheme(),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
);

AppBarTheme _appbarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 24.0),
    iconTheme: IconThemeData(color: Colors.black), systemOverlayStyle: SystemUiOverlayStyle.dark,
  );


}
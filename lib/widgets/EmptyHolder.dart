import 'package:flutter/material.dart';

class EmptyHolder extends StatelessWidget {
  final String msg;

  EmptyHolder({required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(msg ?? "Loading..."),
    );
  }
}
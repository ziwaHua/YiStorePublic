
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yistore/page/article_list/ArticleListPage.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('ArticleList Page'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.to(() => ArticleListPage(),binding: ArticleListBinding());
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Item 3'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
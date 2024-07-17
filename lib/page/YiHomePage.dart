
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yistore/page/entryProduct/entry_product_bindings.dart';
import 'package:yistore/page/entryProduct/entry_product_page.dart';
import 'package:yistore/res/Strings.dart';

import '../const/data_static.dart';
import 'MobileScannerPage.dart';

class YiHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .5,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEB8),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.asset('assets/images/icon_store_logo.png', height: 100, width: 100),
                const SizedBox(
                  width: 20,
                ),
                Text(Strings.appName, style: Theme.of(context).textTheme.headlineLarge),
              ],
            ),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * .35, left: 20, right: 20),
            child: GridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: .95,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: <Widget>[
                Card(
                  title: Strings.entryProduct,
                  icon: Icons.inbox_outlined,
                  onTap: () {
                    Get.to(() => entryProductPage(),binding: entryProductBindings());
                  },
                ),
                Card(
                  title: Strings.checkPrice,
                  icon: Icons.qr_code_scanner,
                  onTap: () {
                    Get.to(() => const MobileScannerSimpleExample(),arguments: {DataStatic.pageId: DataStatic.searchPageId});
                    // Get.to(StatePage());
                  },
                ),
                Card(
                  title: Strings.shopOrder,
                  icon: Icons.list,
                  onTap: () {
                    //Get.to(InjectHomePage());
                  },
                ),
                Card(
                  title: Strings.internationalization,
                  icon: Icons.language,
                  onTap: () {
                    // Get.to(LocalPage());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback onTap;

  const Card({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          children: [
            Spacer(),
            Icon(
              icon,
              size: 60,
              color: Colors.amber,
            ),
            const Spacer(),
            const SizedBox(height: 15),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
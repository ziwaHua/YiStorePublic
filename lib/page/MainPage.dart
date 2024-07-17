import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yistore/page/InformationPage.dart';
import 'package:yistore/page/MyPage.dart';
import 'package:yistore/page/YiHomePage.dart';
import 'package:yistore/page/article_list/ArticleListPage.dart';
import 'package:yistore/res/Strings.dart';
import 'package:yistore/res/yi_colors.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;

  final Map<String,IconData> iconsMap = {
    Strings.home : Icons.home,
    Strings.info : Icons.newspaper,
    Strings.my  : Icons.person,
  };
  final List<Widget> _pages = [
    YiHomePage(),
    InformationPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: Scaffold(
          appBar: null,
          body: _pages[_bottomNavIndex],
          bottomNavigationBar: _buildBottomNavigationBar(),
        ),

    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index){
        setState(() {
          _bottomNavIndex = index;
        });
      },
      currentIndex: _bottomNavIndex,
      unselectedItemColor: YiColors.grey,
      selectedItemColor: YiColors.yellow,
      //unselectedLabelStyle: const TextStyle(color: YiColors.grey),
      //selectedLabelStyle: const TextStyle(color: YiColors.blossomPink),
      items: iconsMap.keys.map((key) => BottomNavigationBarItem(
          label: key,
          icon: Icon(iconsMap[key]),
      )).toList(),
    );
  }
}

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationCollector>(() => InformationCollector());
    Get.lazyPut(() => ArticleListController());
  }
}

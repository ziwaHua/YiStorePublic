import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yistore/net/http/apiservice/api_service.dart';
import 'package:yistore/page/InformationPage.dart';
import 'package:yistore/page/MobileScannerPage.dart';
import 'package:yistore/res/Strings.dart';
import 'package:yistore/routers/app_pages.dart';
import 'package:yistore/routers/app_routes.dart';
import 'db/database.dart';
import 'inject/global/async_controller.dart';
import 'inject/global/lazy_controller.dart';
import 'inject/global/put_controller.dart';
import 'page/MainPage.dart';

MyDb? db;
void main() {
  //初始化数据库
  db = MyDb();
  Get.put<MyDb>(db!);
  //确保 WidgetsFlutterBinding 已经被初始化
  WidgetsFlutterBinding.ensureInitialized();

  //PutController将其存储在 Get 的依赖注入容器中
  Get.put<PutController>(PutController());

  Get.lazyPut(() => ApiService());

  Get.lazyPut<InformationCollector>(() =>InformationCollector());

  //只有在首次访问控制器时才会创建实例
  Get.lazyPut<LazyController>(() => LazyController());

  //Get.putAsync 允许你异步地获取控制器的实例
  Get.putAsync<AsyncController>(() async {
    final controller = await AsyncController.getInstance();
    return controller;
  });
  Get.putAsync<SharedPreferences>(() async {
    final sp = await SharedPreferences.getInstance();
    return sp;
  });
  runApp(YiApp());
}

class YiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// 在 MaterialApp 组件外层包裹一层 ScreenUtilInit 组件
    return ScreenUtilInit(
      /// 设置设计稿宽高
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      splitScreenMode: true,
      /// 设置原本要显示的 MaterialApp
      builder:(BuildContext context, Widget? child) =>
          GetMaterialApp(
            getPages: AppPages.pages,
            debugShowCheckedModeBanner: false,
            initialBinding: MainPageBinding(),
            initialRoute: Routes.INITIAL,
            title: Strings.appName,
            // theme: ThemeData(
            //   primarySwatch: Colors.yellow,
            // ),
            home: MainPage(),


          )
    );
  }
}


class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner Example'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                 Navigator.of(context).push(
                   MaterialPageRoute(builder: (context) =>  MobileScannerSimpleExample(),),
                );
              },
              child: const Text('MobileScanner Simple'),
            ),
            ElevatedButton(
              onPressed: () {
                db!.saveGood(const GoodsCompanion(name: drift.Value('iPhone 13 Pro Max'),code: drift.Value('1234567890'),price: drift.Value(1299.0), content: drift.Value('The best phone in the world')));
              },
              child: const Text('添加一条数据'),
            ),

            ElevatedButton(
              onPressed: () {
                // db!.getGood(1).then((value) {
                //   logV(value.toString());
                // });
              },
              child: const Text('查询所有数据'),
            ),
          ],
        ),
      ),
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child:const Column(
          children: [SearchBarWidget(),ContentWidget(),BottomBarWidget()],
        ),
      ),
    );
  }
}

class  SearchBarWidget extends StatelessWidget{
  const SearchBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child:Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search,color: Color(0xFF8C8D92)),
                      SizedBox(width: 8.0),
                      Text('搜索内容',
                          style: TextStyle(fontSize: 14.0, // 字体大小
                          color: Color(0xFF8C8D92), // 设置字体颜色
                          decoration: TextDecoration.none, // 设置不显示下划线
                          fontWeight: FontWeight.normal)
                      )
                    ],
                  ),
                )
            )
          ],
        ),
    );
  }

}

class ContentWidget extends StatefulWidget {
  const ContentWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabStrList = [
    '关注',
    '推荐',
    '热榜',
    '头条',
    '后端',
    '前端',
    'Android',
    'iOS',
    '人工智能',
    '开发工具'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabStrList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            TabBar(
              isScrollable: true, // 设置可滚动
              controller: _tabController, // 关联TabController
              tabs: tabStrList.map((e) => Tab(text: e)).toList(),
            ),
            // 高度填满剩余空间
            Expanded(child: TabBarView(
              // 同样使用TabBarView
                controller: _tabController, // 关联同一个TabController
                children: tabStrList
                    .map((e) => const ContentListWidget())
                    .toList()),
            ),
          ],
        ),
      ),
    );
  }
}


class ContentListWidget extends StatelessWidget {
  const ContentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                const Row(children: [
                  Text('跟🤡杰哥一起学Flutter',
                      style: TextStyle(
                          fontSize: 14.0, // 字体大小
                          color: Colors.black, // 设置字体颜色
                          decoration: TextDecoration.none // 设置不显示下划线
                      ))
                ]),
                const Row(children: [
                  Icon(Icons.person),
                  SizedBox(width: 4),
                  Text('coder_pig')
                ]),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Expanded(
                        child: Text(
                            '时代峰峻了思考的放开了教师节快乐地方就是看漏点击福克斯搭建开发手机打开发送点击开发技术的开发律师代理费是劳动法',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis))
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.lightbulb_outline),
                    const Text('999+'),
                    const SizedBox(width: 18),
                    const Icon(Icons.keyboard_voice),
                    const Text('999+'),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0), // 根据需要调整内边距
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0), // 设定边界半径，实现圆角
                      ),
                      child: const Text(
                        'Flutter',
                        style:
                        TextStyle(color: Colors.white), // 设置文本颜色以确保与背景色形成对比
                      ),
                    ),
                    const Icon(Icons.more_vert)
                  ],
                )
              ]));
        },
        separatorBuilder: (context, index) {
          return const Divider(color: Color(0XFFF3F4F6), thickness: 8.0);
        },
        itemCount: 20);
  }
}

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (position) {
        setState(() => _position = position);
      },
      selectedItemColor: Colors.blue, // 选中时的颜色
      unselectedItemColor: Colors.black,  // 未选中时的颜色
      showSelectedLabels: true, // 选中的label是否展示
      showUnselectedLabels: true, // 未选中的label是否展示
      currentIndex: _position,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        // BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: '沸点'),
        // BottomNavigationBarItem(icon: Icon(Icons.zoom_out), label: '发现'),
        // BottomNavigationBarItem(icon: Icon(Icons.book), label: '课程'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '我'),
      ],
    );
  }
}




import 'package:get/get.dart';
import 'package:yistore/page/InformationPage.dart';
import 'package:yistore/page/MainPage.dart';
import 'package:yistore/page/article_list/ArticleListPage.dart';
import 'package:yistore/routers/app_routes.dart';
import '../page/entryProduct/entry_product_bindings.dart';
import '../page/entryProduct/entry_product_page.dart';

abstract class AppPages {
  static final pages = [


    GetPage(
      name: Routes.MainiPage,
      page: () => MainPage(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: Routes.EntryProductPage,
      page: () => entryProductPage(),
      binding: entryProductBindings(),
    ),
    GetPage(
      name: Routes.InformationPage,
      page: () => InformationPage(),
      bindings: [InformationBinding(),],
    ),
    GetPage(
      name: Routes.ArticleListPage,
      page: () => ArticleListPage(),
      bindings: [ArticleListBinding(),],
    ),
    // GetPage(
    //   name: Routes.MIDDLEWARE_PAGE,
    //   page: () => MiddlewarePagePage(),
    //   binding: MiddlewarePageBinding(),
    //   middlewares: [AuthMiddleware()],
    // ),
  ];
}
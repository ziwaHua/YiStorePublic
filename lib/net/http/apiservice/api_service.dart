import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:yistore/model/article_list/ArticleListModel.dart';
import 'package:yistore/model/banner_list/HomeBannerModel.dart';
import '../../../const/http_url.dart';
import '../dio_client.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: HttpUrl.BASE_URL)
abstract class ApiService {
  factory ApiService({Dio? dio, String? baseUrl}) {
    dio ??= DioClient().dio;
    return _ApiService(dio, baseUrl: baseUrl);
  }

  // ///获取首页数据
  // @GET("api/v2/feed")
  // Future<FeedEntity> queryFeedData(
  //     @Query("date") String date, @Query("num") int pageIndex);


  @GET("article/list/{page}/json")
  Future<ArticleListModel> queryArticleList(@Path("page") int page);

  @GET("banner/json")
  Future<HomeBannerModel> queryBannerList();




}
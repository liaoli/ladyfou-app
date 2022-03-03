import 'package:ladyfou/core/http/response.dart';
import 'package:ladyfou/core/model/good_info_model.dart';
import 'package:ladyfou/core/model/order_info_model.dart';
import 'package:ladyfou/core/model/sort_model.dart';
import 'package:ladyfou/core/utils/toast.dart';
import 'package:ladyfou/page/cart/model/cart_model.dart';

import '../../page/home/components/daily_new_product_new.dart';
import '../model/category_info_model.dart';
import '../model/city_list_model.dart';
import '../model/country_list_model.dart';
import '../model/daily_new_product_list_model.dart';
import '../model/good_collection_model.dart';
import '../model/county_list_model.dart';
import '../model/home_data_list_model.dart';
import '../model/province_list_model.dart';
import '../model/token_info_model.dart';
import 'http.dart';

/// 注册接口
/// [chinese_name] 名字
/// [katakana_name] 片假名
/// [email] 邮箱
/// [password] 密码
Future<MyResponse<TokenInfoModel>> register({
  required String chinese_name,
  required String katakana_name,
  required String email,
  required String password,
}) async {
  Map<String, dynamic> result = await XHttp.post("/ladyfou/account/register", {
    "chinese_name": chinese_name,
    "katakana_name": katakana_name,
    "email": email,
    "password": password,
  });
  MyResponse<TokenInfoModel> response = MyResponse.fromJson(result);

  return response;
}

/// 登录接口
/// [email] 邮箱
/// [password] 密码
Future<MyResponse<TokenInfoModel>> login({
  required String email,
  required String password,
}) async {
  Map<String, dynamic> result = await XHttp.post("/ladyfou/account/login", {
    "email": email,
    "password": password,
  });
  MyResponse<TokenInfoModel> response = MyResponse.fromJson(result);

  return response;
}

/// home页数据 限时折扣 新品 ，排行榜
Future<MyResponse<HomeDataListModel>> homeData() async {
  Map<String, dynamic> result = await XHttp.get(
    "/ladyfou/product/getProductData",
  );
  MyResponse<HomeDataListModel> response = MyResponse.fromJson(result);

  return response;
}

/// home 每日新品
/// ladyfou/product/newProduct?page=1&page_size=3
Future<MyResponse<DailyNewProductListModel>> homeDailyNew({
  int page = 1,
  int pageSize = 6,
}) async {
  Map<String, dynamic> result = await XHttp.get(
    "/ladyfou/product/newProduct",
    {
      "page" : page,
      "page_size" : pageSize,
    }
  );
  MyResponse<DailyNewProductListModel> response = MyResponse.fromJson(result);

  return response;
}


/// home 限时折扣
/// ladyfou/product/discountProduct?page=1&page_size=3
Future<MyResponse<DailyNewProductListModel>> homeLimitTimeDiscount({
  int page = 1,
  int pageSize = 6,
}) async {
  Map<String, dynamic> result = await XHttp.get(
      "/ladyfou/product/discountProduct",
      {
        "page" : page,
        "page_size" : pageSize,
      }
  );
  MyResponse<DailyNewProductListModel> response = MyResponse.fromJson(result);

  return response;
}

///ladyfou/product/youLikeProduct
/// home 限时折扣
///ladyfou/product/youLikeProduct?page=1&page_size=3
Future<MyResponse<DailyNewProductListModel>> recommendList({
  int page = 1,
  int pageSize = 6,
}) async {
  Map<String, dynamic> result = await XHttp.get(
      "/ladyfou/product/youLikeProduct",
      {
        "page" : page,
        "page_size" : pageSize,
      }
  );
  MyResponse<DailyNewProductListModel> response = MyResponse.fromJson(result);

  return response;
}

/////////////////////////////////thw-start////////////////////////////////////

Future handleResponse(MyResponse response) async {
  if (response.common.statusCode != 1000) {
    String error = response.common.debugMessage;

    /// 先屏蔽
    // ToastUtils.error(error);
  }
}

/// 获取分类接口
Future<MyResponse<List<SortModel>>> getSortData() async {
  Map<String, dynamic> result = await XHttp.get("/ladyfou/catalog/category");
  MyResponse<List<SortModel>> response =
      MyResponse<List<SortModel>>.fromJson(result);
  handleResponse(response);
  return response;
}

/// 获取二级分类
Future<MyResponse<List<GoodsInfoModel>>> getCategoryProduct(
    {required Map<String, dynamic> params}) async {
  Map<String, dynamic> result =
      await XHttp.get("/ladyfou/catalog/category_product", params);
  MyResponse<List<GoodsInfoModel>> response =
      MyResponse<List<GoodsInfoModel>>.fromJson(result);
  handleResponse(response);
  return response;
}

/// 获取一级二级分类数据
Future<MyResponse<List<CategoryInfoModel>>> getCategoryChilds({
  required int id,
}) async {
  Map<String, dynamic> result =
      await XHttp.get("/ladyfou/catalog/cate_child", {"category_id": id});
  MyResponse<List<CategoryInfoModel>> response =
      MyResponse<List<CategoryInfoModel>>.fromJson(result);
  handleResponse(response);
  return response;
}

/// 获取订单列表
Future<MyResponse<List<OrderInfoModel>>> getOrderInfos(
    {required Map<String, dynamic> params, bool isLoadMore = false}) async {
  Map<String, dynamic> result =
      await XHttp.get("/ladyfou/account/order", params);
  MyResponse<List<OrderInfoModel>> response =
      MyResponse<List<OrderInfoModel>>.fromJson(result);
  handleResponse(response);
  return response;
}

/// 获取收藏列表
Future<MyResponse<CollectionInfoModel>> getCollectionInfos(
    {required Map<String, dynamic> params}) async {
  Map<String, dynamic> result =
      await XHttp.get("/ladyfou/account/wish_list", params);
  MyResponse<CollectionInfoModel> response =
      MyResponse<CollectionInfoModel>.fromJson(result);
  handleResponse(response);
  return response;
}

/// 收藏
Future<MyResponse> operationIsWished(
    {required Map<String, dynamic> params}) async {
  Map<String, dynamic> result =
      await XHttp.post("/ladyfou/account/wish_product", params);
  MyResponse response = MyResponse.fromJson(result);
  handleResponse(response);
  return response;
}

/// 取消收藏
Future<MyResponse> cancleIsWished(
    {required Map<String, dynamic> params}) async {
  Map<String, dynamic> result =
      await XHttp.post("/ladyfou/account/delete_wish_batch", params);
  MyResponse response = MyResponse.fromJson(result);
  handleResponse(response);
  return response;
}

/// 加入购物车
Future<MyResponse> addCart({required Map<String, dynamic> params}) async {
  Map<String, dynamic> result =
  await XHttp.post("/ladyfou/checkout/add_to_cart", params);
  MyResponse response = MyResponse.fromJson(result);
  handleResponse(response);
  return response;
}

/// 获取分类产品尺码规格
Future<MyResponse<List<OptionsSizeReq>>> getOptionSize({required Map<String, dynamic> params}) async {
  Map<String, dynamic> result =
  await XHttp.get("/ladyfou/catalog/getOptionSize", params);
  MyResponse<List<OptionsSizeReq>> response = MyResponse.fromJson(result);
  handleResponse(response);
  return response;
}

/////////////////////////////////thw-end//////////////////////////////////////

/*-------------------------------购物车--------------------------------------*/
Future<MyResponse<CartModel>> getCartList(
    {required Map<String, dynamic> params}) async {
  Map<String, dynamic> result =
      await XHttp.get("/ladyfou/checkout/shopping_cart_list", params);
  MyResponse<CartModel> response = MyResponse<CartModel>.fromJson(result);
  return response;
}

/// 获取国家
///
Future<MyResponse<CountryListModel>> getCountryList() async {
  Map<String, dynamic> result = await XHttp.get(
    "/ladyfou/common/country",
  );
  MyResponse<CountryListModel> response =
      MyResponse<CountryListModel>.fromJson(result);
  return response;
}

/// 通过国家获取省
/// [country_id] int  国家id
Future<MyResponse<ProvinceListModel>> getProvinceList(
    {int country_id = 122}) async {
  Map<String, dynamic> result =
      await XHttp.get("/ladyfou/common/country", {"country_id": country_id});
  MyResponse<ProvinceListModel> response =
      MyResponse<ProvinceListModel>.fromJson(result);
  return response;
}

/// 通过省分获取城市
/// [country] int  省的名字
Future<MyResponse<CityListModel>> getCityList({required String country}) async {
  Map<String, dynamic> result =
      await XHttp.get("/ladyfou/common/city", {"country": country});
  MyResponse<CityListModel> response =
      MyResponse<CityListModel>.fromJson(result);
  return response;
}

/// 通过省分获取城市
/// [country] int  省的名字
/// [city] int  城市
/// otonastyle/common/town?country=東京都&city=あきる野市
Future<MyResponse<CountyListModel>> getCountyList(
    {required String country, required String city}) async {
  Map<String, dynamic> result = await XHttp.get("/ladyfou/common/town", {
    "country": country,
    "city": city,
  });
  MyResponse<CountyListModel> response =
      MyResponse<CountyListModel>.fromJson(result);
  return response;
}

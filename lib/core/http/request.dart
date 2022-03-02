import 'package:ladyfou/core/http/response.dart';
import 'package:ladyfou/core/model/good_info_model.dart';
import 'package:ladyfou/core/model/order_info_model.dart';
import 'package:ladyfou/core/model/sort_model.dart';
import 'package:ladyfou/page/cart/model/cart_model.dart';

import '../model/category_info_model.dart';
import '../model/country_list_model.dart';
import '../model/home_data_list_model.dart';
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
  Map<String, dynamic> result =
      await XHttp.post("/otonastyle/account/register", {
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
  Map<String, dynamic> result = await XHttp.post("/otonastyle/account/login", {
    "email": email,
    "password": password,
  });
  MyResponse<TokenInfoModel> response = MyResponse.fromJson(result);

  return response;
}

/// home页数据 限时折扣 新品 ，排行榜
Future<MyResponse<HomeDataListModel>> homeData() async {
  Map<String, dynamic> result = await XHttp.get(
    "/otonastyle/product/getProductData",
  );
  MyResponse<HomeDataListModel> response = MyResponse.fromJson(result);

  return response;
}

/////////////////////////////////thw-start////////////////////////////////////
/// 获取分类接口
Future<MyResponse<List<SortModel>>> getSortData() async {
  Map<String, dynamic> result = await XHttp.get("/otonastyle/catalog/category");
  MyResponse<List<SortModel>> response =
      MyResponse<List<SortModel>>.fromJson(result);
  return response;
}

/// 获取二级分类
Future<MyResponse<List<GoodsInfoModel>>> getCategoryProduct(
    {required int id,
    required int page,
    required int size,
    String order_type = ""}) async {
  Map<String, dynamic> result =
      await XHttp.get("/otonastyle/catalog/category_product", {
    "id": id,
    "page": page,
    "size": size,
    "order_type": order_type,
  });
  MyResponse<List<GoodsInfoModel>> response =
      MyResponse<List<GoodsInfoModel>>.fromJson(result);
  return response;
}

/// 获取一级二级分类数据
Future<MyResponse<List<CategoryInfoModel>>> getCategoryChilds({
  required int id,
}) async {
  Map<String, dynamic> result =
      await XHttp.get("/otonastyle/catalog/cate_child", {"category_id": id});
  MyResponse<List<CategoryInfoModel>> response =
      MyResponse<List<CategoryInfoModel>>.fromJson(result);
  return response;
}

/// 获取订单列表
Future<MyResponse<List<OrderInfoModel>>> getOrderInfos(
    {required Map<String, dynamic> params, bool isLoadMore = false}) async {
  Map<String, dynamic> result =
      await XHttp.get("/otonastyle/account/order", params);
  MyResponse<List<OrderInfoModel>> response =
      MyResponse<List<OrderInfoModel>>.fromJson(result);
  return response;
}

/// 获取收藏列表
Future<MyResponse<List<GoodsInfoModel>>> getCollectionInfos(
    {required Map<String, dynamic> params}) async {
  Map<String, dynamic> result =
      await XHttp.get("/otonastyle/account/wish_list", params);
  MyResponse<List<GoodsInfoModel>> response =
      MyResponse<List<GoodsInfoModel>>.fromJson(result);
  return response;
}

/////////////////////////////////thw-end//////////////////////////////////////

/*-------------------------------购物车--------------------------------------*/
Future<MyResponse<CartModel>> getCartList(
    {required Map<String, dynamic> params}) async {
  Map<String, dynamic> result =
      await XHttp.get("/otonastyle/checkout/shopping_cart_list", params);
  MyResponse<CartModel> response = MyResponse<CartModel>.fromJson(result);
  return response;
}

/// 获取国家
///
Future<MyResponse<CountryListModel>> getCountryList() async {
  Map<String, dynamic> result = await XHttp.get(
    "/otonastyle/common/country",
  );
  MyResponse<CountryListModel> response =
      MyResponse<CountryListModel>.fromJson(result);
  return response;
}

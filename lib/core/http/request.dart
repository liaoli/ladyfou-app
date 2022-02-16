



import 'package:ladyfou/core/http/response.dart';
import 'package:ladyfou/core/model/good_info_model.dart';
import 'package:ladyfou/core/model/sort_model.dart';

import '../model/user_info_model.dart';
import 'http.dart';

/// 注册接口
/// [username] 用户名
/// [password] 密码
/// [repassword] 确认密码
Future<MyResponse<UserInfoModel>> register(
    {
      required String username ,
      required String password ,
      required String repassword ,
    }) async {
  Map<String, dynamic> result = await XHttp.post("/user/register", {
    "username": username,
    "password": password,
    "repassword": repassword
  });
  MyResponse<UserInfoModel> response = MyResponse.fromJson(result);

  return response;
}


/// 登录接口
/// [username] 用户名
/// [password] 密码
/// [repassword] 确认密码
Future<MyResponse<UserInfoModel>> login(
    {
      required String username ,
      required String password ,
    }) async {
  Map<String, dynamic> result = await XHttp.post("/user/login", {
    "username": username,
    "password": password,
  });
  MyResponse<UserInfoModel> response = MyResponse.fromJson(result);

  return response;
}


/////////////////////////////////thw-start////////////////////////////////////
/// 获取分类接口
Future<MyResponse<List<SortModel>>> getSortData() async {
  Map<String, dynamic> result = await XHttp.get("/otonastyle/catalog/category");
  MyResponse<List<SortModel>> response = MyResponse<List<SortModel>>.fromJson(result);
  return response;
}
/// 获取二级分类
Future<MyResponse<List<GoodsInfoModel>>> getCategoryProduct(
{
  required int id,
  required int page,
  required int size,
}) async {
  Map<String, dynamic> result = await XHttp.get("/otonastyle/catalog/category_product",{
    "id":id,
    "page":page,
    "size":size,
  });
  MyResponse<List<GoodsInfoModel>> response = MyResponse<List<GoodsInfoModel>>.fromJson(result);
  return response;
}
/////////////////////////////////thw-end//////////////////////////////////////
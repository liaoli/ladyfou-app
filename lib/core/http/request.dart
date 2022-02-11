



import 'package:ladyfou/core/http/response.dart';

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
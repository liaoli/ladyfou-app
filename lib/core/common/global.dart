// 提供五套可选主题色

import 'package:ladyfou/core/constant/share_preference_key.dart';
import 'package:ladyfou/utils/sputils.dart';

import '../model/token_info_model.dart';
import '../model/user_info_model.dart';

class Global {
  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static late UserInfoModel userInfo;
  static late TokenInfoModel tokenInfo;

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    userInfo = SPUtils.getUserInfo();
    tokenInfo = SPUtils.getTokenInfo();
  }

  static bool isLogin() {
    return tokenInfo.token.isNotEmpty;
  }

  static Future<bool> logout() async {
    bool logout = await SPUtils.removeKey(TOKEN_INFO);
    tokenInfo = TokenInfoModel();
    return logout;
  }
}

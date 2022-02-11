// 提供五套可选主题色



import 'package:ladyfou/utils/sputils.dart';

import '../model/user_info_model.dart';



class Global {

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static late  UserInfoModel userInfo;

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    userInfo = SPUtils.getUserInfo();
  }
}
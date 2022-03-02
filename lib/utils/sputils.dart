import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ladyfou/core/common/global.dart';
import 'package:ladyfou/utils/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant/share_preference_key.dart';
import '../core/model/token_info_model.dart';
import '../core/model/user_info_model.dart';
import '../page/login/login.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  static late SharedPreferences _spf;

  static Future<SharedPreferences> init() async {
    _spf = await SharedPreferences.getInstance();
    return _spf;
  }


  ///删除某个key
  static Future<bool> removeKey(String key) {
    return _spf.remove(key);
  }

  ///主题
  static Future<bool> saveThemeIndex(int value) {
    return _spf.setInt('key_theme_color', value);
  }



  static int getThemeIndex() {
    if (_spf.containsKey('key_theme_color')) {
      return _spf.getInt('key_theme_color')!;
    }
    return 0;
  }

  ///深色模式
  static Future<bool> saveBrightness(bool isDark) {
    return _spf.setBool('key_brightness', isDark);
  }

  static Brightness getBrightness() {
    bool? isDark = _spf.containsKey('key_brightness')
        ? _spf.getBool('key_brightness')!
        : false;
    return isDark ? Brightness.dark : Brightness.light;
  }

  ///语言
  static Future<bool> saveLocale(String locale) {
    return _spf.setString('key_locale', locale);
  }

  static String getLocale() {
    String? locale = _spf.getString('key_locale');
    if (locale == null) {
      locale = LOCALE_FOLLOW_SYSTEM;
    }
    return locale;
  }

  ///token
  static Future<bool> saveToken(String token) {
    return _spf.setString('key_token', token);
  }

  static String? getToken() {
    return /*_spf.getString('key_token')*/ '5LgZCkp9jSYtK94uvmveI29AEc9hVPld';
  }

  ///是否同意隐私协议
  static Future<bool> saveIsAgreePrivacy(bool isAgree) {
    return _spf.setBool('key_agree_privacy', isAgree);
  }

  static bool isAgreePrivacy() {
    if (!_spf.containsKey('key_agree_privacy')) {
      return false;
    }
    return _spf.getBool('key_agree_privacy')!;
  }

  ///是否已登陆
  static bool isLogined() {
    String? token = getToken();
    return token != null && token.isNotEmpty;
  }

  /// 是否登录，未登录的跳转登录页
  static bool tryToLogin(BuildContext context) {
    bool isLogin = isLogined();
    if (isLogin == false) {
      Get.to(() => LoginPage());
    }
    return isLogin;
  }

  //版本号
  static Future<bool> saveVersionNum(String versionNum) {
    return _spf.setString('key_versionNum', versionNum);
  }

  static String? getVersionNum() {
    return _spf.getString("key_versionNum");
  }

  ///存取用户信息
  ///MeInfoModel info 用回信息对象
  static Future<bool> saveUserInfo(UserInfoModel info) {
    return _spf.setString("key_user_info", info.toJson());
  }

  ///获取用户信息
  static UserInfoModel getUserInfo() {
    String? uJson = _spf.getString("key_user_info");

    if (uJson != null) {
      UserInfoModel model = UserInfoModel.fromJson(uJson);
      return model;
    } else {
      return UserInfoModel();
    }
  }

  ///存取token信息
  static Future<bool> saveTokenInfo(TokenInfoModel info) {
    Global.tokenInfo = info;
    return _spf.setString(TOKEN_INFO, info.toJson());
  }

  ///获取token信息
  static TokenInfoModel getTokenInfo() {
    String? uJson = _spf.getString(TOKEN_INFO);

    if (uJson != null) {
      TokenInfoModel model = TokenInfoModel.fromJson(uJson);
      return model;
    } else {
      return TokenInfoModel();
    }
  }
}

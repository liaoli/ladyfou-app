// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Template`
  String get title {
    return Intl.message(
      'Flutter Template',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `邮箱地址`
  String get login_email {
    return Intl.message(
      '邮箱地址',
      name: 'login_email',
      desc: '',
      args: [],
    );
  }

  /// `密码`
  String get login_password {
    return Intl.message(
      '密码',
      name: 'login_password',
      desc: '',
      args: [],
    );
  }

  /// `登  录`
  String get login_button_text {
    return Intl.message(
      '登  录',
      name: 'login_button_text',
      desc: '',
      args: [],
    );
  }

  /// `密码不能少于6位!`
  String get passwordError {
    return Intl.message(
      '密码不能少于6位!',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `登录成功`
  String get loginSuccess {
    return Intl.message(
      '登录成功',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `注册`
  String get register {
    return Intl.message(
      '注册',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `名字`
  String get register_name {
    return Intl.message(
      '名字',
      name: 'register_name',
      desc: '',
      args: [],
    );
  }

  /// `片假名`
  String get register_pj_Name {
    return Intl.message(
      '片假名',
      name: 'register_pj_Name',
      desc: '',
      args: [],
    );
  }

  /// `Register Success`
  String get registerSuccess {
    return Intl.message(
      'Register Success',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `完成注册并登陆`
  String get register_button_text {
    return Intl.message(
      '完成注册并登陆',
      name: 'register_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get chinese {
    return Intl.message(
      'Chinese',
      name: 'chinese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get auto {
    return Intl.message(
      'Auto',
      name: 'auto',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get versionName {
    return Intl.message(
      'Version',
      name: 'versionName',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get author {
    return Intl.message(
      'Author',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `QQ Group`
  String get qqgroup {
    return Intl.message(
      'QQ Group',
      name: 'qqgroup',
      desc: '',
      args: [],
    );
  }

  /// `AppUpdate`
  String get appupdate {
    return Intl.message(
      'AppUpdate',
      name: 'appupdate',
      desc: '',
      args: [],
    );
  }

  /// `Sponsor`
  String get sponsor {
    return Intl.message(
      'Sponsor',
      name: 'sponsor',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `category`
  String get category {
    return Intl.message(
      'category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `game`
  String get game {
    return Intl.message(
      'game',
      name: 'game',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get me {
    return Intl.message(
      'Profile',
      name: 'me',
      desc: '',
      args: [],
    );
  }

  /// `history`
  String get history {
    return Intl.message(
      'history',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message(
      'Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Disagree`
  String get disagree {
    return Intl.message(
      'Disagree',
      name: 'disagree',
      desc: '',
      args: [],
    );
  }

  /// `Look Again`
  String get lookAgain {
    return Intl.message(
      'Look Again',
      name: 'lookAgain',
      desc: '',
      args: [],
    );
  }

  /// `Still Disagree`
  String get stillDisagree {
    return Intl.message(
      'Still Disagree',
      name: 'stillDisagree',
      desc: '',
      args: [],
    );
  }

  /// `  Do you want to think about it again？`
  String get thinkAboutItAgain {
    return Intl.message(
      '  Do you want to think about it again？',
      name: 'thinkAboutItAgain',
      desc: '',
      args: [],
    );
  }

  /// `    We attach great importance to the protection of your personal information and promise to protect and process your information in strict accordance with the 《{appName} privacy policy》. If you do not agree with the policy, we regret that we will not be able to provide you with services.`
  String privacyExplainAgain(Object appName) {
    return Intl.message(
      '    We attach great importance to the protection of your personal information and promise to protect and process your information in strict accordance with the 《$appName privacy policy》. If you do not agree with the policy, we regret that we will not be able to provide you with services.',
      name: 'privacyExplainAgain',
      desc: '',
      args: [appName],
    );
  }

  /// `Exit App`
  String get exitApp {
    return Intl.message(
      'Exit App',
      name: 'exitApp',
      desc: '',
      args: [],
    );
  }

  /// `《{appName} privacy policy》`
  String privacyName(Object appName) {
    return Intl.message(
      '《$appName privacy policy》',
      name: 'privacyName',
      desc: '',
      args: [appName],
    );
  }

  /// `   Welcome to {appName}!`
  String welcome(Object appName) {
    return Intl.message(
      '   Welcome to $appName!',
      name: 'welcome',
      desc: '',
      args: [appName],
    );
  }

  /// `   We know the importance of personal information to you and thank you for your trust in us.`
  String get welcome1 {
    return Intl.message(
      '   We know the importance of personal information to you and thank you for your trust in us.',
      name: 'welcome1',
      desc: '',
      args: [],
    );
  }

  /// `   In order to better protect your rights and interests and comply with the relevant regulatory requirements, we will explain to you through `
  String get welcome2 {
    return Intl.message(
      '   In order to better protect your rights and interests and comply with the relevant regulatory requirements, we will explain to you through ',
      name: 'welcome2',
      desc: '',
      args: [],
    );
  }

  /// ` how we will collect, store, protect, use and provide your information to the outside world, and explain your rights.`
  String get welcome3 {
    return Intl.message(
      ' how we will collect, store, protect, use and provide your information to the outside world, and explain your rights.',
      name: 'welcome3',
      desc: '',
      args: [],
    );
  }

  /// `   For more details, please refer to`
  String get welcome4 {
    return Intl.message(
      '   For more details, please refer to',
      name: 'welcome4',
      desc: '',
      args: [],
    );
  }

  /// ` the full text.`
  String get welcome5 {
    return Intl.message(
      ' the full text.',
      name: 'welcome5',
      desc: '',
      args: [],
    );
  }

  /// `Privacy agreement agreed!`
  String get agreePrivacy {
    return Intl.message(
      'Privacy agreement agreed!',
      name: 'agreePrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `phoneNum`
  String get phoneNum {
    return Intl.message(
      'phoneNum',
      name: 'phoneNum',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get common_button_continue {
    return Intl.message(
      'Continue',
      name: 'common_button_continue',
      desc: '',
      args: [],
    );
  }

  /// `请求出错，这里可以设置个缺省页`
  String get erro_message {
    return Intl.message(
      '请求出错，这里可以设置个缺省页',
      name: 'erro_message',
      desc: '',
      args: [],
    );
  }

  /// `当前热搜词`
  String get home_search_name {
    return Intl.message(
      '当前热搜词',
      name: 'home_search_name',
      desc: '',
      args: [],
    );
  }

  /// `综合`
  String get store_comprehensive {
    return Intl.message(
      '综合',
      name: 'store_comprehensive',
      desc: '',
      args: [],
    );
  }

  /// `销量`
  String get store_sales_volume {
    return Intl.message(
      '销量',
      name: 'store_sales_volume',
      desc: '',
      args: [],
    );
  }

  /// `全部分类`
  String get store_classification {
    return Intl.message(
      '全部分类',
      name: 'store_classification',
      desc: '',
      args: [],
    );
  }

  /// `全部条件`
  String get store_conditions {
    return Intl.message(
      '全部条件',
      name: 'store_conditions',
      desc: '',
      args: [],
    );
  }

  /// `积分`
  String get integral {
    return Intl.message(
      '积分',
      name: 'integral',
      desc: '',
      args: [],
    );
  }

  /// `收藏`
  String get collection {
    return Intl.message(
      '收藏',
      name: 'collection',
      desc: '',
      args: [],
    );
  }

  /// `优惠码`
  String get discount_code {
    return Intl.message(
      '优惠码',
      name: 'discount_code',
      desc: '',
      args: [],
    );
  }

  /// `足迹`
  String get footprint {
    return Intl.message(
      '足迹',
      name: 'footprint',
      desc: '',
      args: [],
    );
  }

  /// `地址`
  String get address {
    return Intl.message(
      '地址',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `未发货`
  String get not_shipped {
    return Intl.message(
      '未发货',
      name: 'not_shipped',
      desc: '',
      args: [],
    );
  }

  /// `已发货`
  String get shipped {
    return Intl.message(
      '已发货',
      name: 'shipped',
      desc: '',
      args: [],
    );
  }

  /// `配送中`
  String get distribution {
    return Intl.message(
      '配送中',
      name: 'distribution',
      desc: '',
      args: [],
    );
  }

  /// `已收货`
  String get received {
    return Intl.message(
      '已收货',
      name: 'received',
      desc: '',
      args: [],
    );
  }

  /// `新品`
  String get home_new_products {
    return Intl.message(
      '新品',
      name: 'home_new_products',
      desc: '',
      args: [],
    );
  }

  /// `价格升序`
  String get price_news_asc {
    return Intl.message(
      '价格升序',
      name: 'price_news_asc',
      desc: '',
      args: [],
    );
  }

  /// `价格降序`
  String get price_news_desc {
    return Intl.message(
      '价格降序',
      name: 'price_news_desc',
      desc: '',
      args: [],
    );
  }

  /// `最高人气`
  String get best_high {
    return Intl.message(
      '最高人气',
      name: 'best_high',
      desc: '',
      args: [],
    );
  }

  /// `全部`
  String get mine_page_all {
    return Intl.message(
      '全部',
      name: 'mine_page_all',
      desc: '',
      args: [],
    );
  }

  /// `待付款`
  String get mine_page_to_be_paid {
    return Intl.message(
      '待付款',
      name: 'mine_page_to_be_paid',
      desc: '',
      args: [],
    );
  }

  /// `等待付款`
  String get mine_common_wait_paid {
    return Intl.message(
      '等待付款',
      name: 'mine_common_wait_paid',
      desc: '',
      args: [],
    );
  }

  /// `待收货`
  String get mine_page_to_be_received {
    return Intl.message(
      '待收货',
      name: 'mine_page_to_be_received',
      desc: '',
      args: [],
    );
  }

  /// `等待收货`
  String get mine_common_wait_received {
    return Intl.message(
      '等待收货',
      name: 'mine_common_wait_received',
      desc: '',
      args: [],
    );
  }

  /// `已完成`
  String get mine_page_completed {
    return Intl.message(
      '已完成',
      name: 'mine_page_completed',
      desc: '',
      args: [],
    );
  }

  /// `已取消`
  String get mine_page_canclled {
    return Intl.message(
      '已取消',
      name: 'mine_page_canclled',
      desc: '',
      args: [],
    );
  }

  /// `订单号:`
  String get mine_page_order_sn {
    return Intl.message(
      '订单号:',
      name: 'mine_page_order_sn',
      desc: '',
      args: [],
    );
  }

  /// `购物车`
  String get cart_title {
    return Intl.message(
      '购物车',
      name: 'cart_title',
      desc: '',
      args: [],
    );
  }

  /// `管理`
  String get charge_title {
    return Intl.message(
      '管理',
      name: 'charge_title',
      desc: '',
      args: [],
    );
  }

  /// `促销`
  String get mine_promotion {
    return Intl.message(
      '促销',
      name: 'mine_promotion',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

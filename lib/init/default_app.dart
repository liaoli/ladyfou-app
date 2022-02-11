import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/core/common/global.dart';
import 'package:ladyfou/core/http/http.dart';
import 'package:ladyfou/core/utils/locale.dart';
import 'package:ladyfou/core/utils/toast.dart';
import 'package:ladyfou/generated/l10n.dart';
import 'package:ladyfou/page/index.dart';
import 'package:ladyfou/router/route_map.dart';
import 'package:ladyfou/utils/provider.dart';
import 'package:ladyfou/utils/sputils.dart';
import 'package:provider/provider.dart';

//默认App的启动
class DefaultApp {
  //运行app
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    initFirst().then((value) => runApp(Store.init(ToastUtils.init(MyApp()))));
    initApp();
  }

  /// 必须要优先初始化的内容
  static Future<void> initFirst() async {
    await SPUtils.init();
    await LocaleUtils.init();
    await Global.init();
  }

  /// 程序初始化操作
  static void initApp() {
    XHttp.init();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteMap.getPages.insert(0, GetPage(name: '/', page: () => MainHomePage()));
    // if (SPUtils.isLogined()) {
    //
    // } else {
    //   RouteMap.getPages.insert(0, GetPage(name: '/', page: () => GuidePage()));
    // }

    return Consumer2<AppTheme, LocaleModel>(
      builder: (context, appTheme, localeModel, _) {
        return ScreenUtilInit(
          designSize: Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: () => GetMaterialApp(
            useInheritedMediaQuery: false,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Project',
            theme: ThemeData(
              highlightColor: Colors.transparent,
              brightness: appTheme.brightness,
              primarySwatch: appTheme.themeColor,
              buttonColor: appTheme.themeColor,
            ),
            //注册路由
            getPages: RouteMap.getPages,
            defaultTransition: Transition.rightToLeft,
            locale: localeModel.getLocale(),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback:
                (Locale? _locale, Iterable<Locale> supportedLocales) {
              if (localeModel.getLocale() != null) {
                //如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                //跟随系统
                Locale systemLocale = LocaleUtils.getSystemLocale();
                // if (S.delegate.isSupported(systemLocale)) {
                if (S.delegate.isSupported(systemLocale)) {
                  return systemLocale;
                }
                return supportedLocales.first;
              }
            },
          ),
        );
      },
    );
  }
}

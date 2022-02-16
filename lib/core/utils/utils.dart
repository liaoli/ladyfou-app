
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:ladyfou/core/http/http.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import 'toast.dart';

///常用工具类
class Utils {
  Utils._internal();

  //=============url_launcher==================//

  ///处理链接
  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ToastUtils.error("暂不能处理这条链接:$url");
    }
  }

  // 处理url
  static String url(String url) {
    if (url == null || url.length == 0 || url.isEmpty) {
      return "";
    }
    if (url.contains('http://')) {
      return url;
    }
    if (url.contains('https://')) {
      return url;
    }
    if (url.contains('ftp://')) {
      return url;
    }
    if (url.contains("file://")) {
      return url;
    }
    if (url.substring(0, 4).contains('www.')) {
      return 'http:' + url;
    }
    if (url.contains("//")) {
      return 'http:' + url;
    }
    return baseUrl + url;
    return 'http:' + url;
  }


  //=============package_info==================//

  ///获取应用包信息
  static Future<PackageInfo> getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  ///获取应用包信息
  static Future<Map<String, dynamic>> getPackageInfoMap() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return <String, dynamic>{
      'appName': packageInfo.appName,
      'packageName': packageInfo.packageName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
    };
  }

  //=============date_format==================//

  static String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  static String formatDateTime(DateTime dateTime) =>
      formatDate(dateTime, [yyyy, '-', mm, '-', dd]);

  static String formateDateTimeInt(String dateTime){

    print(dateTime);
    var strtime =
    DateTime.fromMillisecondsSinceEpoch(int.parse(dateTime) * 1000);//将拿到的时间戳转化为日期
    print( strtime );
    var sdatetime = strtime.toLocal().toString().substring(0, 10);
    return sdatetime;
  }

  //=============常用方法==================//
  /// 每隔三位加逗号分隔
  static String formatStepCount(double num) {
    String priceStr = num.toStringAsFixed(2);
    if (num >= 1000) {
      var format = NumberFormat('0,000');
      return format.format(num);
    }
    return priceStr;
  }

}

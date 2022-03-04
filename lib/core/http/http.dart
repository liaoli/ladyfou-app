import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:ladyfou/core/common/global.dart';

import 'package:ladyfou/core/utils/path.dart';
import 'dart:io';

import 'package:ladyfou/utils/sputils.dart';

import 'base_url.dart';



class XHttp {
  XHttp._internal();

  ///网络请求配置
  static final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    sendTimeout: 5000,
    receiveTimeout: 5000,
    headers: {
      //   //预设好的header信息
      // "token": SPUtils.getToken(),
      //   "Content-Type": "multipart/form-data",
    },
  ));

  ///初始化dio
  static void init() {
    ///初始化cookie
    PathUtils.getDocumentsDirPath().then((value) {
      var cookieJar =
          PersistCookieJar(storage: FileStorage(value + "/.cookies/"));
      dio.interceptors.add(CookieManager(cookieJar));
    });

    //添加拦截器
    dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true)); //开启请求日志
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      options.headers["token"] = Global.tokenInfo.token;

      print("请求之前");
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      print("响应之前");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      print("错误之前");
      handleError(e);
      return handler.next(e);
    }));
  }

  ///error统一处理
  static void handleError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        print("连接超时");
        break;
      case DioErrorType.sendTimeout:
        print("请求超时");
        break;
      case DioErrorType.receiveTimeout:
        print("响应超时");
        break;
      case DioErrorType.response:
        print("出现异常");
        break;
      case DioErrorType.cancel:
        print("请求取消");
        break;
      default:
        print("未知错误");
        break;
    }
  }

  ///get请求
  static Future get(String url, [Map<String, dynamic>? params]) async {
    print("请求接口：${url}\n上送参数：${params}");
    Response response;
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  ///post 表单请求
  static Future post(String url, [Map<String, dynamic>? params]) async {
    print("请求接口：${url}\n上送参数：${params}");
    FormData data = FormData.fromMap(params!);
    Response response = await dio.post(url, data: data);
    return response.data;
  }

  ///post body请求
  static Future postJson(String url, [Map<String, dynamic>? data]) async {
    Response response = await dio.post(url, data: data);
    return response.data;
  }

  ///上传图片
  static Future upImage(String url, File image, String fileName) async {
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);

    FormData formData = FormData.fromMap({
      "fileData": await MultipartFile.fromFile(path, filename: fileName),
    });

    Response response = await dio.post(url, data: formData);
    print(response.data);
    return response.data;
  }

  ///下载文件
// static Future downloadFile(urlPath, savePath) async {
//   Response response;
//   try {
//     response = await dio.download(urlPath, savePath,
//         onReceiveProgress: (int count, int total) {
//       //进度
//       print("$count $total");
//     });
//   } on DioError catch (e) {
//     handleError(e);
//   }
//   return response.data;
// }
}

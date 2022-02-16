import 'package:flutter/cupertino.dart';
import 'package:ladyfou/core/model/sort_model.dart';

import '../model/good_info_model.dart';
import '../model/user_info_model.dart';

class MyResponse<T> {
  MyResponse({
    required this.common,
    required this.response,
  });

  Common common;
  Response<T>? response;

  factory MyResponse.fromJson(Map<String, dynamic> json) => MyResponse(
    common: Common.fromJson(json["common"]),
    response: Response<T>.fromJson(json['response']),
  );
}

T fromJson<T>(dynamic json) {
  debugPrint("====>${T.toString()}");
  switch (T.toString()) {
    case "UserInfoModel":
      return UserInfoModel.fromMap(json) as T;
    case "List<SortModel>":
      return SortModel.fromList(json) as T;
    case "List<GoodsInfoModel>":
      return GoodsInfoModel.fromList(json) as T;
    default:
      return [] as T;
  }
}


class Response<T> {
  Response({
    required this.data,
  });

  T? data;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    data: json["data"] == null ? null : fromJson<T>(json['data']),
  );
}

class Common {
  Common({
    this.statusCode = 0,
    this.debugMessage = '',
    this.releaseMessage = '',
    this.domain = '',
    this.currencySymbol = '',
    this.encryptionEnabled = false,
    this.currentTimeStamp = 0,
    required this.pageEnabled,
  });

  int statusCode;
  String debugMessage;
  String releaseMessage;
  String domain;
  String currencySymbol;
  bool encryptionEnabled;
  int currentTimeStamp;
  PageEnabled pageEnabled;

  factory Common.fromJson(Map<String, dynamic> json) => Common(
    statusCode: json["statusCode"],
    debugMessage: json["debugMessage"],
    releaseMessage: json["releaseMessage"],
    domain: json["domain"],
    currencySymbol: json["currencySymbol"],
    encryptionEnabled: json["encryptionEnabled"],
    currentTimeStamp: json["currentTimeStamp"],
    pageEnabled: PageEnabled.fromJson(json["pageEnabled"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "debugMessage": debugMessage,
    "releaseMessage": releaseMessage,
    "domain": domain,
    "currencySymbol": currencySymbol,
    "encryptionEnabled": encryptionEnabled,
    "currentTimeStamp": currentTimeStamp,
    "pageEnabled": pageEnabled.toJson(),
  };

}

class PageEnabled {
  PageEnabled({
    this.pageEnabled = false,
    this.currentPage = 0,
    this.totalPage = 0,
    this.pageSize = 0,
  });

  bool pageEnabled;
  int currentPage;
  int totalPage;
  int pageSize;

  factory PageEnabled.fromJson(Map<String, dynamic> json) => PageEnabled(
    pageEnabled: json["pageEnabled"] == null ? false : json["pageEnabled"],
    currentPage: json["currentPage"] == null ? 0 : json["currentPage"],
    totalPage: json["totalPage"] == null ? 0 : json["totalPage"],
    pageSize: json["pageSize"] == null ? 0 : json["pageSize"],
  );

  Map<String, dynamic> toJson() => {
    "pageEnabled": pageEnabled,
    "currentPage": currentPage,
    "totalPage": totalPage,
    "pageSize": pageSize,
  };
}



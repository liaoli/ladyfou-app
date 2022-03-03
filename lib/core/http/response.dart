import 'package:flutter/cupertino.dart';
import 'package:ladyfou/core/model/sort_model.dart';
import 'package:ladyfou/page/cart/model/cart_model.dart';

import '../model/category_info_model.dart';
import '../model/city_list_model.dart';
import '../model/country_list_model.dart';
import '../model/county_list_model.dart';
import '../model/daily_new_product_list_model.dart';
import '../model/good_collection_model.dart';
import '../model/good_info_model.dart';
import '../model/home_data_list_model.dart';
import '../model/province_list_model.dart';
import '../model/token_info_model.dart';
import '../model/order_info_model.dart';
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
    case "DailyNewProductListModel":
      return DailyNewProductListModel.fromMap(json) as T;
    case "CountryListModel":
      return CountryListModel.fromMap(json) as T;
    case "ProvinceListModel":
      return ProvinceListModel.fromMap(json) as T;
    case "CityListModel":
      return CityListModel.fromMap(json) as T;
    case "CountyListModel":
      return CountyListModel.fromMap(json) as T;
    case "HomeDataListModel":
      return HomeDataListModel.fromMap(json) as T;
    case "TokenInfoModel":
      return TokenInfoModel.fromMap(json) as T;
    case "List<SortModel>":
      return SortModel.fromList(json) as T;
    case "List<GoodsInfoModel>":
      return GoodsInfoModel.fromList(json) as T;
    case "List<CategoryInfoModel>":
      return CategoryInfoModel.fromList(json) as T;
    case "List<OrderInfoModel>":
      return OrderInfoModel.fromList(json) as T;
    case "CollectionInfoModel":
      return CollectionInfoModel.fromJson(json) as T;
    case "CartModel":
      CartModel cartModel = CartModel.fromJson(json);
      return cartModel as T;
    case "List<OptionsSizeReq>":
    return OptionsSizeReq.fromToList(json) as T;
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
        currentPage: json["currentPage"] == null
            ? 0
            : int.parse(json["currentPage"].toString()),
        totalPage: json["totalPage"] == null
            ? 0
            : int.parse(json["totalPage"].toString()),
        pageSize: json["pageSize"] == null
            ? 0
            : int.parse(json["pageSize"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "pageEnabled": pageEnabled,
        "currentPage": currentPage,
        "totalPage": totalPage,
        "pageSize": pageSize,
      };

  bool hasMore() {
    return currentPage < totalPage;
  }
}

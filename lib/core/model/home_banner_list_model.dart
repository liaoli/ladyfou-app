// To parse this JSON data, do
//
//     final homeBannerListModel = homeBannerListModelFromMap(jsonString);

import 'dart:convert';

import '../http/base_url.dart';

class HomeBannerListModel {
  HomeBannerListModel({
    required this.items,
    this.isScrolling = 0,
  });

  List<BannerModel> items;
  int isScrolling;

  factory HomeBannerListModel.fromJson(String str) =>
      HomeBannerListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeBannerListModel.fromMap(Map<String, dynamic> json) =>
      HomeBannerListModel(
        items: json["items"] == null
            ? []
            : List<BannerModel>.from(
                json["items"].map((x) => BannerModel.fromMap(x))),
        isScrolling: json["is_scrolling"]??0,
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "is_scrolling": isScrolling,
      };
}

class BannerModel {
  BannerModel({
    this.name = "",
    this.link = "",
    this.imgUrl = "",
  });

  String name;
  String link;
  String imgUrl;

  factory BannerModel.fromJson(String str) =>
      BannerModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerModel.fromMap(Map<String, dynamic> json) => BannerModel(
        name: json["name"] ?? "",
        link: json["link"] ?? "",
        imgUrl: json["imgUrl"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "link": link,
        "imgUrl": imgUrl,
      };
  String getImgRealUrl() {
    return baseUrl + imgUrl;
  }
}

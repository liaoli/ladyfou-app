/*
 * @Descripttion: TODO
 * @FileName: good_collection_model
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/23/22 11:34 AM
 * @LastEditors: tang
 */

import 'dart:convert';

import 'good_info_model.dart';

class CollectionInfoModel {
  CollectionInfoModel({
    this.wishedList = const [],
    this.categoryList = const [],
  });

  List<GoodsInfoModel> wishedList;
  // List<GoodCollectionModel> wishedList;
  List<CategoryListItem> categoryList;

  factory CollectionInfoModel.fromJson(Map<String, dynamic> json) =>
      CollectionInfoModel(
        wishedList: json["wish_list"] == null
            ? const []
            : GoodsInfoModel.fromList(json["wish_list"]),
        categoryList: json["category_list"] == null
            ? const []
            : CategoryListItem.fromList(json["category_list"]),
      );

  Map<String, dynamic> toJson() => {
        "wish_list": wishedList == null
            ? const []
            : List<dynamic>.from(wishedList.map((x) => x)),
        "category_list": categoryList == null
            ? const []
            : List<dynamic>.from(categoryList.map((x) => x)),
      };
}

class GoodCollectionModel {
  GoodCollectionModel({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.listPrice = 0,
    this.price = 0,
    this.amount = 0,
    this.maxQty = 0,
    this.saled = 0,
    this.rating = 0,
    this.createdAt = '',
    this.srcPrice = '',
    this.promotionPrice = '',
    this.discount = '',
    this.url = '',
    this.point = 0,
    this.tags = const [],
    this.fThumb = '',
    this.isRestrictedBlessingBag = 0,
    this.featureImage = const [],
    this.cids = const [],
    this.isLuckyBag = 0,
  });

  int id;
  String name;
  String status;
  int listPrice;
  int price;
  int amount;
  int maxQty;
  int saled;
  int rating;
  String createdAt;
  String srcPrice;
  String promotionPrice;
  String discount;
  String url;
  int point;
  List<dynamic> tags;
  String fThumb;
  int isRestrictedBlessingBag;
  List<dynamic> featureImage;
  List<int> cids;
  int isLuckyBag;

  static List<GoodCollectionModel> fromList(List json) {
    List<GoodCollectionModel> lists = [];
    json.forEach((element) {
      if (element is Map<String, dynamic>) {
        lists.add(GoodCollectionModel.fromJson(element));
      }
    });
    return lists;
  }

  factory GoodCollectionModel.fromJson(Map<String, dynamic> json) =>
      GoodCollectionModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        listPrice: json["list_price"],
        price: json["price"],
        amount: json["amount"],
        maxQty: json["max_qty"],
        saled: json["saled"],
        rating: json["rating"],
        createdAt: json["created_at"].toString(),
        srcPrice: json["src_price"].toString(),
        promotionPrice: json["promotion_price"].toString(),
        discount: json["discount"],
        url: json["url"],
        point: json["point"],
        tags: json["tags"] == null
            ? const []
            : List<dynamic>.from(json["tags"].map((x) => x)),
        fThumb: json["f_thumb"],
        isRestrictedBlessingBag: json["is_restricted_blessing_bag"],
        featureImage: json["feature_image"] == null
            ? const []
            : List<dynamic>.from(json["feature_image"].map((x) => x)),
        cids: json["cids"] == null
            ? const []
            : List<int>.from(json["cids"].map((x) => x)),
        isLuckyBag: json["is_lucky_bag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "list_price": listPrice,
        "price": price,
        "amount": amount,
        "max_qty": maxQty,
        "saled": saled,
        "rating": rating,
        "created_at": createdAt.toString(),
        "src_price": srcPrice,
        "promotion_price": promotionPrice,
        "discount": discount,
        "url": url,
        "point": point,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "f_thumb": fThumb,
        "is_restricted_blessing_bag": isRestrictedBlessingBag,
        "feature_image": List<dynamic>.from(featureImage.map((x) => x)),
        "cids": List<dynamic>.from(cids.map((x) => x)),
        "is_lucky_bag": isLuckyBag,
      };
}

class CategoryListItem {
  CategoryListItem({this.cid = 0, this.name = '', this.name2 = ''});

  int cid;
  String name;
  String name2;

  static List<CategoryListItem> fromList(List json) {
    List<CategoryListItem> lists = [];
    json.forEach((element) {
      if (element is Map<String, dynamic>) {
        lists.add(CategoryListItem.fromJson(element));
      }
    });
    return lists;
  }

  factory CategoryListItem.fromJson(Map<String, dynamic> json) =>
      CategoryListItem(
        cid: json["cid"],
        name: json["name"],
        name2: json["name2"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "name": name,
        "name2": name2,
      };
}

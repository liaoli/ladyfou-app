/*
 * @Descripttion: TODO
 * @FileName: good_collection_model
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/23/22 11:34 AM
 * @LastEditors: tang
 */

import 'dart:convert';

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
    this.tags =  const [],
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

  factory GoodCollectionModel.fromJson(Map<String, dynamic> json) => GoodCollectionModel(
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
    tags: json["tags"] == null ? const [] : List<dynamic>.from(json["tags"].map((x) => x)),
    fThumb: json["f_thumb"],
    isRestrictedBlessingBag: json["is_restricted_blessing_bag"],
    featureImage: json["feature_image"] == null ? const [] : List<dynamic>.from(json["feature_image"].map((x) => x)),
    cids: json["cids"] == null ? const [] : List<int>.from(json["cids"].map((x) => x)),
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

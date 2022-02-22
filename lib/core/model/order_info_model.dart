/*
 * @Descripttion: TODO
 * @FileName: order_info_model
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/21/22 3:25 PM
 * @LastEditors: tang
 */

// To parse this JSON data, do
//
//     final orderInfoModel = orderInfoModelFromJson(jsonString);

import 'dart:convert';

class OrderInfoModel {
  OrderInfoModel({
    this.id = 0,
    this.paymentMethod = 0,
    this.sn = '',
    this.totalPrice = '',
    this.createdAt = '',
    this.code = '',
    this.reviewsCount = 0,
    this.product = const [],
  });

  int id;
  int paymentMethod;
  String sn;
  String totalPrice;
  String createdAt;
  String code;
  int reviewsCount;
  List<Product> product;

  static List<OrderInfoModel> fromList(List json) {
    List<OrderInfoModel> lists = [];
    json.forEach((element) {
      if (element is Map<String, dynamic>) {
        lists.add(OrderInfoModel.fromJson(element));
      }
    });
    return lists;
  }

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) => OrderInfoModel(
        id: json["id"],
        paymentMethod: json["payment_method"],
        sn: json["sn"],
        totalPrice: json["total_price"],
        createdAt: json["created_at"].toString(),
        code: json["code"],
        reviewsCount: json["reviews_count"],
        product: json["product"] == null
            ? const []
            : List<Product>.from(
                json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_method": paymentMethod,
        "sn": sn,
        "total_price": totalPrice,
        "created_at": createdAt.toString(),
        "code": code,
        "reviews_count": reviewsCount,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productId = 0,
    this.name = '',
    this.price = '',
    this.qty = 0,
    this.options = const {},
    this.plSku = '',
    this.fThumb = '',
    this.optionsInfo = const [],
    this.listPrice = 0,
    this.defaultSku = const {},
    this.isLuckyBag = 0,
  });

  int productId;
  String name;
  String price;
  int qty;
  Map<String, List<String>> options;
  String plSku;
  String fThumb;
  List<Option> optionsInfo;
  int listPrice;
  Map<String, Map<String, String>> defaultSku;
  int isLuckyBag;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        name: json["name"],
        price: json["price"],
        qty: json["qty"],
        options: const {},
        // options: json["options"] == null
        //     ? const {}
        //     : Map.from(json["options"]).map((k, v) =>
        //         MapEntry<String, List<String>>(
        //             k, List<String>.from(v.map((x) => x)))),
        plSku: json["pl_sku"].toString(),
        fThumb: json["f_thumb"],
        optionsInfo: json["options_info"] == null
            ? const []
            : List<Option>.from(
                json["options_info"].map((x) => Option.fromJson(x))),
        listPrice: json["list_price"],
        defaultSku: const {},
        // defaultSku: json["default_sku"] == null
        //     ? const {}
        //     : Map.from(json["default_sku"]).map((k, v) =>
        //         MapEntry<String, Map<String, String>>(k,
        //             Map.from(v).map((k, v) => MapEntry<String, String>(k, v)))),
        isLuckyBag: json["is_lucky_bag"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "price": price,
        "qty": qty,
        "options": Map.from(options).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "pl_sku": plSku,
        "f_thumb": fThumb,
        "options_info": List<dynamic>.from(optionsInfo.map((x) => x.toJson())),
        "list_price": listPrice,
        "default_sku": Map.from(defaultSku).map((k, v) =>
            MapEntry<String, dynamic>(
                k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "is_lucky_bag": isLuckyBag,
      };
}

class Option {
  Option({
    this.id = 0,
    this.name = '',
    this.name2 = '',
    this.optionValues = const [],
  });

  int id;
  String name;
  String name2;
  List<Option> optionValues;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        name: json["name"],
        name2: json["name2"],
        optionValues: json["option_values"] == null
            ? const []
            : List<Option>.from(
                json["option_values"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name2": name2,
        "option_values": optionValues == null
            ? const []
            : List<dynamic>.from(optionValues.map((x) => x.toJson())),
      };
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CartModel welcomeFromJson(String str) => CartModel.fromJson(json.decode(str));

String welcomeToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.products,
    required this.cartInfo,
    required this.text,
    required this.luckyBag,
  });

  List<Product> products;
  CartInfo cartInfo;
  List<TextModel> text;
  List<dynamic> luckyBag;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        cartInfo: CartInfo.fromJson(json["cart_info"]),
        text: List<TextModel>.from(
            json["text"].map((x) => TextModel.fromJson(x))),
        luckyBag: List<dynamic>.from(json["lucky_bag"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "cart_info": cartInfo.toJson(),
        "text": List<dynamic>.from(text.map((x) => x.toJson())),
        "lucky_bag": List<dynamic>.from(luckyBag.map((x) => x)),
      };
}

class CartInfo {
  CartInfo({
    this.id = 0,
    this.uid = 0,
    this.totalQty = 0,
    this.sumProductPrice = '',
    this.sumProductPriceWithDiscount = '',
    this.freight = '',
    this.freeFreight = 0,
    this.totalPrice = '',
    this.sumRewardPoint = 0,
    this.sumAllowRewardPoint = 0,
    this.userSumActiveRewardPoints = 0,
    this.points = '',
    this.coupon = '',
    this.promoAmount = '',
  });

  int id;
  int uid;
  int totalQty;
  String sumProductPrice;
  String sumProductPriceWithDiscount;
  String freight;
  int freeFreight;
  String totalPrice;
  int sumRewardPoint;
  int sumAllowRewardPoint;
  int userSumActiveRewardPoints;
  String points;
  String coupon;
  String promoAmount;

  factory CartInfo.fromJson(Map<String, dynamic> json) => CartInfo(
        id: json["id"],
        uid: json["uid"],
        totalQty: json["totalQty"],
        sumProductPrice: json["sumProductPrice"],
        sumProductPriceWithDiscount: json["sumProductPriceWithDiscount"],
        freight: json["freight"],
        freeFreight: json["freeFreight"],
        totalPrice: json["totalPrice"],
        sumRewardPoint: json["sumRewardPoint"],
        sumAllowRewardPoint: json["sumAllowRewardPoint"],
        userSumActiveRewardPoints: json["user_sumActiveRewardPoints"],
        points: json["points"],
        coupon: json["coupon"],
        promoAmount: json["promoAmount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "totalQty": totalQty,
        "sumProductPrice": sumProductPrice,
        "sumProductPriceWithDiscount": sumProductPriceWithDiscount,
        "freight": freight,
        "freeFreight": freeFreight,
        "totalPrice": totalPrice,
        "sumRewardPoint": sumRewardPoint,
        "sumAllowRewardPoint": sumAllowRewardPoint,
        "user_sumActiveRewardPoints": userSumActiveRewardPoints,
        "points": points,
        "coupon": coupon,
        "promoAmount": promoAmount,
      };
}

class Product {
  Product({
    this.productId = 0,
    this.qty = 0,
    this.options = const [],
    this.price = '',
    this.id = 0,
    this.title = '',
    this.amount = 0,
    this.maxQty = 0,
    this.discount = '',
    this.cartId = 0,
    this.fThumb = '',
    this.isLuckyBag = 0,
    this.status = '',
    this.listPrice = 0,
    this.saled = 0,
    this.point = '',
    this.cids = const [],
    this.featureImage = const [],
    this.isWished = 0,
  });

  int productId;
  int qty;
  List<Option> options;
  String price;
  int id;
  String title;
  int amount;
  int maxQty;
  String discount;
  int cartId;
  String fThumb;
  int isLuckyBag;
  String status;
  int listPrice;
  int saled;
  String point;
  List<int> cids;
  List<FeatureImage> featureImage;
  int isWished;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        qty: json["qty"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        price: json["price"],
        id: json["id"],
        title: json["title"],
        amount: json["amount"],
        maxQty: json["max_qty"],
        discount: json["discount"],
        cartId: json["cart_id"],
        fThumb: json["f_thumb"],
        isLuckyBag: json["is_lucky_bag"],
        status: json["status"],
        listPrice: json["list_price"],
        saled: json["saled"],
        point: json["point"],
        cids: List<int>.from(json["cids"].map((x) => x)),
        featureImage: List<FeatureImage>.from(
            json["feature_image"].map((x) => FeatureImage.fromJson(x))),
        isWished: json["is_wished"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "qty": qty,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "price": price,
        "id": id,
        "title": title,
        "amount": amount,
        "max_qty": maxQty,
        "discount": discount,
        "cart_id": cartId,
        "f_thumb": fThumb,
        "is_lucky_bag": isLuckyBag,
        "status": status,
        "list_price": listPrice,
        "saled": saled,
        "point": point,
        "cids": List<dynamic>.from(cids.map((x) => x)),
        "feature_image":
            List<dynamic>.from(featureImage.map((x) => x.toJson())),
        "is_wished": isWished,
      };
}

class FeatureImage {
  FeatureImage({
    this.path = '',
  });

  String path;

  factory FeatureImage.fromJson(Map<String, dynamic> json) => FeatureImage(
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
      };
}

class Option {
  Option({
    this.id = 0,
    this.name = '',
    this.value = const [],
  });

  int id;
  String name;
  List<Value> value;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        name: json["name"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    this.id = 0,
    this.name = '',
    this.name2 = '',
    this.priceVariate = '',
    this.variateValue = '',
    required this.thumb,
  });

  int id;
  String name;
  String name2;
  String priceVariate;
  String variateValue;
  ThumbModel thumb;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        name: json["name"],
        name2: json["name2"],
        priceVariate: json["price_variate"],
        variateValue: json["variate_value"],
        thumb: json["thumb"] == null
            ? ThumbModel()
            : ThumbModel.fromJson(json["thumb"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name2": name2,
        "price_variate": priceVariate,
        "variate_value": variateValue,
        "thumb": thumb == null ? null : thumb.toJson(),
      };
}

class ThumbModel {
  ThumbModel({
    this.id = 0,
    this.diskName = '',
    this.fileName = '',
    this.fileSize = 0,
    this.contentType = '',
    this.title = '',
    this.description = '',
    this.field = '',
    this.sortOrder = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.sceneId = 0,
    this.path = '',
    this.extension = '',
  });

  int id;
  String diskName;
  String fileName;
  int fileSize;
  String contentType;
  dynamic title;
  dynamic description;
  String field;
  int sortOrder;
  String createdAt;
  String updatedAt;
  int sceneId;
  String path;
  String extension;

  factory ThumbModel.fromJson(Map<String, dynamic> json) => ThumbModel(
        id: json["id"],
        diskName: json["disk_name"],
        fileName: json["file_name"],
        fileSize: json["file_size"],
        contentType: json["content_type"],
        title: json["title"],
        description: json["description"],
        field: json["field"],
        sortOrder: json["sort_order"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        sceneId: json["scene_id"],
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "disk_name": diskName,
        "file_name": fileName,
        "file_size": fileSize,
        "content_type": contentType,
        "title": title,
        "description": description,
        "field": field,
        "sort_order": sortOrder,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "scene_id": sceneId,
        "path": path,
        "extension": extension,
      };
}

class TextModel {
  TextModel({
    this.text = '',
    this.figure,
  });

  String text;
  dynamic figure;

  factory TextModel.fromJson(Map<String, dynamic> json) => TextModel(
        text: json["text"],
        figure: json["figure"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "figure": figure,
      };
}

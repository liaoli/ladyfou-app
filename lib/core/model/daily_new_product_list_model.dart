// To parse this JSON data, do
//
//     final dailyNewModel = dailyNewModelFromMap(jsonString);

import 'dart:convert';

class DailyNewProductListModel {
  DailyNewProductListModel({
    this.data = const [],
  });

  List<DailyNewProduct> data;

  factory DailyNewProductListModel.fromJson(String str) =>
      DailyNewProductListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyNewProductListModel.fromMap(dynamic json) =>
      DailyNewProductListModel(
        data: json == null
            ? []
            : List<DailyNewProduct>.from(
                json.map((x) => DailyNewProduct.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class DailyNewProduct {
  DailyNewProduct({
    this.id,
    this.name,
    this.name2,
    this.slug,
    this.status,
    this.listPrice,
    this.price,
    this.amount,
    this.weight,
    this.saled,
    this.popular,
    this.rating,
    this.sort,
    this.reviewsCount,
    this.createdAt,
    this.instockTime,
    this.isPresell,
    this.maxPrice,
    this.isStoreS3,
    this.srcPrice,
    this.promotionPrice,
    this.discount,
    this.url,
    this.fThumb,
    this.sThumb,
    this.feedThumb,
    this.facebookFeedThumb,
    this.facebookFeedThumbs,
    this.reviewsTotal,
    this.wishlistTotal,
    this.cids,
    this.featureImage,
    this.features,
    this.options,
    this.ratNum,
    this.sales,
    this.sku,
    this.stockpile,
    this.skuMinPrice,
    this.skuMaxPrice,
    this.tagIcons,
  });

  int? id;
  String? name;
  String? name2;
  String? slug;
  String? status;
  int? listPrice;
  int? price;
  int? amount;
  String? weight;
  int? saled;
  int? popular;
  double? rating;
  int? sort;
  int? reviewsCount;
  String? createdAt;
  String? instockTime;
  int? isPresell;
  String? maxPrice;
  int? isStoreS3;
  String? srcPrice;
  int? promotionPrice;
  String? discount;
  String? url;
  String? fThumb;
  String? sThumb;
  String? feedThumb;
  String? facebookFeedThumb;
  List<String>? facebookFeedThumbs;
  String? reviewsTotal;
  String? wishlistTotal;
  List<int>? cids;
  List<FeatureImage>? featureImage;
  List<Feature>? features;
  List<Option>? options;
  double? ratNum;
  String? sales;
  List<Sku>? sku;
  int? stockpile;
  int? skuMinPrice;
  int? skuMaxPrice;
  List<dynamic>? tagIcons;

  factory DailyNewProduct.fromJson(String str) =>
      DailyNewProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyNewProduct.fromMap(Map<String, dynamic> json) => DailyNewProduct(
        id: json["id"],
        name: json["name"],
        name2: json["name2"],
        slug: json["slug"],
        status: json["status"],
        listPrice: json["list_price"],
        price: json["price"],
        amount: json["amount"],
        weight: json["weight"],
        saled: json["saled"],
        popular: json["popular"],
        rating: parse2Double(json["rating"]),
        sort: json["sort"],
        reviewsCount: json["reviews_count"],
        createdAt: json["created_at"],
        instockTime: json["instock_time"],
        isPresell: json["is_presell"],
        maxPrice: json["max_price"],
        isStoreS3: json["is_store_s3"],
        srcPrice: json["src_price"],
        promotionPrice: json["promotion_price"],
        discount: json["discount"],
        url: json["url"],
        fThumb: json["f_thumb"],
        sThumb: json["s_thumb"],
        feedThumb: json["feed_thumb"],
        facebookFeedThumb: json["facebook_feed_thumb"],
        facebookFeedThumbs:
            List<String>.from(json["facebook_feed_thumbs"].map((x) => x)),
        reviewsTotal: json["reviews_total"],
        wishlistTotal: json["wishlist_total"],
        cids: json["cids"] == null
            ? []
            : List<int>.from(json["cids"].map((x) => x)),
        featureImage: json["feature_image"] == null
            ? []
            : List<FeatureImage>.from(
                json["feature_image"].map((x) => FeatureImage.fromMap(x))),
        features:
            List<Feature>.from(json["features"].map((x) => Feature.fromMap(x))),
        options: json["options"] == null
            ? []
            : List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
        ratNum: parse2Double(json["rat_num"]),
        sales: json["sales"].toString(),
        sku: json["sku"] == null
            ? []
            : List<Sku>.from(json["sku"].map((x) => Sku.fromMap(x))),
        stockpile: json["stockpile"],
        skuMinPrice: json["sku_min_price"],
        skuMaxPrice: json["sku_max_price"],
        tagIcons: List<dynamic>.from(json["tag_icons"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "name2": name2,
        "slug": slug,
        "status": status,
        "list_price": listPrice,
        "price": price,
        "amount": amount,
        "weight": weight,
        "saled": saled,
        "popular": popular,
        "rating": rating,
        "sort": sort,
        "reviews_count": reviewsCount,
        "created_at": createdAt,
        "instock_time": instockTime,
        "is_presell": isPresell,
        "max_price": maxPrice,
        "is_store_s3": isStoreS3,
        "src_price": srcPrice,
        "promotion_price": promotionPrice,
        "discount": discount,
        "url": url,
        "f_thumb": fThumb,
        "s_thumb": sThumb,
        "feed_thumb": feedThumb,
        "facebook_feed_thumb": facebookFeedThumb,
        "facebook_feed_thumbs":
            List<dynamic>.from(facebookFeedThumbs!.map((x) => x)),
        "reviews_total": reviewsTotal,
        "wishlist_total": wishlistTotal,
        "cids": cids == null ? null : List<dynamic>.from(cids!.map((x) => x)),
        "feature_image":
            List<dynamic>.from(featureImage!.map((x) => x.toMap())),
        "features": List<dynamic>.from(features!.map((x) => x.toMap())),
        "options": List<dynamic>.from(options!.map((x) => x.toMap())),
        "rat_num": ratNum,
        "sales": sales.toString(),
        "sku": List<dynamic>.from(sku!.map((x) => x.toMap())),
        "stockpile": stockpile,
        "sku_min_price": skuMinPrice,
        "sku_max_price": skuMaxPrice,
        "tag_icons": List<dynamic>.from(tagIcons!.map((x) => x)),
      };
}

class FeatureImage {
  FeatureImage({
    this.path = "",
  });

  String path;

  factory FeatureImage.fromJson(String str) =>
      FeatureImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeatureImage.fromMap(Map<String, dynamic> json) => FeatureImage(
        path: json["path"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
      };
}

class Feature {
  Feature({
    this.name = "",
    this.name2 = "",
    this.valueName = "",
  });

  String name;
  String name2;
  String valueName;

  factory Feature.fromJson(String str) => Feature.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Feature.fromMap(Map<String, dynamic> json) => Feature(
        name: json["name"],
        name2: json["name2"],
        valueName: json["value_name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "name2": name2,
        "value_name": valueName,
      };
}

class Option {
  Option({
    this.id = 0,
    this.name = "",
    this.name2 = "",
    this.sort = 0,
    this.type = "",
    this.values = const [],
  });

  int id;
  String name;
  String name2;
  int sort;
  String type;
  List<Value> values;

  factory Option.fromJson(String str) => Option.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Option.fromMap(Map<String, dynamic> json) => Option(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        name2: json["name2"] ?? "",
        sort: json["sort"] ?? 0,
        type: json["type"] ?? "",
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"].map((x) => Value.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "name2": name2,
        "sort": sort,
        "type": type,
        "values": List<dynamic>.from(values.map((x) => x.toMap())),
      };
}

class Value {
  Value({
    this.id = 0,
    this.optionId = 0,
    this.name = "",
    this.name2 = "",
    this.priceVariate = "",
    this.variateValue = "",
    this.hex = "",
    required this.thumb,
  });

  int id;
  int optionId;
  String name;
  String name2;
  String priceVariate;
  String variateValue;
  String hex;
  FeatureImage thumb;

  factory Value.fromJson(String str) => Value.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Value.fromMap(Map<String, dynamic> json) => Value(
        id: json["id"],
        optionId: json["option_id"],
        name: json["name"],
        name2: json["name2"],
        priceVariate: json["price_variate"],
        variateValue: json["variate_value"],
        hex: json["hex"],
        thumb: json["thumb"] == null
            ? FeatureImage()
            : FeatureImage.fromMap(json["thumb"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "option_id": optionId,
        "name": name,
        "name2": name2,
        "price_variate": priceVariate,
        "variate_value": variateValue,
        "hex": hex,
        "thumb": thumb == null ? null : thumb.toMap(),
      };
}

class Sku {
  Sku({
    this.id = 0,
    this.productId = 0,
    this.optionValues = "",
    this.sku = "",
    this.itemId = "",
    this.skuPrice = "",
    this.skuStatus = 0,
    this.skuListPrice = "",
    this.skuStock = 0,
    this.presell = 0,
    this.stockpileStatus = 0,
    this.storeStatus = 0,
  });

  int id;
  int productId;
  String optionValues;
  String sku;
  String itemId;
  String skuPrice;
  int skuStatus;
  String skuListPrice;
  int skuStock;
  int presell;
  int stockpileStatus;
  int storeStatus;

  factory Sku.fromJson(String str) => Sku.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sku.fromMap(Map<String, dynamic> json) => Sku(
        id: json["id"],
        productId: json["product_id"],
        optionValues: json["option_values"],
        sku: json["sku"],
        itemId: json["item_id"],
        skuPrice: json["sku_price"],
        skuStatus: json["sku_status"],
        skuListPrice: json["sku_list_price"],
        skuStock: json["sku_stock"] ?? 0,
        presell: json["presell"],
        stockpileStatus: json["stockpile_status"],
        storeStatus: json["store_status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product_id": productId,
        "option_values": optionValues,
        "sku": sku,
        "item_id": itemId,
        "sku_price": skuPrice,
        "sku_status": skuStatus,
        "sku_list_price": skuListPrice,
        "sku_stock": skuStock,
        "presell": presell,
        "stockpile_status": stockpileStatus,
        "store_status": storeStatus,
      };
}

double? parse2Double(dynamic value) {
  if (value is int) {
    return value.toDouble();
  }
  return value;
}

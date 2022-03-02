// To parse this JSON data, do
//
//     final homeDataListModel = homeDataListModelFromMap(jsonString);

import 'dart:convert';

class HomeDataListModel {
  HomeDataListModel({
    this.discountProductList = const [],
    this.newProductList = const[],
    this.likeProductList= const [],
  });

  List<DiscountProductList> discountProductList;
  List<ProductList> newProductList;
  List<ProductList> likeProductList;

  factory HomeDataListModel.fromJson(String str) => HomeDataListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeDataListModel.fromMap(Map<String, dynamic> json) => HomeDataListModel(
    discountProductList: json["discount_product_list"] == null ? []:List<DiscountProductList>.from(json["discount_product_list"].map((x) => DiscountProductList.fromMap(x))),
    newProductList: json["new_product_list"] == null ? []:List<ProductList>.from(json["new_product_list"].map((x) => ProductList.fromMap(x))),
    likeProductList:json["like_product_list"]== null ?[]: List<ProductList>.from(json["like_product_list"].map((x) => ProductList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "discount_product_list": List<dynamic>.from(discountProductList.map((x) => x.toMap())),
    "new_product_list": List<dynamic>.from(newProductList.map((x) => x.toMap())),
    "like_product_list": List<dynamic>.from(likeProductList.map((x) => x.toMap())),
  };
}

class DiscountProductList {
  DiscountProductList({
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
    this.isStoreS3,
    this.maxPrice,
    this.srcPrice,
    this.promotionPrice,
    this.url,
    this.fThumb,
    this.sThumb,
    this.feedThumb,
    this.facebookFeedThumb,
    this.reviewsTotal,
    this.wishlistTotal,
    this.discount,
    this.cids,
    this.options,
    this.ratNum,
    this.sales,
    this.sku,
    this.stockpile,
    this.presell,
    this.presellDiscount,
    this.skuMinPrice,
    this.skuMaxPrice,
    this.tagIcons,
  });

  int? id;
  String? name;
  String? name2;
  String? slug;
  String? status;
  String? listPrice;
  int? price;
  int? amount;
  String? weight;
  int? saled;
  int? popular;
  int? rating;
  int? sort;
  int? reviewsCount;
  String? createdAt;
  String? instockTime;
  int? isPresell;
  int? isStoreS3;
  String? maxPrice;
  String? srcPrice;
  String? promotionPrice;
  String? url;
  String? fThumb;
  String? sThumb;
  String? feedThumb;
  String? facebookFeedThumb;
  String? reviewsTotal;
  String? wishlistTotal;
  String? discount;
  List<int>? cids;
  List<Option>? options;
  double? ratNum;
  dynamic sales;
  List<Sku>? sku;
  int? stockpile;
  Presell? presell;
  String? presellDiscount;
  int? skuMinPrice;
  int? skuMaxPrice;
  List<dynamic>? tagIcons;

  factory DiscountProductList.fromJson(String str) => DiscountProductList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DiscountProductList.fromMap(Map<String, dynamic> json) => DiscountProductList(
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
    rating: json["rating"],
    sort: json["sort"],
    reviewsCount: json["reviews_count"],
    createdAt: json["created_at"],
    instockTime: json["instock_time"],
    isPresell: json["is_presell"],
    isStoreS3: json["is_store_s3"],
    maxPrice: json["max_price"],
    srcPrice: json["src_price"],
    promotionPrice: json["promotion_price"],
    url: json["url"],
    fThumb: json["f_thumb"],
    sThumb: json["s_thumb"],
    feedThumb: json["feed_thumb"],
    facebookFeedThumb: json["facebook_feed_thumb"],
    reviewsTotal: json["reviews_total"],
    wishlistTotal: json["wishlist_total"],
    discount: json["discount"] == null ? null : json["discount"],
    cids: List<int>.from(json["cids"].map((x) => x)),
    options: List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
    ratNum: json["rat_num"].toDouble(),
    sales: json["sales"],
    sku: List<Sku>.from(json["sku"].map((x) => Sku.fromMap(x))),
    stockpile: json["stockpile"],
    presell: Presell.fromMap(json["presell"]),
    presellDiscount: json["presell_discount"],
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
    "is_store_s3": isStoreS3,
    "max_price": maxPrice,
    "src_price": srcPrice,
    "promotion_price": promotionPrice,
    "url": url,
    "f_thumb": fThumb,
    "s_thumb": sThumb,
    "feed_thumb": feedThumb,
    "facebook_feed_thumb": facebookFeedThumb,
    "reviews_total": reviewsTotal,
    "wishlist_total": wishlistTotal,
    "discount": discount == null ? null : discount,
    "cids": List<dynamic>.from(cids!.map((x) => x)),
    "options": List<dynamic>.from(options!.map((x) => x.toMap())),
    "rat_num": ratNum,
    "sales": sales,
    "sku": List<dynamic>.from(sku!.map((x) => x.toMap())),
    "stockpile": stockpile,
    "presell": presell!.toMap(),
    "presell_discount": presellDiscount,
    "sku_min_price": skuMinPrice,
    "sku_max_price": skuMaxPrice,
    "tag_icons": List<dynamic>.from(tagIcons!.map((x) => x)),
  };
}

class Option {
  Option({
    this.id,
    this.name,
    this.name2,
    this.sort,
    this.type,
    this.values,
  });

  int? id;
  String? name;
  String? name2;
  int? sort;
  String? type;
  List<Value>? values;

  factory Option.fromJson(String str) => Option.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Option.fromMap(Map<String, dynamic> json) => Option(
    id: json["id"],
    name: json["name"],
    name2: json["name2"],
    sort: json["sort"],
    type: json["type"],
    values: List<Value>.from(json["values"].map((x) => Value.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "name2": name2,
    "sort": sort,
    "type": type,
    "values": List<dynamic>.from(values!.map((x) => x.toMap())),
  };
}










class Value {
  Value({
    this.id,
    this.optionId,
    this.name,
    this.name2,
    this.priceVariate,
    this.variateValue,
    this.hex,
    this.thumb,
  });

  int? id;
  int? optionId;
  String? name;
  String? name2;
  String? priceVariate;
  String? variateValue;
  String? hex;
  FeatureImage? thumb;

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
    thumb: json["thumb"] == null ? null : FeatureImage.fromMap(json["thumb"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "option_id": optionId,
    "name": name,
    "name2": name2,
    "price_variate": priceVariate,
    "variate_value": variateValue,
    "hex": hex,
    "thumb": thumb == null ? {} : thumb!.toMap(),
  };
}





class FeatureImage {
  FeatureImage({
    this.path = "",
  });

  String? path;

  factory FeatureImage.fromJson(String str) => FeatureImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeatureImage.fromMap(Map<String, dynamic> json) => FeatureImage(
    path: json["path"],
  );

  Map<String, dynamic> toMap() => {
    "path": path,
  };
}

class Presell {
  Presell({
    this.id,
    this.productId,
    this.startTime,
    this.endTime,
    this.presellCount,
  });

  int? id;
  int? productId;
  String? startTime;
  String? endTime;
  int? presellCount;

  factory Presell.fromJson(String str) => Presell.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Presell.fromMap(Map<String, dynamic> json) => Presell(
    id: json["id"],
    productId: json["product_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    presellCount: json["presell_count"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "start_time": startTime,
    "end_time": endTime,
    "presell_count": presellCount,
  };
}

class Sku {
  Sku({
    this.id,
    this.productId,
    this.optionValues,
    this.sku,
    this.itemId,
    this.skuPrice,
    this.skuStatus,
    this.skuListPrice,
    this.skuStock,
    this.presell,
    this.stockpileStatus,
    this.storeStatus,
  });

  int? id;
  int? productId;
  String? optionValues;
  String? sku;
  String? itemId;
  String? skuPrice;
  int? skuStatus;
  String? skuListPrice;
  int? skuStock;
  int? presell;
  int? stockpileStatus;
  int? storeStatus;

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
    skuStock: json["sku_stock"],
    presell: json["presell"],
    stockpileStatus: json["stockpile_status"],
    storeStatus: json["store_status"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "option_values": optionValues,
    "sku": sku == null ? null : sku,
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




class ProductList {
  ProductList({
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
    this.isStoreS3,
    this.maxPrice,
    this.srcPrice,
    this.promotionPrice,
    this.url,
    this.fThumb,
    this.sThumb,
    this.feedThumb,
    this.facebookFeedThumb,
    this.reviewsTotal,
    this.wishlistTotal,
    this.discount,
    this.cids,
    this.options,
    this.ratNum,
    this.sales,
    this.sku,
    this.stockpile,
    this.presell,
    this.presellDiscount,
    this.skuMinPrice,
    this.skuMaxPrice,
    this.tagIcons,
    this.features,
    this.facebookFeedThumbs,
    this.featureImage,
  });

  int? id;
  String? name;
  String? name2;
  String? slug;
  String? status;
  String? listPrice;
  int? price;
  int? amount;
  String? weight;
  int? saled;
  int? popular;
  int? rating;
  int? sort;
  int? reviewsCount;
  String? createdAt;
  String? instockTime;
  int? isPresell;
  int? isStoreS3;
  String? maxPrice;
  String? srcPrice;
  String? promotionPrice;
  String? url;
  String? fThumb;
  String? sThumb;
  String? feedThumb;
  String? facebookFeedThumb;
  String? reviewsTotal;
  String? wishlistTotal;
  String? discount;
  List<int>? cids;
  List<Option>? options;
  double? ratNum;
  dynamic sales;
  List<Sku>? sku;
  int? stockpile;
  Presell? presell;
  String? presellDiscount;
  int? skuMinPrice;
  int? skuMaxPrice;
  List<dynamic>? tagIcons;
  List<Feature?>? features;
  List<String>? facebookFeedThumbs;
  List<FeatureImage>? featureImage;

  factory ProductList.fromJson(String str) => ProductList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductList.fromMap(Map<String, dynamic> json) => ProductList(
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
    rating: json["rating"],
    sort: json["sort"],
    reviewsCount: json["reviews_count"],
    createdAt:json["created_at"],
    instockTime: json["instock_time"],
    isPresell: json["is_presell"],
    isStoreS3: json["is_store_s3"],
    maxPrice: json["max_price"],
    srcPrice: json["src_price"],
    promotionPrice: json["promotion_price"],
    url: json["url"],
    fThumb: json["f_thumb"],
    sThumb: json["s_thumb"],
    feedThumb: json["feed_thumb"],
    facebookFeedThumb: json["facebook_feed_thumb"],
    reviewsTotal: json["reviews_total"],
    wishlistTotal: json["wishlist_total"],
    discount: json["discount"] == null ? null : json["discount"],
    cids: List<int>.from(json["cids"].map((x) => x)),
    options: List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
    ratNum: json["rat_num"].toDouble(),
    sales: json["sales"],
    sku: List<Sku>.from(json["sku"].map((x) => Sku.fromMap(x))),
    stockpile: json["stockpile"],
    presell: Presell.fromMap(json["presell"]),
    presellDiscount: json["presell_discount"],
    skuMinPrice: json["sku_min_price"],
    skuMaxPrice: json["sku_max_price"],
    tagIcons: List<dynamic>.from(json["tag_icons"].map((x) => x)),
    features: json["features"] == null ? null : List<Feature>.from(json["features"].map((x) => Feature.fromMap(x))),
    facebookFeedThumbs: json["facebook_feed_thumbs"] == null ? null : List<String>.from(json["facebook_feed_thumbs"].map((x) => x)),
    featureImage: json["feature_image"] == null ? null : List<FeatureImage>.from(json["feature_image"].map((x) => FeatureImage.fromMap(x))),
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
    "is_store_s3": isStoreS3,
    "max_price": maxPrice,
    "src_price": srcPrice,
    "promotion_price": promotionPrice,
    "url": url,
    "f_thumb": fThumb,
    "s_thumb": sThumb,
    "feed_thumb": feedThumb,
    "facebook_feed_thumb": facebookFeedThumb,
    "reviews_total": reviewsTotal,
    "wishlist_total": wishlistTotal,
    "discount": discount == null ? null : discount,
    "cids": List<dynamic>.from(cids!.map((x) => x)),
    "options": List<dynamic>.from(options!.map((x) => x.toMap())),
    "rat_num": ratNum,
    "sales": sales,
    "sku": List<dynamic>.from(sku!.map((x) => x.toMap())),
    "stockpile": stockpile,
    "presell": presell!.toMap(),
    "presell_discount": presellDiscount,
    "sku_min_price": skuMinPrice,
    "sku_max_price": skuMaxPrice,
    "tag_icons": List<dynamic>.from(tagIcons!.map((x) => x)),
    "features": features == null ? null : List<dynamic>.from(features!.map((x) => x!.toMap())),
    "facebook_feed_thumbs": facebookFeedThumbs == null ? {} : List<dynamic>.from(facebookFeedThumbs!.map((x) => x)),
    "feature_image": featureImage == null ? {}
            : List<dynamic>.from(featureImage!.map((x) => x.toMap())),
  };
}

class Feature {
  Feature({
    this.name,
    this.name2,
    this.valueName,
  });

  String? name;
  String? name2;
  String? valueName;

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



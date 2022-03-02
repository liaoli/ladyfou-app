// To parse this JSON data, do
//
//     final homeDataListModel = homeDataListModelFromMap(jsonString);

import 'dart:convert';

class HomeDataListModel {
  HomeDataListModel({
    this.discountProductList = const [],
    this.newProductList = const [],
    this.likeProductList = const [],
  });

  List<ProductList> discountProductList;
  List<NewProductList> newProductList;
  List<ProductList> likeProductList;

  factory HomeDataListModel.fromJson(String str) =>
      HomeDataListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeDataListModel.fromMap(Map<String, dynamic> json) =>
      HomeDataListModel(
        discountProductList: json["discount_product_list"] == null
            ? []
            : List<ProductList>.from(json["discount_product_list"]
                .map((x) => ProductList.fromMap(x))),
        newProductList: json["new_product_list"] == null
            ? []
            : List<NewProductList>.from(
                json["new_product_list"].map((x) => NewProductList.fromMap(x))),
        likeProductList: json["like_product_list"] == null
            ? []
            : List<ProductList>.from(
                json["like_product_list"].map((x) => ProductList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "discount_product_list":
            List<dynamic>.from(discountProductList.map((x) => x.toMap())),
        "new_product_list":
            List<dynamic>.from(newProductList.map((x) => x.toMap())),
        "like_product_list":
            List<dynamic>.from(likeProductList.map((x) => x.toMap())),
      };
}

class ProductList {
  ProductList({
    this.id = 0,
    this.name = "",
    this.name2 = "",
    this.slug = "",
    this.status = "",
    this.listPrice = "",
    this.price = 0,
    this.amount = 0,
    this.weight = "",
    this.saled = 0,
    this.popular = 0,
    this.rating = 0,
    this.sort = 0,
    this.reviewsCount = 0,
    this.createdAt = "",
    this.instockTime = "",
    this.isPresell = 0,
    this.isStoreS3 = 0,
    this.maxPrice = "",
    this.srcPrice = "",
    this.promotionPrice = "",
    this.url = "",
    this.fThumb = "",
    this.sThumb = "",
    this.feedThumb = "",
    this.facebookFeedThumb = "",
    this.reviewsTotal = "",
    this.wishlistTotal = "",
    this.cids = const [],
    this.options = const [],
    this.ratNum = 0,
    this.sales = 0,
    this.sku = const [],
    this.stockpile = 0,
    required this.presell,
    this.presellDiscount = "",
    this.skuMinPrice = 0,
    this.skuMaxPrice = 0,
    this.tagIcons = const [],
  });

  int id;
  String name;
  String name2;
  String slug;
  String status;
  String listPrice;
  int price;
  int amount;
  String weight;
  int saled;
  int popular;
  int rating;
  int sort;
  int reviewsCount;
  String createdAt;
  String instockTime;
  int isPresell;
  int isStoreS3;
  String maxPrice;
  String srcPrice;
  String promotionPrice;
  String url;
  String fThumb;
  String sThumb;
  String feedThumb;
  String facebookFeedThumb;
  String reviewsTotal;
  String wishlistTotal;
  List<int> cids;
  List<Option> options;
  int ratNum;
  int sales;
  List<Sku> sku;
  int stockpile;
  Presell presell;
  String presellDiscount;
  int skuMinPrice;
  int skuMaxPrice;
  List<dynamic> tagIcons;

  factory ProductList.fromJson(String str) =>
      ProductList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductList.fromMap(Map<String, dynamic> json) => ProductList(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        name2: json["name2"] ?? "",
        slug: json["slug"] ?? "",
        status: json["status"] ?? "",
        listPrice: json["list_price"] ?? "",
        price: json["price"] ?? 0,
        amount: json["amount"] ?? 0,
        weight: json["weight"] ?? "",
        saled: json["saled"] ?? 0,
        popular: json["popular"] ?? 0,
        rating: json["rating"] ?? 0,
        sort: json["sort"] ?? 0,
        reviewsCount: json["reviews_count"] ?? 0,
        createdAt: json["created_at"] ?? "",
        instockTime: json["instock_time"] ?? "",
        isPresell: json["is_presell"] ?? 0,
        isStoreS3: json["is_store_s3"] ?? 0,
        maxPrice: json["max_price"] ?? "",
        srcPrice: json["src_price"] ?? "",
        promotionPrice: json["promotion_price"] ?? "",
        url: json["url"] ?? "",
        fThumb: json["f_thumb"] ?? "",
        sThumb: json["s_thumb"] ?? "",
        feedThumb: json["feed_thumb"] ?? "",
        facebookFeedThumb: json["facebook_feed_thumb"] ?? "",
        reviewsTotal: json["reviews_total"] ?? "",
        wishlistTotal: json["wishlist_total"] ?? "",
        cids: json["cids"] == null
            ? []
            : List<int>.from(json["cids"].map((x) => x)),
        options: json["options"] == null
            ? []
            : List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
        ratNum: json["rat_num"] ?? 0,
        sales: json["sales"] ?? 0,
        sku: json["sku"] == null
            ? []
            : List<Sku>.from(json["sku"].map((x) => Sku.fromMap(x))),
        stockpile: json["stockpile"] ?? 0,
        presell: json["presell"] == null
            ? Presell()
            : Presell.fromMap(json["presell"]),
        presellDiscount: json["presell_discount"] ?? "",
        skuMinPrice: json["sku_min_price"] ?? 0,
        skuMaxPrice: json["sku_max_price"] ?? 0,
        tagIcons: json["tag_icons"] == null
            ? []
            : List<dynamic>.from(json["tag_icons"].map((x) => x)),
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
        "cids": List<dynamic>.from(cids.map((x) => x)),
        "options": List<dynamic>.from(options.map((x) => x.toMap())),
        "rat_num": ratNum,
        "sales": sales,
        "sku": List<dynamic>.from(sku.map((x) => x.toMap())),
        "stockpile": stockpile,
        "presell": presell.toMap(),
        "presell_discount": presellDiscount,
        "sku_min_price": skuMinPrice,
        "sku_max_price": skuMaxPrice,
        "tag_icons": List<dynamic>.from(tagIcons.map((x) => x)),
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
        values: json["values"]
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
    this.thumb,
  });

  int id;
  int optionId;
  String name;
  String name2;
  String priceVariate;
  String variateValue;
  String hex;
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
        "thumb": thumb == null ? null : thumb!.toMap(),
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
        path: json["path"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "path": path,
      };
}

class Presell {
  Presell({
    this.id = 0,
    this.productId = 0,
    this.startTime = "",
    this.endTime = "",
    this.presellCount = 0,
  });

  int id;
  int productId;
  String startTime;
  String endTime;
  int presellCount;

  factory Presell.fromJson(String str) => Presell.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Presell.fromMap(Map<String, dynamic> json) => Presell(
        id: json["id"] ?? 0,
        productId: json["product_id"] ?? 0,
        startTime: json["start_time"] ?? "",
        endTime: json["end_time"] ?? "",
        presellCount: json["presell_count"] ?? 0,
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
        id: json["id"] ?? 0,
        productId: json["product_id"] ?? 0,
        optionValues: json["option_values"] ?? "",
        sku: json["sku"] ?? "",
        itemId: json["item_id"] ?? "",
        skuPrice: json["sku_price"] ?? "",
        skuStatus: json["sku_status"] ?? 0,
        skuListPrice: json["sku_list_price"] ?? "",
        skuStock: json["sku_stock"] ?? 0,
        presell: json["presell"] ?? 0,
        stockpileStatus: json["stockpile_status"] ?? 0,
        storeStatus: json["store_status"] ?? 0,
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

class NewProductList {
  NewProductList({
    this.id = 0,
    this.name = "",
    this.name2 = "",
    this.slug = "",
    this.status = "",
    this.listPrice = "",
    this.price = 0,
    this.amount = 0,
    this.weight = "",
    this.saled = 0,
    this.popular = 0,
    this.rating = 0,
    this.sort = 0,
    this.reviewsCount = 0,
    this.createdAt = "",
    this.instockTime = "",
    this.isPresell = 0,
    this.isStoreS3 = 0,
    this.maxPrice = "",
    this.srcPrice = "",
    this.promotionPrice = "",
    this.discount = "",
    this.url = "",
    this.fThumb = "",
    this.sThumb = "",
    this.feedThumb = "",
    this.facebookFeedThumb = "",
    this.facebookFeedThumbs = const [],
    this.reviewsTotal = "",
    this.wishlistTotal = "",
    this.cids = const [],
    this.featureImage = const [],
    this.options = const [],
    this.ratNum = 0,
    this.sales = "",
    this.sku = const [],
    this.stockpile = 0,
    required this.presell,
    this.presellDiscount = "",
    this.skuMinPrice = 0,
    this.skuMaxPrice = 0,
    this.tagIcons = const [],
  });

  int id;
  String name;
  String name2;
  String slug;
  String status;
  String listPrice;
  int price;
  int amount;
  String weight;
  int saled;
  int popular;
  int rating;
  int sort;
  int reviewsCount;
  String createdAt;
  String instockTime;
  int isPresell;
  int isStoreS3;
  String maxPrice;
  String srcPrice;
  String promotionPrice;
  String discount;
  String url;
  String fThumb;
  String sThumb;
  String feedThumb;
  String facebookFeedThumb;
  List<String> facebookFeedThumbs;
  String reviewsTotal;
  String wishlistTotal;
  List<int> cids;
  List<FeatureImage> featureImage;
  List<Option> options;
  int ratNum;
  String sales;
  List<Sku> sku;
  int stockpile;
  Presell presell;
  String presellDiscount;
  int skuMinPrice;
  int skuMaxPrice;
  List<dynamic> tagIcons;

  factory NewProductList.fromJson(String str) =>
      NewProductList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewProductList.fromMap(Map<String, dynamic> json) => NewProductList(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        name2: json["name2"] ?? "",
        slug: json["slug"] ?? "",
        status: json["status"] ?? "",
        listPrice: json["list_price"] ?? "",
        price: json["price"] ?? 0,
        amount: json["amount"] ?? 0,
        weight: json["weight"] ?? "",
        saled: json["saled"] ?? 0,
        popular: json["popular"] ?? 0,
        rating: json["rating"] ?? 0,
        sort: json["sort"] ?? 0,
        reviewsCount: json["reviews_count"] ?? 0,
        createdAt: json["created_at"] ?? "",
        instockTime: json["instock_time"] ?? "",
        isPresell: json["is_presell"] ?? 0,
        isStoreS3: json["is_store_s3"] ?? 0,
        maxPrice: json["max_price"] ?? "",
        srcPrice: json["src_price"] ?? "",
        promotionPrice: json["promotion_price"] ?? "",
        discount: json["discount"] ?? "",
        url: json["url"] ?? "",
        fThumb: json["f_thumb"] ?? "",
        sThumb: json["s_thumb"] ?? "",
        feedThumb: json["feed_thumb"] ?? "",
        facebookFeedThumb: json["facebook_feed_thumb"],
        facebookFeedThumbs: json["facebook_feed_thumbs"] == null
            ? []
            : List<String>.from(json["facebook_feed_thumbs"].map((x) => x)),
        reviewsTotal: json["reviews_total"] ?? 0,
        wishlistTotal: json["wishlist_total"] ?? 0,
        cids: json["cids"] == null
            ? []
            : List<int>.from(json["cids"].map((x) => x)),
        featureImage: json["feature_image"] == null
            ? []
            : List<FeatureImage>.from(
                json["feature_image"].map((x) => FeatureImage.fromMap(x))),
        options: json["options"] == null
            ? []
            : List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
        ratNum: json["rat_num"],
        sales: json["sales"],
        sku: json["sku"] == null
            ? []
            : List<Sku>.from(json["sku"].map((x) => Sku.fromMap(x))),
        stockpile: json["stockpile"],
        presell: json["presell"] == null
            ? Presell()
            : Presell.fromMap(json["presell"]),
        presellDiscount: json["presell_discount"],
        skuMinPrice: json["sku_min_price"],
        skuMaxPrice: json["sku_max_price"],
        tagIcons: json["tag_icons"] == null
            ? []
            : List<dynamic>.from(json["tag_icons"].map((x) => x)),
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
        "discount": discount,
        "url": url,
        "f_thumb": fThumb,
        "s_thumb": sThumb,
        "feed_thumb": feedThumb,
        "facebook_feed_thumb": facebookFeedThumb,
        "facebook_feed_thumbs":
            List<dynamic>.from(facebookFeedThumbs.map((x) => x)),
        "reviews_total": reviewsTotal,
        "wishlist_total": wishlistTotal,
        "cids": List<dynamic>.from(cids.map((x) => x)),
        "feature_image": List<dynamic>.from(featureImage.map((x) => x.toMap())),
        "options": List<dynamic>.from(options.map((x) => x.toMap())),
        "rat_num": ratNum,
        "sales": sales,
        "sku": List<dynamic>.from(sku.map((x) => x.toMap())),
        "stockpile": stockpile,
        "presell": presell.toMap(),
        "presell_discount": presellDiscount,
        "sku_min_price": skuMinPrice,
        "sku_max_price": skuMaxPrice,
        "tag_icons": List<dynamic>.from(tagIcons.map((x) => x)),
      };
}

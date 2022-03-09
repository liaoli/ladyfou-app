// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromMap(jsonString);

import 'dart:convert';

class ProductDetailModel {
  ProductDetailModel({
    this.id,
    this.name,
    this.name2,
    this.status,
    this.listPrice,
    this.price,
    this.amount,
    this.maxQty,
    this.saled,
    this.rating,
    this.specialNote,
    this.specialNoteBelow,
    this.discount,
    this.reviewsTotal,
    this.wishlistTotal,
    this.cids,
    this.featureImage,
    this.productSizes,
    this.options,
    this.sku,
    this.webUrl,
    this.reviewFirst,
    this.featuresRes,
    this.contentImages,
    this.isWished,
    this.isLuckyBag,
    this.isFreeShipping,
    this.freeShippingText,
    this.freeShippingLabel,
    this.isRestrictedBlessingBag,
    this.appSizeChart,
    this.activityTags,
    this.attention,
    this.point,
  });

  int? id;
  String? name;
  String? name2;
  String? status;
  int? listPrice;
  int? price;
  int? amount;
  int? maxQty;
  int? saled;
  int? rating;
  String? specialNote;
  String? specialNoteBelow;
  String? discount;
  String? reviewsTotal;
  int? wishlistTotal;
  List<dynamic>? cids;
  List<String>? featureImage;
  ProductSizes? productSizes;
  List<Option>? options;
  List<Sku>? sku;
  String? webUrl;
  List<dynamic>? reviewFirst;
  List<FeaturesRe>? featuresRes;
  List<String>? contentImages;
  int? isWished;
  int? isLuckyBag;
  int? isFreeShipping;
  String? freeShippingText;
  String? freeShippingLabel;
  int? isRestrictedBlessingBag;
  String? appSizeChart;
  List<dynamic>? activityTags;
  List<Attention>? attention;
  dynamic? point;

  factory ProductDetailModel.fromJson(String str) =>
      ProductDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductDetailModel.fromMap(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"],
        name: json["name"],
        name2: json["name2"],
        status: json["status"],
        listPrice: json["list_price"],
        price: json["price"],
        amount: json["amount"],
        maxQty: json["max_qty"],
        saled: json["saled"],
        rating: json["rating"],
        specialNote: json["special_note"],
        specialNoteBelow: json["special_note_below"],
        discount: json["discount"],
        reviewsTotal: json["reviews_total"],
        wishlistTotal: json["wishlist_total"],
        cids: List<dynamic>.from(json["cids"].map((x) => x)),
        featureImage: List<String>.from(json["feature_image"].map((x) => x)),
        productSizes: ProductSizes.fromMap(json["product_sizes"]),
        options:
            List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
        sku: List<Sku>.from(json["sku"].map((x) => Sku.fromMap(x))),
        webUrl: json["web_url"],
        reviewFirst: List<dynamic>.from(json["review_first"].map((x) => x)),
        featuresRes: List<FeaturesRe>.from(
            json["featuresRes"].map((x) => FeaturesRe.fromMap(x))),
        contentImages: List<String>.from(json["content_images"].map((x) => x)),
        isWished: json["is_wished"],
        isLuckyBag: json["is_lucky_bag"],
        isFreeShipping: json["is_free_shipping"],
        freeShippingText: json["free_shipping_text"],
        freeShippingLabel: json["free_shipping_label"],
        isRestrictedBlessingBag: json["is_restricted_blessing_bag"],
        appSizeChart: json["app_size_chart"],
        activityTags: List<dynamic>.from(json["activity_tags"].map((x) => x)),
        attention: List<Attention>.from(
            json["attention"].map((x) => Attention.fromMap(x))),
        point: json["point"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "name2": name2,
        "status": status,
        "list_price": listPrice,
        "price": price,
        "amount": amount,
        "max_qty": maxQty,
        "saled": saled,
        "rating": rating,
        "special_note": specialNote,
        "special_note_below": specialNoteBelow,
        "discount": discount,
        "reviews_total": reviewsTotal,
        "wishlist_total": wishlistTotal,
        "cids": List<dynamic>.from(cids!.map((x) => x)),
        "feature_image": List<dynamic>.from(featureImage!.map((x) => x)),
        "product_sizes": productSizes!.toMap(),
        "options": List<dynamic>.from(options!.map((x) => x.toMap())),
        "sku": List<dynamic>.from(sku!.map((x) => x.toMap())),
        "web_url": webUrl,
        "review_first": List<dynamic>.from(reviewFirst!.map((x) => x)),
        "featuresRes": List<dynamic>.from(featuresRes!.map((x) => x.toMap())),
        "content_images": List<dynamic>.from(contentImages!.map((x) => x)),
        "is_wished": isWished,
        "is_lucky_bag": isLuckyBag,
        "is_free_shipping": isFreeShipping,
        "free_shipping_text": freeShippingText,
        "free_shipping_label": freeShippingLabel,
        "is_restricted_blessing_bag": isRestrictedBlessingBag,
        "app_size_chart": appSizeChart,
        "activity_tags": List<dynamic>.from(activityTags!.map((x) => x)),
        "attention": List<dynamic>.from(attention!.map((x) => x.toMap())),
        "point": point,
      };
}

class Attention {
  Attention({
    this.title = "",
    this.content = "",
  });

  String title;
  String content;

  factory Attention.fromJson(String str) => Attention.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attention.fromMap(Map<String, dynamic> json) => Attention(
        title: json["title"] ?? "",
        content: json["content"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "content": content,
      };
}

class FeaturesRe {
  FeaturesRe({
    this.title = "",
    this.items = "",
  });

  String title;
  String items;

  factory FeaturesRe.fromJson(String str) =>
      FeaturesRe.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeaturesRe.fromMap(Map<String, dynamic> json) => FeaturesRe(
        title: json["title"] ?? "",
        items: json["items"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "items": items,
      };
}

class Option {
  Option({
    this.id = 0,
    this.name = "",
    this.values = const [],
  });

  int id;
  String name;
  List<Value> values;

  factory Option.fromJson(String str) => Option.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Option.fromMap(Map<String, dynamic> json) => Option(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"].map((x) => Value.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "values": List<dynamic>.from(values.map((x) => x.toMap())),
      };
}

class Value {
  Value({
    this.id = 0,
    this.optionId = 0,
    this.name = "",
    this.hex = "",
    this.skuBigThumb = "",
    this.skuSmallThumb = "",
  });

  int id;
  int optionId;
  String name;
  String hex;
  String skuBigThumb;
  String skuSmallThumb;

  factory Value.fromJson(String str) => Value.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Value.fromMap(Map<String, dynamic> json) => Value(
        id: json["id"] ?? 0,
        optionId: json["option_id"] ?? 0,
        name: json["name"] ?? "",
        hex: json["hex"] ?? "",
        skuBigThumb: json["sku_big_thumb"] ?? "",
        skuSmallThumb: json["sku_small_thumb"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "option_id": optionId,
        "name": name,
        "hex": hex,
        "sku_big_thumb": skuBigThumb,
        "sku_small_thumb": skuSmallThumb,
      };
}

class ProductSizes {
  ProductSizes({
    this.sizeValue = const [],
  });

  List<SizeValue> sizeValue;

  factory ProductSizes.fromJson(String str) =>
      ProductSizes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductSizes.fromMap(Map<String, dynamic> json) => ProductSizes(
        sizeValue: json["size_value"] == null
            ? []
            : List<SizeValue>.from(
                json["size_value"].map((x) => SizeValue.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "size_value": List<dynamic>.from(sizeValue.map((x) => x.toMap())),
      };
}

class SizeValue {
  SizeValue({
    this.id = 0,
    this.firstName = "",
    this.transName = "",
    this.values = const [],
  });

  int id;
  String firstName;
  String transName;
  List<String> values;

  factory SizeValue.fromJson(String str) => SizeValue.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SizeValue.fromMap(Map<String, dynamic> json) => SizeValue(
        id: json["id"],
        firstName: json["first_name"],
        transName: json["trans_name"],
        values: json["values"] == null
            ? []
            : List<String>.from(json["values"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "trans_name": transName,
        "values": List<dynamic>.from(values.map((x) => x)),
      };
}

class Sku {
  Sku({
    this.id = 0,
    this.optionValues = "",
    this.skuStatus = 0,
    this.skuBigThumb = "",
    this.skuSmallThumb = "",
  });

  int id;
  String optionValues;
  int skuStatus;
  String skuBigThumb;
  String skuSmallThumb;

  factory Sku.fromJson(String str) => Sku.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sku.fromMap(Map<String, dynamic> json) => Sku(
        id: json["id"] ?? 0,
        optionValues: json["option_values"] ?? "",
        skuStatus: json["sku_status"] ?? 0,
        skuBigThumb: json["sku_big_thumb"] ?? "",
        skuSmallThumb: json["sku_small_thumb"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "option_values": optionValues,
        "sku_status": skuStatus,
        "sku_big_thumb": skuBigThumb,
        "sku_small_thumb": skuSmallThumb,
      };



}

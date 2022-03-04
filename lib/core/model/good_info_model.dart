
class GoodsInfoModel {
  GoodsInfoModel({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.listPrice = '',
    this.price = "0",
    this.amount = 0,
    this.saled = 0,
    this.createdAt = '',
    this.srcPrice = '',
    this.promotionPrice = '',
    this.discount = '',
    this.url = '',
    this.fThumb = '',
    this.reviewsTotal = 0,
    this.wishlistTotal = 0,
    this.rating = 0.0,
    this.cids = const [],
    this.options = const [],
    this.tags = const [],
    this.imgUrl = '',
    this.isWished = false,
    this.point = '',
    required this.presell,
    this.isLuckyBag = 0,
    this.featureImage = const [],
  });

  int id;
  String name;
  String status;
  String listPrice;
  String price;
  int amount;
  int saled;
  String createdAt;
  String srcPrice;
  String promotionPrice;
  String discount;
  String url;
  String fThumb;
  int reviewsTotal;
  int wishlistTotal;
  double rating;
  List<int> cids;
  List<Option> options;
  List<dynamic> tags;
  String imgUrl;
  bool isWished;
  String point;
  Presell presell;
  int isLuckyBag;
  List<dynamic> featureImage;

  static List<GoodsInfoModel> fromList(List json) {
    List<GoodsInfoModel> lists = [];
    json.forEach((element) {
      if (element is Map<String,dynamic>) {
        lists.add(GoodsInfoModel.fromJson(element));
      }
    });
    return lists;
  }

  factory GoodsInfoModel.fromJson(Map<String, dynamic> json) => GoodsInfoModel(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    listPrice: json["list_price"].toString(),
    price: json["price"].toString(),
    amount: json["amount"],
    saled: json["saled"],
    createdAt: json["created_at"],
    srcPrice: json["src_price"].toString(),
    promotionPrice: json["promotion_price"].toString(),
    discount: json["discount"].toString(),
    url: json["url"],
    fThumb: json["f_thumb"],
    reviewsTotal: (json["reviews_total"] == null || json["reviews_total"] == '') ? 0 : int.parse(json["reviews_total"].toString()),
    rating: double.parse(json["rating"].toString()),
    wishlistTotal: (json["wishlist_total"] == null || json["wishlist_total"] == '') ? 0 : int.parse(json["wishlist_total"].toString()),
    cids: json["cids"] == null ? [] : List<int>.from(json["cids"].map((x) => x)),
    options: json["options"] == null ? [] : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"].map((x) => x)),
    imgUrl: json["imgUrl"] ?? '',
    isWished: json["is_wished"] == 1 ? true : false,
    point: json["point"].toString(),
    presell:json["presell"] == null ? Presell() :  Presell.fromJson(json["presell"]),
    isLuckyBag: json["is_lucky_bag"],
    featureImage: List<dynamic>.from(json["feature_image"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "list_price": listPrice.toString(),
    "price": price.toString(),
    "amount": amount,
    "saled": saled,
    "created_at": createdAt.toString(),
    "src_price": srcPrice,
    "promotion_price": promotionPrice,
    "discount": discount,
    "url": url,
    "f_thumb": fThumb,
    "reviews_total": reviewsTotal,
    "rating": rating,
    "wishlist_total": wishlistTotal,
    "cids": List<dynamic>.from(cids.map((x) => x)),
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "imgUrl": imgUrl,
    "is_wished": isWished == true ? 1 : 0,
    "point": point.toString(),
    "presell": presell == null ? Presell() : presell.toJson(),
    "is_lucky_bag": isLuckyBag,
    "feature_image": List<dynamic>.from(featureImage.map((x) => x)),
  };
}

class Option {
  Option({
    this.id = 0,
    this.name = '',
    this.name2 = '',
    this.sort = 0,
    this.type = '',
    this.values = const [],
  });

  int id;
  String name;
  String name2;
  int sort;
  String type;
  List<ValueItem> values;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    id: json["id"],
    name: json["name"],
    name2: json["name2"],
    sort: json["sort"],
    type: json["type"],
    values: List<ValueItem>.from(json["values"].map((x) => ValueItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name2": name2,
    "sort": sort,
    "type": type,
    "values": List<dynamic>.from(values.map((x) => x.toJson())),
  };
}

class ValueItem {
  ValueItem({
    this.id = 0,
    this.optionId = 0,
    this.name = '',
    this.name2 = '',
    this.priceVariate = '',
    this.variateValue = '',
    this.hex = '',
  });

  int id;
  int optionId;
  String name;
  String name2;
  String priceVariate;
  String variateValue;
  String hex;

  factory ValueItem.fromJson(Map<String, dynamic> json) => ValueItem(
    id: json["id"],
    optionId: json["option_id"],
    name: json["name"],
    name2: json["name2"],
    priceVariate: json["price_variate"],
    variateValue: json["variate_value"],
    hex: json["hex"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "option_id": optionId,
    "name": name,
    "name2": name2,
    "price_variate": priceVariate,
    "variate_value": variateValue,
    "hex": hex,
  };
}

class Presell {
  Presell({
    this.actualNum = 0,
    this.presale = 0,
  });

  int actualNum;
  int presale;

  factory Presell.fromJson(Map<String, dynamic> json) => Presell(
    actualNum: json["actual_num"],
    presale: json["presale"],
  );

  Map<String, dynamic> toJson() => {
    "actual_num": actualNum,
    "presale": presale,
  };
}


class WishedModelReq {
  WishedModelReq({
    required this.id,
    required this.isWished,
});
  int id;
  bool isWished;
}

class OptionsReq {
  OptionsReq({
    required this.id,
    required this.optionId,
  });
  int id;
  int optionId;
}

class OptionsSizeReq {
  OptionsSizeReq({
    required this.id,
    required this.sizeName,
  });
  int id;
  String sizeName;

  factory OptionsSizeReq.fromJson(Map<String, dynamic> json) => OptionsSizeReq(
    id: json["id"],
    sizeName: json["size_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "size_name": sizeName,
  };

  static List<OptionsSizeReq> fromToList(List json) {
    List<OptionsSizeReq> lists = [];
    for (int i = 0; i< json.length; i ++) {
      String item = "全部";
      if(i == 0) {
        lists.add(OptionsSizeReq(id: i,sizeName: item));
      }
      item = json[i].toString();

      lists.add(OptionsSizeReq(id: i+1,sizeName: item));
    }
    return lists;
  }

  static List<OptionsSizeReq> fromList(List json) {
    List<OptionsSizeReq> lists = [];
    json.forEach((element) {
      if (element is Map<String,dynamic>) {
        lists.add(OptionsSizeReq.fromJson(element));
      }
    });
    return lists;
  }

  static List<Map<String,dynamic>> toJsonList(List<OptionsSizeReq> models) {
    List<Map<String,dynamic>> lists = [];
    for (int i = 0; i< models.length; i ++) {
      OptionsSizeReq model = models[i];
      lists.add(model.toJson());
    }
    return lists;
  }
}

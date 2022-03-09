// To parse this JSON data, do
//
//     final productCommentListModel = productCommentListModelFromMap(jsonString);

import 'dart:convert';

class ProductCommentListModel {
  ProductCommentListModel({
    required this.data,
    required this.ratingStat,
  });

  List<CommentModel> data;
  RatingStat ratingStat;

  factory ProductCommentListModel.fromJson(String str) => ProductCommentListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCommentListModel.fromMap(Map<String, dynamic> json) => ProductCommentListModel(
    data: List<CommentModel>.from(json["data"].map((x) => CommentModel.fromMap(x))),
    ratingStat: RatingStat.fromMap(json["rating_stat"]),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "rating_stat": ratingStat.toMap(),
  };
}

class CommentModel {
  CommentModel({
    this.id,
    this.name,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.hotReviews,
    required this.images,
    this.likeNum,
    this.isLike,
  });

  int? id;
  String? name;
  int? rating;
  String? content;
  String? createdAt;
  String? updatedAt;
  int? hotReviews;
  List<Image> images;
  int? likeNum;
  int? isLike;

  factory CommentModel.fromJson(String str) => CommentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentModel.fromMap(Map<String, dynamic> json) => CommentModel(
    id: json["id"],
    name: json["name"],
    rating: json["rating"],
    content: json["content"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    hotReviews: json["hot_reviews"],
    images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
    likeNum: json["like_num"],
    isLike: json["is_like"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "rating": rating,
    "content": content,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "hot_reviews": hotReviews,
    "images": List<dynamic>.from(images.map((x) => x.toMap())),
    "like_num": likeNum,
    "is_like": isLike,
  };
}

class Image {
  Image({
    this.path ="",
  });

  String path;

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
    path: json["path"],
  );

  Map<String, dynamic> toMap() => {
    "path": path,
  };
}

class RatingStat {
  RatingStat({
    this.avg ="",
   required this.items,
  });

  String avg;
  Map<String, int> items;

  factory RatingStat.fromJson(String str) => RatingStat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RatingStat.fromMap(Map<String, dynamic> json) => RatingStat(
    avg: json["avg"],
    items: Map.from(json["items"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toMap() => {
    "avg": avg,
    "items": Map.from(items).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

// To parse this JSON data, do
//
//     final productCommentListModel = productCommentListModelFromMap(jsonString);

import 'dart:convert';

class ProductCommentListModel {
  ProductCommentListModel({
    required this.data,
  });

  List<CommentModel> data;

  factory ProductCommentListModel.fromJson(String str) =>
      ProductCommentListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductCommentListModel.fromMap(dynamic json) =>
      ProductCommentListModel(
        data: json == null
            ? []
            : List<CommentModel>.from(json.map((x) => CommentModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class CommentModel {
  CommentModel({
    this.name = "",
    this.rating = 0,
    this.content = "",
    this.createdAt = "",
    this.updatedAt = "",
   required this.images ,
  });

  String name;
  int rating;
  String content;
  String createdAt;
  String updatedAt;
  List<Image> images;

  factory CommentModel.fromJson(String str) =>
      CommentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentModel.fromMap(Map<String, dynamic> json) => CommentModel(
        name: json["name"],
        rating: json["rating"],
        content: json["content"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "rating": rating,
        "content": content,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
      };
}

class Image {
  Image({
    this.path = "",
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

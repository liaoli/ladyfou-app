// To parse this JSON data, do
//
//     final countyListModel = countyListModelFromMap(jsonString);

import 'dart:convert';

class CountyListModel {
  CountyListModel({
    required this.data,
  });

  List<String> data;

  factory CountyListModel.fromJson(String str) =>
      CountyListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountyListModel.fromMap(dynamic json) => CountyListModel(
        data: json == null
            ? []
            : List<String>.from(json.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}

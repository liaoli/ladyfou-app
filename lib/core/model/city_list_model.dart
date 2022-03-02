// To parse this JSON data, do
//
//     final cityListModel = cityListModelFromMap(jsonString);

import 'dart:convert';

class CityListModel {
  CityListModel({
    required this.data,
  });

  List<String> data;

  factory CityListModel.fromJson(String str) =>
      CityListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CityListModel.fromMap(dynamic json) => CityListModel(
        data: json == null
            ? []
            : List<String>.from(json.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}

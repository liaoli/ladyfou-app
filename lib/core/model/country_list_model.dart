// To parse this JSON data, do
//
//     final countryListModel = countryListModelFromMap(jsonString);

import 'dart:convert';



class CountryListModel {
  CountryListModel({
    this.data = const [],
  });

  List<CountryModel> data;

  factory CountryListModel.fromJson(String str) =>
      CountryListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountryListModel.fromMap(List<dynamic> json) => CountryListModel(
        data: List<CountryModel>.from(json.map((x) => CountryModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class CountryModel {
  CountryModel({
    this.id,
    this.isEnabled,
    this.name,
    this.code,
    this.isPinned,
  });

  int? id;
  int? isEnabled;
  String? name;
  String? code;
  int? isPinned;

  factory CountryModel.fromJson(String str) =>
      CountryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
        id: json["id"],
        isEnabled: json["is_enabled"],
        name: json["name"],
        code: json["code"],
        isPinned: json["is_pinned"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "is_enabled": isEnabled,
        "name": name,
        "code": code,
        "is_pinned": isPinned,
      };
}

// To parse this JSON data, do
//
//     final provinceListModel = provinceListModelFromMap(jsonString);

import 'dart:convert';

import 'package:azlistview/azlistview.dart';

class ProvinceListModel {
  ProvinceListModel({
    this.data = const [],
  });

  List<ProvinceModel> data;

  factory ProvinceListModel.fromJson(String str) => ProvinceListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProvinceListModel.fromMap( dynamic json) => ProvinceListModel(
    data: List<ProvinceModel>.from(json.map((x) => ProvinceModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class ProvinceModel with ISuspensionBean {
  ProvinceModel({
    this.id = 0,
    this.countryId =0,
    this.name = "",
    this.code ="",
  });

  int id;
  int countryId;
  String name;
  String code;

  late String tagIndex;
  late String pinyin;
  late String shortPinyin;

  factory ProvinceModel.fromJson(String str) => ProvinceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProvinceModel.fromMap(Map<String, dynamic> json) => ProvinceModel(
    id: json["id"]??0,
    countryId: json["country_id"]??0,
    name: json["name"]??"",
    code: json["code"]??"",
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "country_id": countryId,
    "name": name,
    "code": code,
  };

  @override
  String getSuspensionTag() {
    return tagIndex;
  }
}

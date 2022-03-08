// To parse this JSON data, do
//
//     final zipAddressListModel = zipAddressListModelFromMap(jsonString);

import 'dart:convert';

class ZipAddressListModel {
  ZipAddressListModel({
    this.data = const [],
  });

  List<ZipAddressModel> data;

  factory ZipAddressListModel.fromJson(String str) =>
      ZipAddressListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ZipAddressListModel.fromMap(dynamic json) => ZipAddressListModel(
        data: json == null
            ? []
            : List<ZipAddressModel>.from(
                json.map((x) => ZipAddressModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class ZipAddressModel {
  ZipAddressModel({
    this.zipCode = "",
    this.county = "",
    this.city = "",
    this.town = "",
  });

  String zipCode;
  String county;
  String city;
  String town;

  factory ZipAddressModel.fromJson(String str) =>
      ZipAddressModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ZipAddressModel.fromMap(Map<String, dynamic> json) => ZipAddressModel(
        zipCode: json["zip_code"] ?? "",
        county: json["county"] ?? "",
        city: json["city"] ?? "",
        town: json["town"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "zip_code": zipCode,
        "county": county,
        "city": city,
        "town": town,
      };
}

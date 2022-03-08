// To parse this JSON data, do
//
//     final myAddressModel = myAddressModelFromMap(jsonString);

import 'dart:convert';

class MyAddressListModel {
  MyAddressListModel({
    this.list = const [],
  });

  List<AddressModel> list;

  factory MyAddressListModel.fromJson(String str) =>
      MyAddressListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MyAddressListModel.fromMap(dynamic json) => MyAddressListModel(
        list: json == null
            ? []
            : List<AddressModel>.from(json.map((x) => AddressModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "list": List<dynamic>.from(list.map((x) => x.toMap())),
      };
}

class AddressModel {
  AddressModel({
    this.id =0,
    this.uid =0,
    this.email ="",
    this.city="",
    this.address=";",
    this.phone="",
    this.telephone="",
    this.zip="",
    this.isDefault=0,
    this.createdAt="",
    this.chineseName="",
    this.katakanaName="",
    this.country="",
    this.state="",
    this.stateId = 0,
  });

  int id;
  int uid;
  String email;
  String city;
  String address;
  String phone;
  dynamic telephone;
  String zip;
  int isDefault;
  String createdAt;
  String chineseName;
  String katakanaName;
  String country;
  String state;
  int stateId;

  factory AddressModel.fromJson(String str) =>
      AddressModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        uid: json["uid"],
        email: json["email"],
        city: json["city"],
        address: json["address"],
        phone: json["phone"],
        telephone: json["telephone"],
        zip: json["zip"],
        isDefault: json["is_default"],
        createdAt: json["created_at"],
        chineseName: json["chinese_name"],
        katakanaName: json["katakana_name"],
        country: json["country"],
        state: json["state"],
        stateId: json["state_id"]??0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uid": uid,
        "email": email,
        "city": city,
        "address": address,
        "phone": phone,
        "telephone": telephone,
        "state_id": stateId,
        "zip": zip,
        "is_default": isDefault,
        "created_at": createdAt,
        "chinese_name": chineseName,
        "katakana_name": katakanaName,
        "country": country,
        "state": state,
      };
}

/*
 * @Descripttion: TODO
 * @FileName: address_model
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 3/1/22 4:42 PM
 * @LastEditors: tang
 */

class AddressModel {
  AddressModel({
    this.id = 0,
    this.uid = 0,
    this.email = '',
    this.city = '',
    this.address = '',
    this.phone = '',
    this.telephone = '',
    this.zip = '',
    this.isDefault = 0,
    this.createdAt = '',
    this.chineseName = '',
    this.katakanaName = '',
    this.country = '',
    this.state = '',
  });

  int id;
  int uid;
  String email;
  String city;
  String address;
  String phone;
  String telephone;
  String zip;
  int isDefault;
  String createdAt;
  String chineseName;
  String katakanaName;
  String country;
  String state;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    uid: json["uid"],
    email: json["email"],
    city: json["city"],
    address: json["address"],
    phone: json["phone"],
    telephone: json["telephone"],
    zip: json["zip"],
    isDefault: json["is_default"],
    createdAt: json["created_at"].toString(),
    chineseName: json["chinese_name"],
    katakanaName: json["katakana_name"],
    country: json["country"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "email": email,
    "city": city,
    "address": address,
    "phone": phone,
    "telephone": telephone,
    "zip": zip,
    "is_default": isDefault,
    "created_at": createdAt.toString(),
    "chinese_name": chineseName,
    "katakana_name": katakanaName,
    "country": country,
    "state": state,
  };
}


// To parse this JSON data, do
//
//     final tokenInfoModel = tokenInfoModelFromMap(jsonString);

import 'dart:convert';

class TokenInfoModel {
  TokenInfoModel({
    this.userId = 0,
    this.email = "",
    this.name = "",
    this.token = "",
    this.lastLogin = 0,
    this.tokenExpiredDate = 0,
  });

  int userId;
  String name;
  String email;
  String token;
  int lastLogin;
  int tokenExpiredDate;

  factory TokenInfoModel.fromJson(String str) =>
      TokenInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenInfoModel.fromMap(Map<String, dynamic> json) => TokenInfoModel(
        userId: json["userId"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        token: json["token"] ?? "",
        lastLogin: json["last_login"] ?? 0,
        tokenExpiredDate: json["token_expired_date"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "email": email,
        "name": name,
        "token": token,
        "last_login": lastLogin,
        "token_expired_date": tokenExpiredDate,
      };
}

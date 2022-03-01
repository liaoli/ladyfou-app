// To parse this JSON data, do
//
//     final tokenInfoModel = tokenInfoModelFromMap(jsonString);

import 'dart:convert';

class TokenInfoModel {
  TokenInfoModel({
    this.userId = 0,
    this.token ="",
    this.lastLogin =0,
    this.tokenExpiredDate = 0,
  });

  int userId;
  String token;
  int lastLogin;
  int tokenExpiredDate;

  factory TokenInfoModel.fromJson(String str) => TokenInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenInfoModel.fromMap(Map<String, dynamic> json) => TokenInfoModel(
    userId: json["userId"]??0,
    token: json["token"]??"",
    lastLogin: json["last_login"]??0,
    tokenExpiredDate: json["token_expired_date"]??0,
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "token": token,
    "last_login": lastLogin,
    "token_expired_date": tokenExpiredDate,
  };
}

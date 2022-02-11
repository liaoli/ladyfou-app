// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromMap(jsonString);

import 'dart:convert';

class UserInfoModel {
  UserInfoModel({
    this.admin = false,
    this.chapterTops = const [],
    this.coinCount = 0,
    this.collectIds = const [],
    this.email = "",
    this.icon = "",
    this.id = 0,
    this.nickname = "",
    this.password = "",
    this.publicName = "",
    this.token = "",
    this.type = 0,
    this.username = "",
  });

  bool admin;
  List<int> chapterTops;
  int coinCount;
  List<int> collectIds;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;

  factory UserInfoModel.fromJson(String str) =>
      UserInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromMap(Map<String, dynamic> json) => UserInfoModel(
        admin: json["admin"] ?? false,
        chapterTops: json["chapterTops"] == null
            ? []
            : List<int>.from(json["chapterTops"].map((x) => x)),
        coinCount: json["coinCount"],
        collectIds: json["collectIds"] == null
            ? []
            : List<int>.from(json["collectIds"].map((x) => x)),
        email: json["email"]??"",
        icon: json["icon"]??"",
        id: json["id"]??0,
        nickname: json["nickname"]??"",
        password: json["password"]??"",
        publicName: json["publicName"]??"",
        token: json["token"]??"",
        type: json["type"]??0,
        username: json["username"]??"",
      );

  Map<String, dynamic> toMap() => {
        "admin": admin,
        "chapterTops": List<int>.from(chapterTops.map((x) => x)),
        "coinCount": coinCount,
        "collectIds": List<int>.from(collectIds.map((x) => x)),
        "email": email,
        "icon": icon,
        "id": id,
        "nickname": nickname,
        "password": password,
        "publicName": publicName,
        "token": token,
        "type": type,
        "username": username,
      };
}

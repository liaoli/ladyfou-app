// To parse this JSON data, do
//
//     final provinceListModel = provinceListModelFromMap(jsonString);

import 'dart:convert';

import 'package:azlistview/azlistview.dart';

List<Map<String, dynamic>> provinceMap = [
  {"id": 285, "country_id": 122, "name": "東京都", "code": "Tokyo"},
  {"id": 286, "country_id": 122, "name": "愛知県", "code": "Aichi"},
  {"id": 287, "country_id": 122, "name": "秋田県", "code": "Akita"},
  {"id": 288, "country_id": 122, "name": "青森県", "code": "Aomori"},
  {"id": 289, "country_id": 122, "name": "千葉県", "code": "Chiba"},
  {"id": 290, "country_id": 122, "name": "愛媛県", "code": "Ehime"},
  {"id": 291, "country_id": 122, "name": "福井県", "code": "Fukui"},
  {"id": 292, "country_id": 122, "name": "福岡県", "code": "Fukuoka"},
  {"id": 293, "country_id": 122, "name": "福島県", "code": "Fukushima"},
  {"id": 294, "country_id": 122, "name": "岐阜県", "code": "Gifu"},
  {"id": 295, "country_id": 122, "name": "群馬県", "code": "Gunma"},
  {"id": 296, "country_id": 122, "name": "広島県", "code": "Hiroshim"},
  {"id": 297, "country_id": 122, "name": "北海道", "code": "Hokkaido"},
  {"id": 298, "country_id": 122, "name": "兵庫県", "code": "Hyogo"},
  {"id": 299, "country_id": 122, "name": "茨城県", "code": "Ibaraki"},
  {"id": 300, "country_id": 122, "name": "石川県", "code": "Ishikawa"},
  {"id": 301, "country_id": 122, "name": "岩手県", "code": "Iwate"},
  {"id": 302, "country_id": 122, "name": "香川県", "code": "Kagawa"},
  {"id": 303, "country_id": 122, "name": "鹿児島県", "code": "Kagoshim"},
  {"id": 304, "country_id": 122, "name": "神奈川県", "code": "Kanagawa"},
  {"id": 305, "country_id": 122, "name": "高知県", "code": "Kochi"},
  {"id": 306, "country_id": 122, "name": "熊本県", "code": "Kumamoto"},
  {"id": 307, "country_id": 122, "name": "京都府", "code": "Kyoto"},
  {"id": 308, "country_id": 122, "name": "三重県", "code": "Mie"},
  {"id": 309, "country_id": 122, "name": "宮城県", "code": "Miyagi"},
  {"id": 310, "country_id": 122, "name": "長野県", "code": "Nagano"},
  {"id": 311, "country_id": 122, "name": "奈良県", "code": "Nara"},
  {"id": 312, "country_id": 122, "name": "新潟県", "code": "Niigata"},
  {"id": 313, "country_id": 122, "name": "大分県", "code": "Oita"},
  {"id": 314, "country_id": 122, "name": "岡山県", "code": "Okayama"},
  {"id": 315, "country_id": 122, "name": "沖縄県", "code": "Okinawa"},
  {"id": 316, "country_id": 122, "name": "大阪府", "code": "Osaka"},
  {"id": 317, "country_id": 122, "name": "佐賀県", "code": "Saga"},
  {"id": 318, "country_id": 122, "name": "埼玉県", "code": "Saitama"},
  {"id": 319, "country_id": 122, "name": "滋賀県", "code": "Shiga"},
  {"id": 320, "country_id": 122, "name": "島根県", "code": "Shimane"},
  {"id": 321, "country_id": 122, "name": "静岡県", "code": "Shizuoka"},
  {"id": 322, "country_id": 122, "name": "栃木県", "code": "Tochigi"},
  {"id": 323, "country_id": 122, "name": "徳島県", "code": "Tokushima"},
  {"id": 324, "country_id": 122, "name": "鳥取県", "code": "Tottori"},
  {"id": 325, "country_id": 122, "name": "富山県", "code": "Toyama"},
  {"id": 326, "country_id": 122, "name": "和歌山県", "code": "Wakayama"},
  {"id": 327, "country_id": 122, "name": "山形県", "code": "Yamagata"},
  {"id": 328, "country_id": 122, "name": "山口県", "code": "Yamaguchi"},
  {"id": 329, "country_id": 122, "name": "山梨県", "code": "Yamagata"},
  {"id": 330, "country_id": 122, "name": "宮崎県", "code": "Miyazaki"},
  {"id": 331, "country_id": 122, "name": "長崎県", "code": "Nagasaki"}
];

class ProvinceListModel {
  ProvinceListModel({
    this.data = const [],
  });

  List<ProvinceModel> data;

  factory ProvinceListModel.fromJson(String str) =>
      ProvinceListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProvinceListModel.fromMap(dynamic json) =>
      ProvinceListModel(
        data:
        List<ProvinceModel>.from(json.map((x) => ProvinceModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() =>
      {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };

  static List<ProvinceModel> provinces() {
    return ProvinceListModel
        .fromMap(provinceMap)
        .data;
  }


  static ProvinceModel getProvinceByName(String name) {
    List<ProvinceModel> list = provinces();

    ProvinceModel provinceModel = list.firstWhere((e) {
      return e.name == name;
    });

    return provinceModel;
  }

}

class ProvinceModel with ISuspensionBean {
  ProvinceModel({
    this.id = 0,
    this.countryId = 0,
    this.name = "",
    this.code = "",
  });

  int id;
  int countryId;
  String name;
  String code;

  late String tagIndex;
  late String pinyin;
  late String shortPinyin;

  factory ProvinceModel.fromJson(String str) =>
      ProvinceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProvinceModel.fromMap(Map<String, dynamic> json) =>
      ProvinceModel(
        id: json["id"] ?? 0,
        countryId: json["country_id"] ?? 0,
        name: json["name"] ?? "",
        code: json["code"] ?? "",
      );

  Map<String, dynamic> toMap() =>
      {
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

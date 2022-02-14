/*
 * @Descripttion: TODO
 * @FileName: sort_model
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 2:13 PM
 * @LastEditors: tang
 */

import 'dart:convert';

class SortModel {
  SortModel({
    this.id = 0,
    this.parentId = 0,
    this.name = '',
    this.name2 = '',
    this.slug = '',
    this.isEnabled = 0,
    this.thumb = '',
    this.icon = '',
    this.children = const [],
  });

  int id;
  int parentId;
  String name;
  String name2;
  String slug;
  int isEnabled;
  String thumb;
  String icon;
  List<SortDataChild> children;

  static List<SortModel> fromList(List json) {
    List<SortModel> sorts = [];
    json.forEach((element) {
      if (element is Map<String,dynamic>) {
        sorts.add(SortModel.fromJson(element));
      }
    });
    return sorts;
  }

  factory SortModel.fromJson(Map<String, dynamic> json) => SortModel(
    id: json["id"],
    parentId: json["parent_id"],
    name: json["name"],
    name2: json["name2"],
    slug: json["slug"],
    isEnabled: json["is_enabled"],
    thumb: json["thumb"],
    icon: json["icon"],
    children: json["children"] == null ? [] : SortDataChild.fromList(json["children"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "name": name,
    "name2": name2,
    "slug": slug,
    "is_enabled": isEnabled,
    "thumb": thumb,
    "icon": icon,
    "children": children,
  };
}

class SortDataChild {
  SortDataChild({
    this.id = 0,
    this.parentId = 0,
    this.name = '',
    this.name2 = '',
    this.slug = '',
    this.isEnabled = 0,
    this.thumb = '',
    this.icon = '',
    required this.children,
    this.clickId = 0,
  });

  int id;
  int parentId;
  String name;
  String name2;
  String slug;
  int isEnabled;
  String thumb;
  String icon;
  Map<String,dynamic> children;
  int clickId;

  static List<SortDataChild> fromList(List json) {
    List<SortDataChild> sorts = [];
    json.forEach((element) {
      if (element is Map<String,dynamic>) {
        sorts.add(SortDataChild.fromJson(element));
      }
    });
    return sorts;
  }

  factory SortDataChild.fromJson(Map<String, dynamic> json) => SortDataChild(
    id: json["id"],
    parentId: json["parent_id"],
    name: json["name"],
    name2: json["name2"],
    slug: json["slug"],
    isEnabled: json["is_enabled"],
    thumb: json["thumb"],
    icon: json["icon"],
    children: json["children"] == null ? {} : json["children"],
    clickId: json["clickId"] == null ? 0 : json["clickId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "name": name,
    "name2": name2,
    "slug": slug,
    "is_enabled": isEnabled,
    "thumb": thumb,
    "icon": icon,
    "children": children == null ? {} : children,
    "clickId": clickId == null ? 0 : clickId,
  };
}

class SortDataChildItem {
  SortDataChildItem({
    this.id = 0,
    this.parentId = 0,
    this.name = '',
    this.name2 = '',
    this.slug = '',
    this.isEnabled = 0,
    this.thumb = '',
    this.icon = '',
  });

  int id;
  int parentId;
  String name;
  String name2;
  String slug;
  int isEnabled;
  String thumb;
  String icon;

  factory SortDataChildItem.fromJson(Map<String, dynamic> json) => SortDataChildItem(
    id: json["id"],
    parentId: json["parent_id"],
    name: json["name"],
    name2: json["name2"],
    slug: json["slug"],
    isEnabled: json["is_enabled"],
    thumb: json["thumb"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "name": name,
    "name2": name2,
    "slug": slug,
    "is_enabled": isEnabled,
    "thumb": thumb,
    "icon": icon,
  };
}



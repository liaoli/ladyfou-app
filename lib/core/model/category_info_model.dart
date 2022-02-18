class CategoryInfoModel {
  CategoryInfoModel({
    this.id = 0,
    this.parentId = 0,
    this.nestLeft = 0,
    this.nestRight = 0,
    this.nestDepth = 0,
    this.name = '',
    this.name2 = '',
    this.slug = '',
    this.pageTitle = '',
    this.metaKeywords = '',
    this.metaDescription = '',
    this.position = 0,
    this.description = '',
    this.options = const [],
    this.createdAt = '',
    this.updatedAt = '',
    this.isEnabled = 0,
    this.precautions = const [],
    this.sites = const [],
    this.url = '',
    required this.thumb,
    this.icon = '',
  });

  int id;
  int parentId;
  int nestLeft;
  int nestRight;
  int nestDepth;
  String name;
  String name2;
  String slug;
  String pageTitle;
  String metaKeywords;
  String metaDescription;
  int position;
  String description;
  List<String> options;
  String createdAt;
  String updatedAt;
  int isEnabled;
  List<Precautions> precautions;
  List<Site> sites;
  String url;
  Thumb thumb;
  String icon;

  static List<CategoryInfoModel> fromList(List json) {
    List<CategoryInfoModel> lists = [];
    json.forEach((element) {
      if (element is Map<String, dynamic>) {
        lists.add(CategoryInfoModel.fromJson(element));
      }
    });
    return lists;
  }

  factory CategoryInfoModel.fromJson(Map<String, dynamic> json) =>
      CategoryInfoModel(
        id: json["id"],
        parentId: json["parent_id"],
        nestLeft: json["nest_left"],
        nestRight: json["nest_right"],
        nestDepth: json["nest_depth"],
        name: json["name"],
        name2: json["name2"],
        slug: json["slug"],
        pageTitle: json["page_title"],
        metaKeywords: json["meta_keywords"],
        metaDescription: json["meta_description"],
        position: json["position"],
        description: json["description"],
        options: json["options"] == null
            ? const []
            : List<String>.from(json["options"].map((x) => (x).toString())),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        isEnabled: json["is_enabled"],
        precautions: json["precautions"] == null
            ? const []
            : List<Precautions>.from(
                json["precautions"].map((x) => Precautions.fromList(x))),
        sites: json["sites"] == null
            ? const []
            : List<Site>.from(json["sites"].map((x) => Site.fromJson(x))),
        url: json["url"],
        thumb: json["thumb"] == null ? Thumb() : Thumb.fromJson(json["thumb"]),
        icon: json["icon"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "nest_left": nestLeft,
        "nest_right": nestRight,
        "nest_depth": nestDepth,
        "name": name,
        "name2": name2,
        "slug": slug,
        "page_title": pageTitle,
        "meta_keywords": metaKeywords,
        "meta_description": metaDescription,
        "position": position,
        "description": description,
        "options": options == null
            ? const []
            : List<String>.from(options.map((x) => x.toString())),
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "is_enabled": isEnabled,
        "precautions": precautions == null
            ? const []
            : List<dynamic>.from(precautions.map((x) => x)),
        "sites": List<dynamic>.from(sites.map((x) => x.toJson())),
        "url": url,
        "thumb": thumb.toJson(),
        "icon": icon,
      };
}

class Precautions {
  Precautions({
    this.precaution = const [],
  });

  List<String> precaution;

  factory Precautions.fromList(List<String> json) => Precautions(
        precaution:
            json == null ? const [] : List<String>.from(json.map((x) => x.toString())),
      );

  List<String> toList(List json) {
    List<String> lists = [];
    json.forEach((element) {
      lists.add(element.toString());
    });
    return lists;
  }
}

class Site {
  Site({
    this.site = '',
    this.pageTitle = '',
    this.metaKeywords = '',
    this.metaDescription = '',
  });

  String site;
  String pageTitle;
  String metaKeywords;
  String metaDescription;

  factory Site.fromJson(Map<String, dynamic> json) => Site(
        site: json["site"],
        pageTitle: json["page_title"],
        metaKeywords: json["meta_keywords"],
        metaDescription: json["meta_description"],
      );

  Map<String, dynamic> toJson() => {
        "site": site,
        "page_title": pageTitle,
        "meta_keywords": metaKeywords,
        "meta_description": metaDescription,
      };
}

class Thumb {
  Thumb({
    this.id = 0,
    this.diskName = '',
    this.fileName = '',
    this.fileSize = 0,
    this.contentType = '',
    this.title = '',
    this.description = '',
    this.field = '',
    this.sortOrder = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.sceneId = 0,
    this.path = '',
    this.extension = '',
  });

  int id;
  String diskName;
  String fileName;
  int fileSize;
  String contentType;
  String title;
  String description;
  String field;
  int sortOrder;
  String createdAt;
  String updatedAt;
  int sceneId;
  String path;
  String extension;

  factory Thumb.fromJson(Map<String, dynamic> json) => Thumb(
        id: json["id"],
        diskName: json["disk_name"],
        fileName: json["file_name"],
        fileSize: json["file_size"],
        contentType: json["content_type"],
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        field: json["field"],
        sortOrder: json["sort_order"],
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        sceneId: int.parse(json["scene_id"].toString()),
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "disk_name": diskName,
        "file_name": fileName,
        "file_size": fileSize,
        "content_type": contentType,
        "title": title,
        "description": description,
        "field": field,
        "sort_order": sortOrder,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
        "scene_id": sceneId,
        "path": path,
        "extension": extension,
      };
}

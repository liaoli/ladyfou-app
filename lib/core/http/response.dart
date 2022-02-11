import '../model/user_info_model.dart';

class MyResponse<T> {
  MyResponse({
    required this.code,
    this.data,
    required this.msg,
  });

  int code;
  T? data;
  String msg;

  factory MyResponse.fromJson(Map<String, dynamic> json) => MyResponse(
        code: json["code"],
        data: json["data"] == null ? null : fromJson<T>(json['data']),
        msg: json["msg"],
      );
}

T fromJson<T>(Map<String, dynamic> json) {
  switch (T.toString()) {
    case "UserInfoModel":
      return UserInfoModel.fromMap(json) as T;
    default:
      return [] as T;
  }
}

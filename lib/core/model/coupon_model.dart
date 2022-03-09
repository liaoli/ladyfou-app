class CouponModel {
  CouponModel({
    this.amount = 0,
    this.code = '',
    this.text = '',
    this.amountType = '',
    this.couponId = 0,
    this.expiredDate = '',
    this.tips = '',
    this.categoryName = '',
    this.categoryId = 0,
    this.minRequiredAmount = '',
    this.requiredProductCount = 0,
    this.usedFlg = 0,
    this.maxUsed = 0,
    this.type = '',
    this.userIds = const [],
  });

  int amount;
  String code;
  String text;
  String amountType;
  int couponId;
  String expiredDate;
  String tips;
  String categoryName;
  int categoryId;
  String minRequiredAmount;
  int requiredProductCount;
  int usedFlg;
  int maxUsed;
  String type;
  List<int> userIds;

  static List<CouponModel> fromList(List json) {
    List<CouponModel> lists = [];
    json.forEach((element) {
      if (element is Map<String, dynamic>) {
        lists.add(CouponModel.fromJson(element));
      }
    });
    return lists;
  }

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        amount: json["amount"],
        code: json["code"],
        text: json["text"].toString(),
        amountType: json["amount_type"],
        couponId: json["couponId"],
        expiredDate: json["expiredDate"],
        tips: json["tips"],
        categoryName: json["categoryName"],
        categoryId: json["categoryId"],
        minRequiredAmount: json["min_required_amount"].toString(),
        requiredProductCount: json["required_product_count"],
        usedFlg: json["used_flg"],
        maxUsed: json["max_used"],
        type: json["type"],
        userIds: json["userIds"] == null
            ? const []
            : List<int>.from(json["userIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "code": code,
        "text": text.toString(),
        "amount_type": amountType,
        "couponId": couponId,
        "expiredDate": expiredDate,
        "tips": tips,
        "categoryName": categoryName,
        "categoryId": categoryId,
        "min_required_amount": minRequiredAmount.toString(),
        "required_product_count": requiredProductCount,
        "used_flg": usedFlg,
        "max_used": maxUsed,
        "type": type,
        "userIds": List<dynamic>.from(userIds.map((x) => x)),
      };
}

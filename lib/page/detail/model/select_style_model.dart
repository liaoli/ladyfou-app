


import '../../../core/model/product_detail_model.dart';

class SelectStyleModel {
  int id;
  String name;
  String name2;
  int listPrice;
  int price;
  int amount;
  List<Option> options;

  SelectStyleModel({
    this.id = 0,
    this.name = "",
    this.name2 = "",
    this.listPrice = 0,
    this.price = 0,
    this.amount = 0,
    this.options = const [],
  });
}

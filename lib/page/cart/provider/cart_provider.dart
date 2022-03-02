import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/core/constant/constant.dart';
import 'package:ladyfou/core/http/request.dart';
import 'package:ladyfou/core/http/response.dart';
import 'package:ladyfou/page/cart/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  late CartModel cartModel;
  List<Product> productList = [];

  int requestStatus = 0; // 1请求成功  2请求失败
  int currentPage = CURRENT_PAGE;
  EasyRefreshController refreshController = EasyRefreshController();

  /// 获取分类数据
  Future getSortAllDatas() async {
    try {
      MyResponse<CartModel> response = await getCartList(params: {});
      if (response.common.statusCode == 1000) {
        cartModel = response.response!.data!;
        productList = cartModel.products;
        requestStatus = 1;
      } else {
        requestStatus = 2;
      }
      notifyListeners();
    } catch (s, e) {
      print('请求报错:$e');
      requestStatus = 2;
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/core/constant/constant.dart';
import 'package:ladyfou/core/http/request.dart';
import 'package:ladyfou/core/http/response.dart';
import 'package:ladyfou/page/cart/model/cart_model.dart';

import '../../../core/model/daily_new_product_list_model.dart';
import '../../../core/utils/toast.dart';

class CartProvider with ChangeNotifier {
  late CartModel cartModel;
  List<Product> productList = [];
  List<Product> selectProductList = [];
  List<DailyNewProduct> reCommend = []; //猜你喜欢
  bool isSelectAll = false;

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
        selectProductList.clear();
        isSelectAll = false;
        requestStatus = 1;
      } else {
        requestStatus = 2;
        ToastUtils.error(response.common.debugMessage);
      }
      notifyListeners();
    } catch (s, e) {
      print('请求报错:$e');
      requestStatus = 2;
    }
  }

  Future<MyResponse<DailyNewProductListModel>> getRecommendList() async {
    try {
      MyResponse<DailyNewProductListModel> result = await recommendList();
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        reCommend.clear();
        reCommend.addAll(result.response!.data!.data);
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  Future selectAllAction() async {
    isSelectAll = !isSelectAll;
    if (isSelectAll) {
      selectProductList.clear();
      productList.forEach((product) {
        selectProductList.add(product);
      });
    } else {
      selectProductList.clear();
    }
    notifyListeners();
  }

  Future selectProduct(Product product) async {
    if (selectProductList.length == 0) {
      selectProductList.add(product);
    } else {
      bool isExit = false;
      selectProductList.forEach((p) {
        if (product.productId == p.productId) {
          isExit = true;
        }
      });
      // 存在
      if (isExit) {
        selectProductList
            .removeWhere((element) => element.productId == product.productId);
      } else {
        selectProductList.add(product);
      }
    }

    if (selectProductList.length == productList.length) {
      isSelectAll = true;
    } else {
      isSelectAll = false;
    }

    notifyListeners();
  }
}

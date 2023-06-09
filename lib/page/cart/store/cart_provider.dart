import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/core/constant/constant.dart';
import 'package:ladyfou/core/http/request.dart';
import 'package:ladyfou/core/http/response.dart';
import 'package:ladyfou/core/model/coupon_model.dart';
import 'package:ladyfou/page/cart/model/cart_model.dart';

import '../../../core/model/daily_new_product_list_model.dart';
import '../../../core/utils/toast.dart';

class CartProvider with ChangeNotifier {
  late CartModel cartModel;
  List<Product> productList = []; //购物车商品列表
  List<Product> selectProductList = []; // 选中的商品
  List<DailyNewProduct> reCommend = []; //猜你喜欢
  List<String> cartTextList = []; //促销文本
  List<CouponModel> couponList = []; // 优惠券列表
  bool isSelectAll = false;

  int requestStatus = 0; // 1请求成功  2请求失败
  int currentPage = CURRENT_PAGE;
  EasyRefreshController refreshController = EasyRefreshController();
  int currentIntegral = 0; //当前使用的积分
  CouponModel currentCoupon = CouponModel(); //当前使用的优惠券

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

  /// 获取推荐商品列表
  Future<MyResponse<DailyNewProductListModel>> getRecommendList() async {
    try {
      MyResponse<DailyNewProductListModel> result = await recommendList();
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

  /// 获取促销策略文本
  Future<MyResponse> getShoppingCartList() async {
    try {
      MyResponse response = await getShoppingCartText(params: {});
      if (response.common.statusCode == 1000) {
        cartTextList.clear();
        cartTextList = response.response!.data!;
      }
      notifyListeners();
      return response;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  /// 获取优惠券
  Future getCouponCodeList() async {
    try {
      MyResponse<List<CouponModel>> response = await getCouponCode(params: {});
      if (response.common.statusCode == 1000) {
        couponList.clear();
        couponList = response.response!.data!;
      }
      notifyListeners();
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  /// 全选
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

  /// 单选
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

  /// 更新使用积分
  Future updateUseIntegral(int integral) async {
    currentIntegral = integral;
    notifyListeners();
  }

  /// 更新使用的优惠券
  Future updateUseCoupon(CouponModel? model) async {
    if (model != null) {
      currentCoupon = model;
    }
    notifyListeners();
  }
}

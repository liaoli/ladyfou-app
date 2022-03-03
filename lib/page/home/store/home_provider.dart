import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/http/request.dart';
import '../../../core/http/response.dart';
import '../../../core/model/daily_new_product_list_model.dart';
import '../../../core/utils/toast.dart';

class HomeProvider extends ChangeNotifier {
  List<DailyNewProduct> dailyNew = []; //每日新品
  List<DailyNewProduct> discount = []; //限时折扣
  List<DailyNewProduct> reCommend = []; //猜你喜欢

  //验证通过提交数据
  Future<void> getHomeDataList(BuildContext context) async {
    await limitTimeDiscountList();
    await getDailyNew();
    await getRecommendList();
  }

  Future<MyResponse<DailyNewProductListModel>> getDailyNew() async {
    try {
      MyResponse<DailyNewProductListModel> result =
          await homeLimitTimeDiscount();
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        dailyNew.clear();
        dailyNew.addAll(result.response!.data!.data);
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  Future<MyResponse<DailyNewProductListModel>> limitTimeDiscountList() async {
    try {
      MyResponse<DailyNewProductListModel> result =
          await homeLimitTimeDiscount();
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        discount.clear();
        discount.addAll(result.response!.data!.data);
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }


  Future<MyResponse<DailyNewProductListModel>> getRecommendList() async {
    try {
      MyResponse<DailyNewProductListModel> result =
      await recommendList();
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

}

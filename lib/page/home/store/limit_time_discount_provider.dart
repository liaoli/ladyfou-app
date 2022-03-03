import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../core/http/request.dart';
import '../../../core/http/response.dart';
import '../../../core/model/daily_new_product_list_model.dart';
import '../../../core/utils/toast.dart';

class LimitTimeDiscountProvider extends ChangeNotifier {
  //验证通过提交数据

  List<DailyNewProduct> data = [];

  int page = 1;

  int pageSize = 10;

  EasyRefreshController refreshController = EasyRefreshController();

  Future<MyResponse<DailyNewProductListModel>> limitTimeDiscountList(
      {bool isRefresh = false}) async {
    if (isRefresh) {
      page = 1;
    } else {
      page += 1;
    }
    try {
      MyResponse<DailyNewProductListModel> result =
          await homeLimitTimeDiscount(page: page, pageSize: pageSize);
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        bool hasMore = result.common.pageEnabled.hasMore();
        if (isRefresh) {
          data.clear();
          data.addAll(result.response!.data!.data);
          refreshController.finishRefresh();
          refreshController.resetLoadState();
        } else {
          data.addAll(result.response!.data!.data);
          refreshController.finishLoad(noMore: !hasMore);
        }
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }
}

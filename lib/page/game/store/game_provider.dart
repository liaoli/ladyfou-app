import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/http/request.dart';
import '../../../core/http/response.dart';
import '../../../core/model/daily_new_product_list_model.dart';
import '../../../core/utils/toast.dart';

class GameProvider extends ChangeNotifier {

  List<DailyNewProduct> reCommend = []; //猜你喜欢

  //验证通过提交数据
  Future<void> getData(BuildContext context) async {
    await getRecommendList();
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

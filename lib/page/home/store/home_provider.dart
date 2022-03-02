import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/http/request.dart';
import '../../../core/utils/toast.dart';

class HomeProvider extends ChangeNotifier {
  //验证通过提交数据
  void getHomeDataList(BuildContext context) {
    homeData().then((value) {
      if (value.common.statusCode == 1000) {
        ToastUtils.success("拉取home 数据成功");
      } else {
        ToastUtils.error(value.common.debugMessage);
      }
    }).catchError((onError) {
      ToastUtils.error("$onError");

      debugPrint("$onError");
    });
  }
}

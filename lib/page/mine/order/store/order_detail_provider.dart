/*
 * @Descripttion: TODO
 * @FileName: order_detail_provider
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/22/22 4:09 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../../../core/constant/constant.dart';

class OrderDetailProvider with ChangeNotifier {
  bool isRequestError = false;
  int currentPage = CURRENT_PAGE;
  EasyRefreshController refreshController = EasyRefreshController();
  EasyRefreshController logisticsRefreshController = EasyRefreshController();
}
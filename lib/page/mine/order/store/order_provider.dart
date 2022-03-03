/*
 * @Descripttion: TODO
 * @FileName: order_provider
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/21/22 10:41 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/core/constant/base_enum.dart';
import 'package:ladyfou/core/model/order_info_model.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/http/request.dart';
import '../../../../core/http/response.dart';
import '../../../../core/model/good_info_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderInfoModel> orderInfoList = [];
  bool isRequestError = false;
  int currentPage = CURRENT_PAGE;
  EasyRefreshController refreshController = EasyRefreshController();

  List<OrderInfoModel> orderAllList = [];
  List<OrderInfoModel> waitPayList = [];
  List<OrderInfoModel> waitReceiveList = [];
  List<OrderInfoModel> finishList = [];
  List<OrderInfoModel> cancleList = [];

  // 推荐商品列表
  List<GoodsInfoModel> orderAllGoodsList = [];
  List<GoodsInfoModel> waitPayGoodsList = [];
  List<GoodsInfoModel> waitReceiveGoodsList = [];
  List<GoodsInfoModel> finishGoodsList = [];
  List<GoodsInfoModel> cancleGoodsList = [];

  /// status all是请求全部
  Future getOrderList(OrderStatus status,
      {bool isRefresh = true,
      int page = CURRENT_PAGE,
      int size = PAGE_SIZE}) async {
    if (isRefresh) page = CURRENT_PAGE;

    Map<String, dynamic> params = {
      "type": status.name,
      "page": page,
      "size": size,
    };
    try {
      MyResponse<List<OrderInfoModel>> response =
          await getOrderInfos(params: params);
      if (response.common.statusCode == 1000) {
        List<OrderInfoModel> modelList = response.response!.data!;
        currentPage = response.common.pageEnabled.currentPage;
        if (isRefresh) {
          orderInfoList.clear();
          orderInfoList = modelList;
          refreshController.finishRefresh();
          refreshController.finishLoad();
        } else {
          if (currentPage < response.common.pageEnabled.totalPage) {
            refreshController.finishLoad();
          } else {
            refreshController.finishLoad(noMore: true);
          }
          orderInfoList.addAll(modelList);
        }
        notifyListeners();
      } else {
        isRequestError = true;
        orderInfoList.clear();
        orderInfoList = [];
        refreshController.finishRefresh();
        refreshController.finishLoad();
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }
}

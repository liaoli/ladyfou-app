/*
 * @Descripttion: TODO
 * @FileName: goods_operation_provider
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/23/22 11:15 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/core/http/request.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/http/response.dart';
import '../../../../core/model/good_info_model.dart';

class GoodsOperationProvider with ChangeNotifier {
  bool isRequestError = false;
  int currentPage = CURRENT_PAGE;
  EasyRefreshController refreshController = EasyRefreshController();

  List<GoodsInfoModel> goodCollectionList = [];

  /// 获取二级分类商品列表
  Future getCollectionLists(
      {int promotion = 0,
      int cid = 0,
      bool isFirst = false,
      bool isRefresh = true,
      int page = CURRENT_PAGE,
      int size = PAGE_SIZE}) async {
    if (isFirst || isRefresh) page = CURRENT_PAGE;
    Map<String, dynamic> params = {
      "promotion": promotion,
      "cid": cid,
      "page": page,
      "size": size,
    };
    try {
      MyResponse<List<GoodsInfoModel>> response =
          await getCollectionInfos(params: params);
      if (response.common.statusCode == 1000) {
        List<GoodsInfoModel> modelList = response.response!.data!;

        /// 第一次请求
        if (isFirst) {
          goodCollectionList = modelList;
          currentPage = response.common.pageEnabled.currentPage;
        } else {
          if (isRefresh) {
            goodCollectionList.clear();
            goodCollectionList = modelList;
            refreshController.finishRefresh();
            refreshController.finishLoad();
          } else {
            if (goodCollectionList.length <
                response.common.pageEnabled.totalPage) {
              refreshController.finishLoad();
            } else {
              refreshController.finishLoad(noMore: true);
            }
            goodCollectionList.addAll(modelList);
          }
        }
        notifyListeners();
      } else {
        isRequestError = true;
        goodCollectionList.clear();
        goodCollectionList = [];
        refreshController.finishRefresh();
        refreshController.finishLoad();
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }
}

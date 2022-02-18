/*
 * @Descripttion: TODO
 * @FileName: sort_provider
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 2:00 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:ladyfou/core/constant/base_bloc.dart';
import 'package:ladyfou/core/constant/constant.dart';
import 'package:ladyfou/core/http/request.dart';
import 'package:ladyfou/core/http/response.dart';
import 'package:ladyfou/core/model/sort_model.dart';

import '../../../core/constant/base_enum.dart';
import '../../../core/model/category_info_model.dart';
import '../../../core/model/good_info_model.dart';

class SortProvider with ChangeNotifier {
  List<SortModel> categoryList = [];
  List<GoodsInfoModel> goodsInfoList = [];
  List<CategoryInfoModel> categoryInfoModels = [];
  bool isRequestError = false;
  int currentPage = CURRENT_PAGE;
  EasyRefreshController refreshController = EasyRefreshController();

  /// 获取分类数据
  Future getSortAllDatas() async {
    try {
      MyResponse<List<SortModel>> response = await getSortData();
      if (response.common.statusCode == 1000) {
        categoryList = response.response!.data!;
        notifyListeners();
      } else {
        isRequestError = true;
        categoryList = [];
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }

  /// 获取二级分类商品列表
  Future getCategoryProducts(int id,
      {bool isFirst = false,
      bool isRefresh = true,
      int page = CURRENT_PAGE,
      int size = PAGE_SIZE,
      String order_type = ""}) async {
    if (isFirst || isRefresh) page = CURRENT_PAGE;
    try {
      MyResponse<List<GoodsInfoModel>> response = await getCategoryProduct(
          id: id, page: page, size: size, order_type: order_type);
      if (response.common.statusCode == 1000) {
        List<GoodsInfoModel> modelList = response.response!.data!;

        /// 第一次请求
        if (isFirst) {
          goodsInfoList = modelList;
          currentPage = response.common.pageEnabled.currentPage;
        } else {
          if (isRefresh) {
            goodsInfoList.clear();
            goodsInfoList = modelList;
            refreshController.finishRefresh();
            refreshController.finishLoad();
          } else {
            if (goodsInfoList.length < response.common.pageEnabled.totalPage) {
              refreshController.finishLoad();
            } else {
              refreshController.finishLoad(noMore: true);
            }
            goodsInfoList.addAll(modelList);
          }
        }
        notifyListeners();
      } else {
        isRequestError = true;
        goodsInfoList.clear();
        goodsInfoList = [];
        refreshController.finishRefresh();
        refreshController.finishLoad();
        notifyListeners();
      }
    } catch (s,e) {
      print('请求报错:$e');
    }
  }

  /// 切换列表模式
  Future switchListType(DisplayType type) async {
    // displayType = type;
    BaseBloc.instance.displayType = type;
    notifyListeners();
  }

  /// 获取一级二级分类的分类数据
  Future getCategoryChildDatas(int id) async {
    try {
      MyResponse<List<CategoryInfoModel>> response = await getCategoryChilds(id: id);
      if (response.common.statusCode == 1000) {
        categoryInfoModels = response.response!.data!;
        notifyListeners();
      }else {
        categoryInfoModels = [];
        notifyListeners();
      }
    } catch (s,e) {
      print('请求报错:$e');
    }
  }
}

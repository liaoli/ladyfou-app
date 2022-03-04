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
import '../../../core/constant/event_bus.dart';
import '../../../core/model/category_info_model.dart';
import '../../../core/model/good_info_model.dart';
import '../../../core/utils/event.dart';
import '../../../core/utils/toast.dart';

class SortProvider with ChangeNotifier {
  List<SortModel> categoryList = [];
  List<GoodsInfoModel> goodsInfoList = [];
  List<CategoryInfoModel> categoryInfoModels = [];
  List<CategoryInfoModel> selectCategoryInfoModels = [];
  List<OptionsSizeReq> conditionInfoModels = [];
  List<OptionsSizeReq> selectConditionInfoModels = [];

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
  Future getCategoryProducts(
    List<int> ids, {
    bool isRefresh = true,
    int page = CURRENT_PAGE,
    int size = PAGE_SIZE,
    String order_type = "",
    List<String> option_size = const [],
  }) async {
    if (isRefresh) page = CURRENT_PAGE;

    try {
      Map<String, dynamic> params = {
        "id": ids.join(','),
        "page": page,
        "size": size,
        "order_type": order_type,
      };
      if (option_size.length > 0) {
        params["attr_type_name[1]"] = "尺码";
        params["attr_type_value[1]"] = option_size.join(',');
      }

      MyResponse<List<GoodsInfoModel>> response =
          await getCategoryProduct(params: params);
      if (response.common.statusCode == 1000) {
        List<GoodsInfoModel> modelList = response.response!.data!;
        currentPage = response.common.pageEnabled.currentPage;

        if (isRefresh) {
          goodsInfoList.clear();
          goodsInfoList = modelList;
          refreshController.finishRefresh();
          refreshController.finishLoad();
        } else {
          if (currentPage < response.common.pageEnabled.totalPage) {
            refreshController.finishLoad();
          } else {
            refreshController.finishLoad(noMore: true);
          }
          goodsInfoList.addAll(modelList);
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
    } catch (s, e) {
      print('请求报错:$e');
    }
  }

  /// 通过分类查询数据
  Future querySortCategoryProducts(List<int> ids) async {
    if (selectCategoryInfoModels.length > 0) {
      List<int> list = [];
      selectCategoryInfoModels.forEach((element) {
        list.add(element.id);
      });
      if (list.length > 0) {
        getCategoryProducts(list, isRefresh: true);
      }
    } else {
      if (ids.length > 0) {
        getCategoryProducts(ids, isRefresh: true);
      }
    }
  }

  /// 通过分类条件查询数据
  Future queryConditionInfoProducts(List<int> ids) async {
    if (selectConditionInfoModels.length > 0) {
      List<String> list = [];
      selectConditionInfoModels.forEach((element) {
        if(element.id == 0) {
          list.add('');
        }else {
          list.add(element.sizeName);
        }

      });
      if (list.length > 0) {
        getCategoryProducts(ids,option_size: list, isRefresh: true);
      }
    } else {
      if (ids.length > 0) {
        getCategoryProducts(ids, isRefresh: true);
      }
    }
  }

  /// 获取分类产品尺码规格
  Future queryOptionSize(int category_id) async {
    if (category_id > 0) {
      try {
        Map<String, dynamic> params = {
          "category_id": category_id,
        };
        MyResponse response = await getOptionSize(params: params);
        if (response.common.statusCode == 1000) {
          List<OptionsSizeReq> modelList = response.response!.data!;
          conditionInfoModels = modelList;
          selectConditionInfoModels = [];
        } else {
          conditionInfoModels = [];
          selectConditionInfoModels = [];
        }
        notifyListeners();
      } catch (s, e) {
        print('请求报错:$e');
      }
    }
  }

  /// 切换列表模式
  Future switchListType(DisplayType type) async {
    BaseBloc.instance.displayType = type;
    notifyListeners();
  }

  /// 获取一级二级分类的分类数据
  Future getCategoryChildDatas(int id) async {
    try {
      MyResponse<List<CategoryInfoModel>> response =
          await getCategoryChilds(id: id);
      if (response.common.statusCode == 1000) {
        categoryInfoModels = response.response!.data!;
        notifyListeners();
      } else {
        categoryInfoModels = [];
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }

  Future firstSelectModels(String name2) async {
    selectCategoryInfoModels = [];
    for (int index = 0; index < categoryInfoModels.length; index++) {
      CategoryInfoModel model = categoryInfoModels[index];
      if (model.name2 == name2) {
        selectCategoryInfoModels.add(model);
        notifyListeners();
        break;
      }
    }
  }

  /// 收藏或者取消收藏
  Future collectionAction(int index) async {
    int product_id = 0;
    try {
      product_id = goodsInfoList[index].id;
      goodsInfoList[index].isWished = !goodsInfoList[index].isWished;

      /// 通知所有这个商品改变状态
      XEvent.post(
          EVENT_KEY_WISHED,
          WishedModelReq(
              id: product_id, isWished: goodsInfoList[index].isWished));

      Map<String, dynamic> params = {"product_id": product_id};

      /// 发送请求
      MyResponse response = await operationIsWished(params: params);
      if (response.common.statusCode == 1000) {
        ToastUtils.success(response.common.debugMessage);
      } else {
        ToastUtils.error(response.common.debugMessage);
        product_id = goodsInfoList[index].id;
        goodsInfoList[index].isWished = !goodsInfoList[index].isWished;

        /// 通知所有这个商品改变状态
        XEvent.post(
            EVENT_KEY_WISHED,
            WishedModelReq(
                id: product_id, isWished: goodsInfoList[index].isWished));
      }
    } catch (s, e) {
      print('请求报错:$e');
    }
  }
}

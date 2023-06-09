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
import 'package:ladyfou/core/utils/toast.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/http/response.dart';
import '../../../../core/model/good_collection_model.dart';
import '../../../../core/model/good_info_model.dart';

class GoodsOperationProvider with ChangeNotifier {
  bool isRequestError = false;
  int currentPage = CURRENT_PAGE;
  EasyRefreshController refreshController = EasyRefreshController();
  bool isEditCollection = false;
  late CollectionInfoModel collectionInfoModel;
  List<GoodsInfoModel> goodCollectionList = [];
  List<GoodsInfoModel> selectCollectionGoodList = [];
  bool isSelectAll = false;

  List<CategoryListItem> categoryInfoModels = [];

  List<CategoryListItem> selectCategoryInfoModels = [];

  /// 获取二级分类商品列表
  Future getCollectionLists(
      {int promotion = 0,
      List<int> cids = const [],
      bool isRefresh = true,
      int page = CURRENT_PAGE,
      int size = PAGE_SIZE}) async {
    if (isRefresh) page = CURRENT_PAGE;

    Map<String, dynamic> params = {
      "promotion": promotion,
      "cid": cids.join(','),
      "page": page,
      "size": size,
    };
    try {
      MyResponse<CollectionInfoModel> response =
          await getCollectionInfos(params: params);
      if (response.common.statusCode == 1000) {
        collectionInfoModel = response.response!.data!;
        List<GoodsInfoModel> modelList = collectionInfoModel.wishedList;

        currentPage = response.common.pageEnabled.currentPage;

        if (isRefresh) {
          goodCollectionList.clear();
          goodCollectionList = modelList;
          categoryInfoModels = collectionInfoModel.categoryList;
          refreshController.finishRefresh();
          refreshController.finishLoad();
        } else {
          if (currentPage < response.common.pageEnabled.totalPage) {
            refreshController.finishLoad();
          } else {
            refreshController.finishLoad(noMore: true);
          }
          goodCollectionList.addAll(modelList);
          categoryInfoModels.addAll(collectionInfoModel.categoryList);
        }

        notifyListeners();
      } else {
        ToastUtils.error(response.common.debugMessage);
        isRequestError = true;
        goodCollectionList.clear();
        goodCollectionList = [];
        refreshController.finishRefresh();
        refreshController.finishLoad();
        notifyListeners();
      }
    } catch (s, e) {
      print('请求报错:$s');
    }
  }

  /// 通过分类查询数据
  Future querySortCategoryProducts() async {
    if (selectCategoryInfoModels.length > 0) {
      List<int> list = [];
      selectCategoryInfoModels.forEach((element) {
        list.add(element.cid);
      });
      if (list.length > 0) {
        getCollectionLists(cids: list,isRefresh: true);
      }
    } else {
      getCollectionLists();
    }
  }

  /// 点击编辑还是完成
  Future checkEditCollection() async {
    isEditCollection = !isEditCollection;
    notifyListeners();
  }

  /// 选中或者取消选中
  Future checkSelectCollection(GoodsInfoModel model) async {
    if (selectCollectionGoodList.length == 0) {
      selectCollectionGoodList.add(model);
    } else {
      bool isExit = false;
      selectCollectionGoodList.forEach((e) {
        if (model.id == e.id) {
          isExit = true;
        }
      });
      if (isExit) {
        selectCollectionGoodList
            .removeWhere((element) => element.id == model.id);
      } else {
        selectCollectionGoodList.add(model);
      }
    }
    notifyListeners();
  }

  /// 全选
  Future checkSelectAll() async {
    isSelectAll = !isSelectAll;
    if (isSelectAll) {
      selectCollectionGoodList.clear();
      goodCollectionList.forEach((element) {
        selectCollectionGoodList.add(element);
      });
    } else {
      selectCollectionGoodList.clear();
    }
    notifyListeners();
  }

  /// 取消收藏
  Future cancleCollection() async {
    List<int> ids = [];
    selectCollectionGoodList.forEach((element) {
      ids.add(element.id);
    });
    if (ids.length > 0) {
      try {
        Map<String, dynamic> params = {
          "product_ids": ids.join(','),
        };
        MyResponse response = await cancleIsWished(params: params);
        if (response.common.statusCode == 1000) {
          ToastUtils.success(response.common.debugMessage);
          selectCollectionGoodList.clear();
          isEditCollection = false;
          isSelectAll = false;
          getCollectionLists();
        } else {
          ToastUtils.error(response.common.debugMessage);
        }
      } catch (s, e) {
        print('请求报错:$e');
      }
    }
  }

  Future addToCart(List<int> productIds,
      {int qty = 0,
      String type = 'add',
      List<OptionsReq> options = const []}) async {
    if (productIds.length == 0) {
      return;
    }
    try {
      Map<String, dynamic> params = {
        "productId": productIds.join(','),
        "type": type,
      };
      if(qty > 0) {
        params["qty"] = qty;
      }
      /*
      {
        "productId": "27,28",
        "type": "add",
        "qty": 1,
        "ProductOption[99873]": 365400,
        "ProductOption[id]": option_id,
      } */
      if (options.length > 0) {
        options.forEach((op) {
          String key = "ProductOption[${op.id}]";
          params[key] = op.optionId;
        });
      }
      MyResponse response = await addCart(params: params);
      if (response.common.statusCode == 1000) {
        ToastUtils.success(response.common.debugMessage);
        selectCollectionGoodList.clear();
        isEditCollection = false;
        isSelectAll = false;
        getCollectionLists();
      } else {
        ToastUtils.error(response.common.debugMessage);
      }

    } catch (s,e) {
      print('请求报错:$e');
    }
  }
}

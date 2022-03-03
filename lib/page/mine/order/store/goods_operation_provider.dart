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

    /*
    List data = [{"id":7931,"name":"product_7931","status":"instock","list_price":2376,"price":2200,"amount":5000,"max_qty":0,"saled":22,"rating":5,"created_at":"2019-05-28 07:38:37","src_price":"2200","promotion_price":"2200","discount":"","url":"/skatap-sleeve-casual-blouse-p-7931.html","point":"1008","tags":[],"f_thumb":"http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png","is_restricted_blessing_bag":0,"feature_image":[],"cids":[2,21],"options":[],"wishlist_total":"","reviews_total":"","is_lucky_bag":0},{"id":2811,"name":"product_2811","status":"instock","list_price":44,"price":22,"amount":1911016,"max_qty":0,"saled":424,"rating":5,"created_at":"2019-04-28 06:52:05","src_price":"22","promotion_price":"22","discount":"","url":"/long-sleeve-casual-dress-p-2811.html","point":"0","tags":[],"f_thumb":"http://192.168.1.174/plugins/jason/ccshop/assets/images/default-thumb.png","is_restricted_blessing_bag":0,"feature_image":[],"cids":[25,18],"options":[],"wishlist_total":"","reviews_total":"","is_lucky_bag":0},{"id":7937,"name":"product_7937","status":"instock","list_price":5346,"price":4455,"amount":599983,"max_qty":0,"saled":1,"rating":5,"created_at":"2019-05-28 08:59:05","src_price":"4455","promotion_price":"4455","discount":"","url":"/vneck-commute-dress-p-7937.html","point":"44","tags":[],"f_thumb":"http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg","is_restricted_blessing_bag":0,"feature_image":["http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg","http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg"],"cids":[25,29],"options":[],"wishlist_total":"","reviews_total":"","is_lucky_bag":0}];
    goodCollectionList = GoodsInfoModel.fromList(data);
    notifyListeners();
     */

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
        getCollectionLists(cids: list);
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
          ToastUtils.success('已取消收藏！');
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

  Future addToCart(
    List<int> productIds, {
    int qty = 1,
    String type = 'add',
  }) async {

  }
}

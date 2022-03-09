import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/horizontal_scroll_tab_bar.dart';
import '../../../core/http/request.dart';
import '../../../core/http/response.dart';
import '../../../core/model/daily_new_product_list_model.dart';
import '../../../core/model/product_comment_list_model.dart';
import '../../../core/model/product_detail_model.dart';
import '../../../core/utils/toast.dart';

const int product_index = 1;
const int comment_index = 2;
const int description_index = 3;
const int recommend_index = 4;

class ProductDetailProvider extends ChangeNotifier {
  late ScrollController scrollController;

  ProductDetailModel? detailModel;
  ProductCommentListModel? comment;
  List<DailyNewProduct> reCommend = []; //猜你喜欢
  final List<TabData> tabS = [];
  TabData product = TabData(title: "商品", index: product_index, selected: true);
  TabData commend = TabData(
    title: "评价",
    index: comment_index,
  );
  TabData description = TabData(
    title: "详情",
    index: description_index,
  );
  TabData recommend = TabData(
    title: "推荐",
    index: recommend_index,
  );

  double productOffset = 0.w;
  double commentOffset = 957.w;
  double descriptionOffset = 1239.w;
  double recommendOffset = 1993.w;

  ProductDetailProvider() {
    scrollController = ScrollController();
    tabS.add(product);
    tabS.add(commend);
    tabS.add(description);
    tabS.add(recommend);
  }

  void resetTabs() {
    tabS.forEach((e) {
      e.selected = false;
    });
  }

  void scroll2Position(TabData tabData) {
    switch (tabData.index) {
      case product_index:
        scrollTo(productOffset);
        break;
      case comment_index:
        scrollTo(commentOffset);
        break;
      case description_index:
        scrollTo(descriptionOffset);
        break;
      case recommend_index:
        scrollTo(recommendOffset);
        break;
    }
  }

  void scrollTo(double position) {
    scrollController.jumpTo(position);
  }

  Future<void> getData() async {
    await getProductDetail();
    await getProductReviews();
    await getRecommendList();
  }

  Future<MyResponse<ProductDetailModel>> getProductDetail() async {
    try {
      MyResponse<ProductDetailModel> result = await productDetail();
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        detailModel = result.response!.data!;
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }

  Future<MyResponse<ProductCommentListModel>> getProductReviews() async {
    try {
      MyResponse<ProductCommentListModel> result = await productReviews(id: 84229);
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        comment = result.response!.data!;
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
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

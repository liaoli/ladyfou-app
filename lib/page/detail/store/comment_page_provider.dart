import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/common_label.dart';
import '../../../components/horizontal_scroll_tab_bar.dart';
import '../../../core/http/request.dart';
import '../../../core/http/response.dart';
import '../../../core/model/product_comment_list_model.dart';
import '../../../core/model/product_detail_model.dart';
import '../../../core/utils/toast.dart';

const int product_index = 1;
const int comment_index = 2;
const int description_index = 3;
const int recommend_index = 4;

class CommentPageProvider extends ChangeNotifier {
  ProductCommentListModel? comment;

  List<CommentModel> comments = [];

  int page = 1;

  int pageSize = 10;

  int filterImg = 0;

  EasyRefreshController refreshController = EasyRefreshController();

  List<CommonLabelData> labels = [];//所有 ，有图 tab



  CommentPageProvider(){
    labels.add(CommonLabelData(
        label: "全部",
        isSelected: true,
        data: 0,
        height: 24.w,
        borderRadius: 12.w));
    labels.add(
      CommonLabelData(label: "带图评论", data: 1, height: 24.w, borderRadius: 12.w),
    );
  }


  Future<void> getData() async {
    await getProductReviews();
  }

  Future<MyResponse<ProductCommentListModel>> getProductReviews(
      {bool isRefresh = false}) async {
    try {

      if (isRefresh) {
        page = 1;
      } else {
        page += 1;
      }

      MyResponse<ProductCommentListModel> result = await productReviews(
        id: 84229,
        page: page,
        filterimg: filterImg
      );
      ToastUtils.success(result.common.debugMessage);
      if (result.common.statusCode == 1000) {
        bool hasMore = result.common.pageEnabled.hasMore();
        if (isRefresh) {
          comments.clear();
          comments.addAll(result.response!.data!.data);
          refreshController.finishRefresh();
          refreshController.resetLoadState();
        } else {
          comments.addAll(result.response!.data!.data);
          refreshController.finishLoad(noMore: !hasMore);
        }

        comment = result.response!.data!;
      }
      notifyListeners();
      return result;
    } catch (s, e) {
      debugPrint("$s");
      throw e;
    }
  }
}

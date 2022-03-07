import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/utils/net_image_url_util.dart';

import '../../../components/common_label.dart';
import '../../../core/model/product_detail_model.dart';
import '../../../style/Color.dart';

class SelectColorSizeProvider extends ChangeNotifier {
  ProductDetailModel productDetailModel;

  int count = 0;

  late Option color;
  late Option size;

  List<CommonLabelData<Value>> sizeLabels = [];
  List<CommonLabelData<Value>> colorLabels = [];

  SelectColorSizeProvider({required this.productDetailModel}) {
    color = productDetailModel.options![0];
    size = productDetailModel.options![1];
  }

  String featureImg() {
    return getImageUrl(productDetailModel.featureImage![0]);
  }

  List<CommonLabelData<Value>> getColorList() {
    if (colorLabels.length == 0) {
      colorLabels = color.values.map((e) {
        return CommonLabelData(
          label: e.name,
          data: e,
          height: 20.w,
          width: 40.w,
          default_bg: AppColors.transparent,
          selected_bg: AppColors.Color_E34D59,
          default_text_color: AppColors.color_FF333333,
          selected_text_color: AppColors.white,
          selected_borderColor: AppColors.Color_E34D59,
          borderRadius: 16.w,
          default_borderColor: AppColors.color_FF999999,
        );
      }).toList();
    }

    return colorLabels;
  }

  List<CommonLabelData<Value>> getSizeList() {
    if (sizeLabels.length == 0) {
      sizeLabels = size.values.map((e) {
        return CommonLabelData(
          label: e.name,
          data: e,
          height: 20.w,
          width: 40.w,
          default_bg: AppColors.transparent,
          selected_bg: AppColors.Color_E34D59,
          default_text_color: AppColors.color_FF333333,
          selected_text_color: AppColors.white,
          selected_borderColor: AppColors.Color_E34D59,
          borderRadius: 16.w,
          default_borderColor: AppColors.color_FF999999,
        );
      }).toList();
    }
    return sizeLabels;
  }
}

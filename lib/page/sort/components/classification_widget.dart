/*
 * @Descripttion: TODO
 * @FileName: classification_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/18/22 10:43 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/sort/components/wrap_gradient_widget.dart';
import 'package:ladyfou/style/Color.dart';

import '../../../core/model/category_info_model.dart';

typedef CallBackWidget = void Function(List<CategoryInfoModel> infoModels);

class ClassificationWidget extends StatefulWidget {
  final List<CategoryInfoModel> categoryInfoModels;
  final CallBackWidget callBack;

  ClassificationWidget(
      {Key? key, required this.categoryInfoModels, required this.callBack})
      : super(key: key);

  @override
  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<ClassificationWidget> {
  List<String> itemList = [];
  List<String> selectItemList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemList = [];
    widget.categoryInfoModels.forEach((element) {
      itemList.add(element.name2);
    });

    // TODO: implement build
    return Container(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 0.0,
          runAlignment: WrapAlignment.spaceBetween,
          children: [
            WrapGradientWidget(
                itemList: itemList,
                isAddBorder: true,
                borderColor: AppColors.navigationColor,
                bgNormalColor: AppColors.color_FFF5F5F5,
                bgSelectGradientColor: [
                  AppColors.gradientColorStart,
                  AppColors.gradientColorEnd
                ],
                titleNormalColor: AppColors.primaryBlackText,
                titleSelectColor: AppColors.white,
                titleSize: 12.sp,
                padding: EdgeInsets.only(
                    left: 12.sp, top: 5.sp, bottom: 5.sp, right: 12.sp),
                onClick: (idx) {}),
          ],
        ));
  }
}

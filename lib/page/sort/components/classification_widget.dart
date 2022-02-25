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
import 'package:ladyfou/style/text.dart';

import '../../../core/model/category_info_model.dart';

typedef CallBackWidget = void Function(List<CategoryInfoModel> infoModels);

class ClassificationWidget extends StatefulWidget {
  final List<CategoryInfoModel> categoryInfoModels;
  final CallBackWidget callBack;
  final bool isShow;

  ClassificationWidget(
      {Key? key,
      required this.categoryInfoModels,
      required this.callBack,
      required this.isShow})
      : super(key: key);

  @override
  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<ClassificationWidget> {
  List<String> itemList = [];
  List<String> selectItemList = [];
  List list = [];

  @override
  void initState() {
    // TODO: implement initState

    list = ['测试1','测试2','测试3','测试4'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemList = [];
    widget.categoryInfoModels.forEach((element) {
      itemList.add(element.name2);
    });

    // TODO: implement build

    // return Container(
    //   padding: EdgeInsets.only(left: 10.w, right: 10.w),
    //   child: Text('测试'),
    // );

    return Container(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Visibility(
                    visible: widget.isShow,
                    child: WrapGradientWidget(
                        itemList: itemList,
                        isAddBorder: true,
                        borderColor: AppColors.navigationColor,
                        bgNormalColor: AppColors.color_FFF5F5F5,
                        titleNormalColor: AppColors.primaryBlackText,
                        titleSelectColor: AppColors.navigationColor,
                        titleSize: 12.sp,
                        height: 24.w,
                        currentSelects: [],
                        padding: EdgeInsets.only(left: 15.w, right: 15.w),
                        onClick: (idxs) {}),
                  )),
              Expanded(child: Container(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 62.w,
                  height: 24.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.color_FFF5F5F5,
                    borderRadius: BorderRadius.all(Radius.circular(12.0.w)),
                  ),
                  child: Text('重置',
                      style: BaseText.style(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.color_FF333333)),
                ),
              )),
            ],
          ),
    );
  }
}

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

import '../../../core/constant/base_bloc.dart';
import '../../../core/model/category_info_model.dart';

typedef CallBackWidget = void Function(List<ItemButtonModel> infoModels);
typedef FinishCallBackWidget = void Function();

class ClassificationWidget extends StatefulWidget {
  final List<ItemButtonModel> itemList;
  final List<ItemButtonModel> selectItemList;
  final CallBackWidget callBack;
  final FinishCallBackWidget finishCallBack;
  final bool isShow;

  ClassificationWidget(
      {Key? key,
      required this.itemList,
      required this.callBack,
      required this.isShow,
      required this.finishCallBack,
      this.selectItemList = const []})
      : super(key: key);

  @override
  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<ClassificationWidget> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Visibility(
        visible: widget.isShow,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 40.w),
                child: SingleChildScrollView(
                  child: WrapGradientWidget(
                      itemList: widget.itemList,
                      isAddBorder: true,
                      borderColor: AppColors.navigationColor,
                      bgNormalColor: AppColors.color_FFF5F5F5,
                      titleNormalColor: AppColors.primaryBlackText,
                      titleSelectColor: AppColors.navigationColor,
                      titleSize: 12.sp,
                      height: 24.w,
                      currentSelects: widget.selectItemList,
                      padding: EdgeInsets.only(left: 15.w, right: 15.w),
                      onClick: (models) {
                        widget.callBack(models);
                      }),
                )),
            Positioned(
                bottom: 10.w,
                child: Container(
                  width: 355.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            BaseBloc.instance
                                .addUpdateCollectionAlertShow(true);
                            widget.callBack([]);
                          });
                        },
                        child: Container(
                          width: 62.w,
                          height: 24.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.color_FFF5F5F5,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0.w)),
                          ),
                          child: Text('重置',
                              style: BaseText.style(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.color_FF333333)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.finishCallBack();
                        },
                        child: Container(
                          width: 62.w,
                          height: 24.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.color_FFF5F5F5,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0.w)),
                          ),
                          child: Text('确定',
                              style: BaseText.style(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.color_FF333333)),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  List<int> updateCurrentSelects(List<CategoryInfoModel> models) {
    return [];
  }
}

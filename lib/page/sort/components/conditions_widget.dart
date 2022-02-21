/*
 * @Descripttion: TODO
 * @FileName: conditions_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/18/22 10:44 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/sort/components/wrap_gradient_widget.dart';

import '../../../core/model/category_info_model.dart';
import '../../../style/Color.dart';

typedef CallBackWidget = void Function(List<CategoryInfoModel> infoModels);

class ConditionsWidget extends StatefulWidget {

  final List<CategoryInfoModel> categoryInfoModels;
  final CallBackWidget callBack;
  final bool isShow;

  ConditionsWidget({Key? key,required this.categoryInfoModels,required this.callBack, required this.isShow}) : super(key: key);

  @override
  _ConditionsState createState() => _ConditionsState();
}

class _ConditionsState extends State<ConditionsWidget> {

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
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Visibility(
            visible: widget.isShow,
            child: Column(
              children: [
                Expanded(
                    child: WrapGradientWidget(
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
                        currentSelects: [],
                        padding: EdgeInsets.only(
                            left: 12.w, top: 5.w, bottom: 5.w, right: 12.w),
                        onClick: (idxs) {})),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text('重置'),
                ),
              ],
            )));
  }
}

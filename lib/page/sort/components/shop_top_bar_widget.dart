/*
 * @Descripttion: TODO
 * @FileName: shop_top_bar_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/17/22 10:44 AM
 * @LastEditors: tang
 */

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../../style/Color.dart';
import '../../../style/text.dart';

/// index: 0 未弹出，1弹出第一个，2弹出第二个，...
typedef CallBackWidget = void Function(int index);

class TopBarWidget extends StatefulWidget {
  // 点击喜欢
  final CallBackWidget onAlertClick;
  TopBarWidget({Key? key,required this.onAlertClick}) : super(key: key);

  @override
  _TopBarWidgetState createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  static int selectIndex = 0;
  static bool isPriceDown = false;
  @override
  Widget build(BuildContext context) {
    List barList = _topBarList(context);
    return Container(
      height: 35.w,
      padding: EdgeInsets.only(left: 20.w,right: 20.w),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.5.w,
              color: AppColors.primaryBackground,
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: barList.asMap().keys.map((index) {
          return _barItemWidget(context, index, barList);
        }).toList(),
      ),
      // child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: barList.length,
      //     itemBuilder: (context, index) {
      //       return _barItemWidget(context, index, barList);
      //     }),
    );
  }

  Widget _barItemWidget(BuildContext context, int index, List barList) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(selectIndex == index + 1) {
            selectIndex = 0;
          }else {
            selectIndex = index+1;
          }

          widget.onAlertClick(selectIndex);

        });
      },
      child: Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.only(left: index == 0 ? 20.w 60.w,right: index == 0 ? 40.w : 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              barList[index]['title'],
              style: BaseText.style(
                color: selectIndex == index+1
                    ? AppColors.navigationColor
                    : AppColors.primaryBlackText,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 3.8),
            _itemIconWidget(context, index, barList),
          ],
        ),
      ),
    );
  }

  // 每个item
  Widget _itemIconWidget(BuildContext context, int index, List barList) {
    Map itemMap = barList[index];
    if (ObjectUtil.isEmptyString(itemMap['icon'])) {
      return SizedBox();
    } else {
      if (itemMap.containsKey('icon1')) {
        return _priceIconWidget(itemMap, index);
      } else {
        return Image.asset(selectIndex == index+1 ? itemMap['icon2']:itemMap['icon'],
            color: selectIndex == index+1
                ? AppColors.navigationColor
                : AppColors.jp_color196);
      }
    }
  }

  Widget _priceIconWidget(Map itemMap, int index) {
    if (selectIndex == index+1) {
      isPriceDown = !isPriceDown;
      return isPriceDown
          ? Image.asset(itemMap['icon'], color: AppColors.navigationColor)
          : Image.asset(itemMap['icon1'], color: AppColors.navigationColor);
    } else {
      isPriceDown = false;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(itemMap['icon']),
          Image.asset(itemMap['icon1']),
        ],
      );
    }
  }
}

List<Map> _topBarList(BuildContext context) {
  return [
    {
      "title": S.current.store_comprehensive,
      "icon": "assets/images/sort/store_price_down.png",
      "icon2": "assets/images/sort/store_price_up.png",
    },
    {
      "title": S.current.store_classification,
      "icon": "assets/images/sort/store_price_down.png",
      "icon2": "assets/images/sort/store_price_up.png",
    },
    {
      "title": S.current.store_conditions,
      "icon": "assets/images/sort/store_price_down.png",
      "icon2": "assets/images/sort/store_price_up.png",
    },
  ];
}
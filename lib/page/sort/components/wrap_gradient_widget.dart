/*
 * @Descripttion: TODO
 * @FileName: wrap_gradient_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/18/22 2:47 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';
import '../../../style/text.dart';

typedef CallBackWidget = void Function(int index);

class WrapGradientWidget extends StatefulWidget {
  WrapGradientWidget({
    Key? key,
    required this.itemList,
    required this.onClick,
    this.isAddBorder = false,
    this.borderColor = Colors.white,
    this.bgNormalColor = Colors.white,
    this.titleNormalColor = AppColors.primaryBlackText,
    this.titleSelectColor = Colors.white,
    this.bgSelectGradientColor = const [],
    this.titleSize = 10,
    this.padding = EdgeInsets.zero,
    this.currentSelect = 0,
  });

  int currentSelect;
  final List itemList;
  final bool isAddBorder; // 是否添加边框
  final Color borderColor; // 边框颜色，要先设置isAddBorder = true
  final Color bgNormalColor; // 默认背景色
  final List<Color> bgSelectGradientColor; // 选中背景色

  final Color titleNormalColor; // 默认文字颜色
  final Color titleSelectColor; // 选中文字颜色
  final double titleSize; // 文字大小
  final EdgeInsetsGeometry padding; // 内边距，文字居上下左右的距离
  final CallBackWidget onClick;

  @override
  _WrapGradientWidgetState createState() => _WrapGradientWidgetState();
}

class _WrapGradientWidgetState extends State<WrapGradientWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: widget.itemList.asMap().keys.map((index) {
        return _selectItemWidget(widget.itemList[index], index);
      }).toList(),
    );
  }

  Widget _selectItemWidget(String title, int index) {
    return GestureDetector(
      onTap: () {
        widget.onClick(index);
        setState(() {
          widget.currentSelect = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
        padding: widget.padding,
        decoration: BoxDecoration(
          border: widget.isAddBorder
              ? widget.currentSelect == index
                  ? null
                  : Border.all(
                      width: 0.5.sp,
                      color: AppColors.primaryGreyText,
                    )
              : null,
          color: widget.currentSelect != index ? widget.bgNormalColor : null,
          gradient: widget.currentSelect == index
              ? LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: widget.bgSelectGradientColor)
              : null,
          borderRadius: BorderRadius.all(Radius.circular(16.0.sp)),
        ),
        child: Text(
          '$title',
          style: BaseText.style(
              fontSize: widget.titleSize,
              color: widget.currentSelect == index
                  ? widget.titleSelectColor
                  : widget.titleNormalColor),
        ),
      ),
    );
  }
}

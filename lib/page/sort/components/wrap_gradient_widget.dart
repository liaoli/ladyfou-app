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

typedef CallBackWidget = void Function(List indexs);

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
    this.height = 30.0,
    required this.currentSelects,
  });

  List currentSelects = [];
  final List itemList;
  final bool isAddBorder; // 是否添加边框
  final Color borderColor; // 边框颜色，要先设置isAddBorder = true
  final Color bgNormalColor; // 默认背景色
  final List<Color> bgSelectGradientColor; // 选中背景色
  final double height;

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
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40.w,
      children: widget.itemList.asMap().keys.map((index) {
        return _selectItemWidget(widget.itemList[index], index);
      }).toList(),
    );
  }

  bool isExit(int index) {
    bool isExit = false;
    widget.currentSelects.forEach((element) {
      if (element == index) {
        isExit = true;
      }
    });
    return isExit;
  }

  Widget _selectItemWidget(String title, int index) {
    return GestureDetector(
      onTap: () {
        if (isExit(index)) {
          widget.currentSelects.remove(index);
        } else {
          widget.currentSelects.add(index);
        }
        widget.onClick(widget.currentSelects);
        setState(() {});
      },
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.w),
            padding: widget.padding,
            height: widget.height,
            decoration: BoxDecoration(
              border: widget.isAddBorder
                  ? isExit(index)
                      ? Border.all(
                          width: 0.5.w,
                          color: widget.titleSelectColor,
                        )
                      : Border.all(
                          width: 0.5.w,
                          color: widget.bgNormalColor,
                        )
                  : null,
              color: !isExit(index) ? widget.bgNormalColor : null,
              // gradient: isExit(index)
              //     ? LinearGradient(
              //     begin: Alignment.centerLeft,
              //     end: Alignment.centerRight,
              //     colors: widget.bgSelectGradientColor)
              //     : null,
              borderRadius: BorderRadius.all(Radius.circular(widget.height / 2.0)),
            ),
            child: Text(
              '$title',
              style: BaseText.style(
                  fontSize: widget.titleSize,
                  color: isExit(index)
                      ? widget.titleSelectColor
                      : widget.titleNormalColor),
              strutStyle: StrutStyle(
                height: 1.5,
                forceStrutHeight: true
              ),
            ),
          ),
          isExit(index)
              ? Container(
                  padding: EdgeInsets.only(bottom: 5.w),
                  child: Image.asset("assets/images/sort/fi_check_delete.png"),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

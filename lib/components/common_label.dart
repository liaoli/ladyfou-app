import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

import '../utils/measure_util.dart';

class CommonLabel extends StatefulWidget {
  final CommonLabelData model;

  CommonLabel({required this.model});

  @override
  _CommonLabelState createState() => _CommonLabelState();
}

class _CommonLabelState extends State<CommonLabel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w1 = widget.model.width;
    if (widget.model.useTextWidth) {
      TextStyle style = TextStyle(fontSize: 12.sp);
      w1 = paintWidthWithTextStyle(
        style,
        widget.model.getLabel(),
      );
      w1 += 20.w;
    }
    double height = widget.model.height;
    return Container(
      height: height,
      width: w1,
      decoration: BoxDecoration(
        color: widget.model.getBackgroundColor(),
        borderRadius: BorderRadius.all(Radius.circular(widget.model.borderRadius)),
        border: new Border.all(color: widget.model.getBorderColor(), width: 1),
      ),
      child: Center(
        child: Text(
          widget.model.getLabel(),
          style:
              TextStyle(color: widget.model.getLabelColor(), fontSize: 12.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  bool selected() => widget.model.isSelected;
}

class CommonLabelData<T> {
  String label;
  bool isSelected;
  bool useTextWidth;
  Color default_borderColor;
  Color selected_borderColor;
  Color default_bg;

  Color selected_bg;

  Color default_text_color;
  Color selected_text_color;

  double height;
  double width;
  double borderRadius;

  T data;

  CommonLabelData({
    required this.label,
    this.isSelected = false,
    this.useTextWidth = true,
    this.default_borderColor = AppColors.transparent,
    this.selected_borderColor = AppColors.transparent,
    this.default_bg = AppColors.color_FFFCE6E9,
    this.selected_bg = AppColors.Color_E34D59,
    this.default_text_color = AppColors.color_FF333333,
    this.selected_text_color = AppColors.white,
    this.borderRadius = 0,
    required this.data,
    required this.height,
    this.width = 0,
  });


  Color getBackgroundColor() {
    return isSelected ? selected_bg : default_bg;
  }


  Color getBorderColor() {
    return isSelected?selected_borderColor:default_borderColor;
  }


  String getLabel() {
    return label;
  }


  Color getLabelColor() {
    return isSelected ? selected_text_color : default_text_color;
  }




}

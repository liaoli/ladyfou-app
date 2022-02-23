import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

import '../../../utils/measure_util.dart';

class CommonLabel extends StatefulWidget {
  final ICommonLabelModel model;

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
    TextStyle style = TextStyle(fontSize: 12.sp);
    double w1 = paintWidthWithTextStyle(
      style,
      widget.model.getLabel(),
    );
    w1 += 20.w;
    double height = 24.w;
    return Container(
      height: height,
      width: w1,
      decoration: BoxDecoration(
        color: widget.model.getBackgroundColor(),
        borderRadius: BorderRadius.all(Radius.circular(12.w)),
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

abstract class ICommonLabelModel {
  bool  isSelected = false;
  Color default_bg = AppColors.color_FFFCE6E9;
  Color selected_bg = AppColors.Color_E34D59;
  Color border_color = AppColors.transparent;

  Color default_text_color = AppColors.color_FF333333;

  Color selected_text_color = AppColors.white;

  String getLabel(); //Label Tag
  Color getBackgroundColor(); //Label Tag
  Color getBorderColor(); //Label Tag
  Color getLabelColor(); //Label Tag
}

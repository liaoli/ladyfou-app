import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/detail/components/arrow_forward.dart';

import '../../../style/Color.dart';

class CommonTile extends StatelessWidget {
  final String title;
  final String subTitle;

  final TextStyle titleStyle;
  final TextStyle subTitleStyle;

  final Widget? leftChild;

  const CommonTile({
    Key? key,
    required this.title,
    this.subTitle = "",
    this.leftChild,
    required this.titleStyle,
    required this.subTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 12.w,
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.color_FF333333,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        Expanded(child: SizedBox()),
        Text(
          subTitle ,
          style: TextStyle(
            color: AppColors.color_FF999999,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        leftChild ?? SizedBox(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../style/Color.dart';
import 'arrow_forward.dart';

class CommonForwardItemView extends StatelessWidget {
  final String title;
  final String subTitle;

  const CommonForwardItemView(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

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
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        Expanded(child: SizedBox()),
        Text(
          subTitle,
          style: TextStyle(
            color: AppColors.color_FF999999,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        ArrowForward(
          size: 16.w,
        ),
      ],
    );
  }
}

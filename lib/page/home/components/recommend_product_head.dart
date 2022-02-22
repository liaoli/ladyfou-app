import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

class RecommendProductHead extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const RecommendProductHead({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: 52.w,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: buildLine(),
          ),
          SizedBox(
            width: 12.w,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/home/your_like.png",
                width: 16.w,
                height: 16.w,
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                "猜你喜欢",
                style: TextStyle(
                  color: AppColors.color_FF333333,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: buildLine(),
          ),
        ],
      ),
    );
  }

  Container buildLine() => Container(
        height: 1.w,
        width: double.infinity,
        color: AppColors.color_FFDADADA,
      );
}

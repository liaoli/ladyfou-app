import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../style/Color.dart';
import '../../detail/components/arrow_forward.dart';
import 'common_tile.dart';

class SettingItemView extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function()? onTap;
  final Widget? leftChild;

  const SettingItemView({
    Key? key,
    this.onTap,
    required this.title,
    this.subTitle = "",
    this.leftChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: 41.w,
        width: double.infinity,
        child: CommonTile(
          title: title,
          subTitle: subTitle,
          titleStyle: TextStyle(
            color: AppColors.color_FF333333,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          subTitleStyle: TextStyle(
            color: AppColors.color_FF999999,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          leftChild: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: leftChild ??
                ArrowForward(
                  size: 16.w,
                ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

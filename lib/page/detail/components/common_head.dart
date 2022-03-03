import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../style/Color.dart';

class CommonHead extends StatelessWidget {
  final String title;
  const CommonHead({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.w),
          topRight: Radius.circular(10.w),
        ),
        child: Container(
          color: AppColors.white,
          child: Row(
            children: [
              SizedBox(
                width: 12.w,
              ),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.color_FF333333,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

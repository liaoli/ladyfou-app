import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../style/Color.dart';
import 'arrow_forward.dart';

class ProductEvaluationHead extends StatelessWidget {
  const ProductEvaluationHead({Key? key}) : super(key: key);

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
                "商品评价(68)",
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
              RatingBarIndicator(
                rating: 4.5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: AppColors.Color_E34D59,
                ),
                itemCount: 5,
                itemSize: 16.0,
                unratedColor: Colors.amber.withAlpha(50),
                direction: Axis.horizontal,
              ),
              Text(
                "好评96.8%",
                style: TextStyle(
                  color: AppColors.color_FFDE0020,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ArrowForward(
                size: 16.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

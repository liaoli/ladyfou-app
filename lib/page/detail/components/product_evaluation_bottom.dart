import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/button/common_button.dart';
import '../../../style/Color.dart';
import '../product_comment_page.dart';

class ProductEvaluationBottom extends StatefulWidget {
  const ProductEvaluationBottom({Key? key}) : super(key: key);

  @override
  _ProductEvaluationBottomState createState() =>
      _ProductEvaluationBottomState();
}

class _ProductEvaluationBottomState extends State<ProductEvaluationBottom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ClipRRect(
        borderRadius: new BorderRadius.only(
            bottomLeft: Radius.circular(10.w),
            bottomRight: Radius.circular(10.w)),
        child: Container(
          height: 50.w,
          color: AppColors.white,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonButton(
                borderRadius: new BorderRadius.all(Radius.circular(17.w)),
                width: 142.w,
                height: 33.w,
                bg: AppColors.Color_E34D59,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "查看更多",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  //TODO:跳转到每日新品列表
                  Get.to(() => ProductCommentPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

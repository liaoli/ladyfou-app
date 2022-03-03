import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../components/button/common_button.dart';
import '../../../style/Color.dart';
import '../product_rank_page.dart';

class ProductRankBottom extends StatefulWidget {
  const ProductRankBottom({Key? key}) : super(key: key);

  @override
  _ProductRankBottomState createState() => _ProductRankBottomState();
}

class _ProductRankBottomState extends State<ProductRankBottom> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                Get.to(() => ProductRankPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

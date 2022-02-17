import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../style/Color.dart';
import '../product_rank_page.dart';

class ProductRankHead extends StatefulWidget {
  const ProductRankHead({Key? key}) : super(key: key);

  @override
  _ProductRankHeadState createState() => _ProductRankHeadState();
}

class _ProductRankHeadState extends State<ProductRankHead> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(10.w), topRight: Radius.circular(10.w)),
      child: Container(
        height: 120.w,
        color: AppColors.white,
        width: double.infinity,
        child: Column(
          children: [
            head(),
            ProductCategoryList(),
          ],
        ),
      ),
    );
  }

  Widget head() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 44.w,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 12.w,
            ),
            Image.asset(
              "assets/images/home/rank_icon.png",
              width: 16.w,
              height: 16.w,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              "商品排行榜",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
                child: SizedBox(
              width: 1,
            )),
            GestureDetector(
              child: Row(
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  Image.asset(
                    "assets/images/home/daily_new_arrow.png",
                    width: 7.w,
                    height: 12.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
          ],
        ),
      ),
      onTap: () {
        //TODO:跳转到每日新品列表
        Get.to(() => ProductRankPage());
      },
    );
  }
}

class ProductCategoryList extends StatefulWidget {
  const ProductCategoryList({Key? key}) : super(key: key);

  @override
  _ProductCategoryListState createState() => _ProductCategoryListState();
}

class _ProductCategoryListState extends State<ProductCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76.w,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 15.w, top: 0.w, bottom: 6.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductCategoryItemView(
              index: index,
            ),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12.w,
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class ProductCategoryItemView extends StatelessWidget {
  final int index;

  const ProductCategoryItemView({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: index == 0
              ? Image.asset(
                  "assets/images/home/rank_all_category.png",
                  width: 42.w,
                  height: 42.w,
                  fit: BoxFit.cover,
                )
              : CachedNetworkImage(
                  width: 42.w,
                  height: 42.w,
                  imageUrl:
                      "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          "アウター",
          style: TextStyle(
            color: AppColors.color_FF333333,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

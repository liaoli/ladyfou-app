import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../style/Color.dart';
import '../new_product_page.dart';

class DailyNewProduct extends StatefulWidget {
  const DailyNewProduct({Key? key}) : super(key: key);

  @override
  _DailyNewProductState createState() => _DailyNewProductState();
}

class _DailyNewProductState extends State<DailyNewProduct> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        height: 183.w,
        color: AppColors.white,
        width: double.infinity,
        child: Column(
          children: [
            head(),
            DailyNewProductList(),
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
              "assets/images/home/daily_new_icon.png",
              width: 16.w,
              height: 16.w,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              "NEW",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Container(
              height: 13.w,
              width: 1.w,
              color: AppColors.color_FFDADADA,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              "每日上新",
              style: TextStyle(
                color: AppColors.color_FF999999,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Expanded(
                child: SizedBox(
              width: 1,
            )),
            GestureDetector(
              child: Row(
                children: [
                  Text(
                    "立即查看",
                    style: TextStyle(
                      color: AppColors.color_FF999999,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
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
              onTap: () {
                //TODO:跳转到每日新品列表
              },
            ),
            SizedBox(
              width: 12.w,
            ),
          ],
        ),
      ),
      onTap: () {
        Get.to(() => NewProductPage());
      },
    );
  }
}

class DailyNewProductList extends StatelessWidget {
  const DailyNewProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 139.w,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 15.w, top: 0.w, bottom: 6.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: DailyNewProductItemView(),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12.w,
          );
        },
        itemCount: 5,
      ),
    );
  }
}

class DailyNewProductItemView extends StatelessWidget {
  const DailyNewProductItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          //剪裁为圆角矩形
          borderRadius: BorderRadius.circular(10.w),
          child: CachedNetworkImage(
            width: 86.w,
            height: 86.w,
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
          height: 6.w,
        ),
        Text(
          "4色展開スタン...",
          style: TextStyle(
            color: AppColors.color_FF666666,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 2.w,
        ),
        Text(
          "￥8687",
          style: TextStyle(
            color: AppColors.color_FF333333,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

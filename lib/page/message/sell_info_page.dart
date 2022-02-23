import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/circle_image.dart';
import 'package:ladyfou/components/round_rect_image.dart';
import 'package:ladyfou/page/detail/components/arrow_forward.dart';

import '../../components/button/common_button.dart';
import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import '../detail/product_detail_page.dart';

class SellInfoPage extends StatefulWidget {
  const SellInfoPage({Key? key}) : super(key: key);

  @override
  _SellInfoPageState createState() => _SellInfoPageState();
}

class _SellInfoPageState extends State<SellInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: "优惠信息情报",
      body: Column(
        children: [Expanded(child: refresh())],
      ),
    );
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.w,
      ),
      child: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        child: sellInfoList(),
      ),
    );
  }

  Widget sellInfoList() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.w,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: SellInfoItemView(),
            onTap: () {
              Get.to(() => ProductDetailPage());
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 12.w,
          );
        },
        itemCount: 2);
  }
}

class SellInfoItemView extends StatelessWidget {
  const SellInfoItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        padding: EdgeInsets.only(
          top: 12.w,
        ),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  "限时特惠正在热卖 >",
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "2020-12-25",
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
              ],
            ),
            SizedBox(
              height: 6.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Text(
                "百款服装正在售卖~",
                style: TextStyle(
                  color: AppColors.color_FF999999,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            RoundRectImage(
                borderRadius: BorderRadius.zero,
                height: 126.w,
                width: 351.w,
                url:
                    "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/614/d32/3d5/614d323d524f2537290680.jpg")
          ],
        ),
      ),
    );
  }
}

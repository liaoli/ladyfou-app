import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/circle_image.dart';
import 'package:ladyfou/components/line.dart';
import 'package:ladyfou/components/round_rect_image.dart';
import 'package:ladyfou/page/detail/components/arrow_forward.dart';

import '../../components/button/common_button.dart';
import '../../components/circular.dart';
import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import '../detail/product_detail_page.dart';

class CouponInfoPage extends StatefulWidget {
  const CouponInfoPage({Key? key}) : super(key: key);

  @override
  _CouponInfoPageState createState() => _CouponInfoPageState();
}

class _CouponInfoPageState extends State<CouponInfoPage> {
  List<int> coupon = [10, 20, 30];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: "优惠券信息",
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
        child: couponInfoList(),
      ),
    );
  }

  Widget couponInfoList() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.w,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: CouponInfoItemView(
              value: coupon[index],
            ),
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
        itemCount: coupon.length);
  }
}

class CouponInfoItemView extends StatelessWidget {
  final int value;

  const CouponInfoItemView({Key? key, required this.value})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Stack(
        children: [
          Container(
            width: 351.w,
            height: 92.w,
            padding: EdgeInsets.only(
              top: 0.w,
            ),
            color: AppColors.Color_E34D59,
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(new Radius.circular(10.w)),
                    child: Container(
                      height: 92.w,
                      color: AppColors.white,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 24.w,
                              ),
                              Text(
                                "$value",
                                style: TextStyle(
                                  color: AppColors.Color_E34D59,
                                  fontSize: 64,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 24.w,
                                  ),
                                  Text(
                                    "¥",
                                    style: TextStyle(
                                      color: AppColors.Color_E34D59,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Line(
                                height: 46.w,
                                width: 1.w,
                                color: AppColors.color_C4C4C4,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 23.w),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    button(text: "还有$value元优惠券未使用哦"),
                                    Text(
                                      "优惠券就要到期啦 >   2022-10-7",
                                      style: TextStyle(
                                        color: AppColors.color_FF333333,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 36.w,
                  height: 92.w,
                  padding: EdgeInsets.symmetric(vertical: 12.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: textChildren(),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 39.w,
            left: -7.w,
            child: Circular(
              width: 14.w,
              height: 14.w,
              color: AppColors.color_FFF5F5F5,
            ),
          ),
          Positioned(
            top: 39.w,
            right: 29.w,
            child: Circular(
              width: 14.w,
              height: 14.w,
              color: AppColors.Color_E34D59,
            ),
          )
        ],
      ),
    );
  }

  Widget button({required String text, Function()? onTab}) {
    return CommonButton(
      height: 24.w,
      width: 161.w,
      bg: AppColors.Color_E34D59,
      borderColor: AppColors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(12.w)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      onTap: onTab,
    );
  }

  List<Widget> textChildren() {
    String text = "点击使用";

    int length = text.length;

    List<String> textS = [];
    for (int i = 0; i < length; i++) {
      textS.add(text.substring(i, i + 1));
    }

    return textS.map((e) {
      return Text(
        e,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      );
    }).toList();
  }
}

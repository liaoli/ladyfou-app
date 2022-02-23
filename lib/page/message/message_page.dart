import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/circle_image.dart';
import 'package:ladyfou/components/round_rect_image.dart';

import '../../components/button/common_button.dart';
import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import '../detail/components/common_label.dart';


class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: "消息中心",
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
        child: commentList(),
      ),
    );
  }


  Widget commentList() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.w,
        ),
        itemBuilder: (context, index) {
          return ProductEvaluationItemView(
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 12.w,
          );
        },
        itemCount: 5);
  }
}

class ProductEvaluationItemView extends StatelessWidget {

  const ProductEvaluationItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        padding: EdgeInsets.all(12.w),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleImage(
                  url:
                      "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
                  size: 40.w,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "好人一生平安",
                      style: TextStyle(
                        color: AppColors.color_FF333333,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Text(
                      "2020-12-25",
                      style: TextStyle(
                        color: AppColors.color_FF999999,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                CommonButton(
                  borderRadius: new BorderRadius.all(Radius.circular(11.w)),
                  width: 98.w,
                  height: 22.w,
                  bg: AppColors.color_FFF5F5F5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "尺码：L   颜色：黑色",
                        style: TextStyle(
                          color: AppColors.color_FF666666,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.w,
            ),
            Text(
              "とても可愛いですすごくよいです，サイズもちょうどよく大人っぽいデザインで着心地も良いです。",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            Row(
              children: [
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
                Expanded(child: SizedBox()),

              ],
            ),
          ],
        ),
      ),
    );
  }

}



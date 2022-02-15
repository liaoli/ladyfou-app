import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/utils/date_util.dart';

class LimitedTimeDiscount extends StatefulWidget {
  const LimitedTimeDiscount({Key? key}) : super(key: key);

  @override
  _LimitedTimeDiscountState createState() => _LimitedTimeDiscountState();
}

class _LimitedTimeDiscountState extends State<LimitedTimeDiscount> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        height: 198.w,
        color: AppColors.white,
        width: double.infinity,
        child: Column(
          children: [
            head(),
            LimitDiscountList(),
          ],
        ),
      ),
    );
  }

  Container head() {
    return Container(
      height: 50.w,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/images/home/limit_time_discount_head_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 12.w,
          ),
          Text(
            "限时折扣",
            style: TextStyle(color: AppColors.white, fontSize: 14.sp),
          ),
          SizedBox(
            width: 12.w,
          ),
          DiscountCountdown(),
          Expanded(
              child: SizedBox(
            width: 1,
          )),
          Image.asset(
            "assets/images/home/limit_time_discount_arrow.png",
            width: 20.w,
            height: 20.w,
          ),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
    );
  }
}

class DiscountCountdown extends StatefulWidget {
  final int second;

  const DiscountCountdown({Key? key, this.second = 360000}) : super(key: key);

  @override
  _DiscountCountdownState createState() => _DiscountCountdownState();
}

class _DiscountCountdownState extends State<DiscountCountdown> {
  late Timer time;

  late int second;

  late DayHourMinSec dayHourMinSec;

  @override
  void initState() {
    second = widget.second;
    dayHourMinSec = getDayHourMinSec(second);

    time = Timer.periodic(Duration(seconds: 1), (timer) {
      if (second < 0) {
        timer.cancel();
      }
      second = second - 1;
      setState(() {
        dayHourMinSec = getDayHourMinSec(second);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        countItem(dayHourMinSec.formatDay),
        buildSizedBox(),
        textItem("天"),
        buildSizedBox(),
        countItem(dayHourMinSec.formatHour),
        buildSizedBox(),
        textItem("时"),
        buildSizedBox(),
        countItem(dayHourMinSec.formatMin),
        buildSizedBox(),
        textItem("分"),
        buildSizedBox(),
        countItem(dayHourMinSec.formatSec),
        buildSizedBox(),
        textItem("秒"),
      ],
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      width: 4.w,
    );
  }

  Text textItem(String text) {
    return Text(
      text,
      style: TextStyle(color: AppColors.white, fontSize: 10.sp),
    );
  }

  Widget countItem(String text) {
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(5.w)),
      child: Container(
        color: AppColors.white,
        width: 20.w,
        height: 20.w,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.Color_E34D59,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class LimitDiscountList extends StatelessWidget {
  const LimitDiscountList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 148.w,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 15.w, top: 12.w, bottom: 12.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: DiscountItemView(),
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

class DiscountItemView extends StatelessWidget {
  const DiscountItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          //剪裁为圆角矩形
          borderRadius: BorderRadius.circular(10.w),
          child: Stack(
            children: [

              CachedNetworkImage(
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

              Container(
                width: 28.w,
                height: 14.w,
                child: Center(
                  child: Text(
                    "50%",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.Color_E34D59,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.w),
                      bottomRight: Radius.circular(10.w)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4.w,
        ),
        Text(
          "￥4475",
          style: TextStyle(
            color: AppColors.Color_E34D59,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "￥8687",
          style: TextStyle(
            color: AppColors.color_FF353547,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}

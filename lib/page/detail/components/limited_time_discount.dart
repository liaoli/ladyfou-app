import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/utils/date_util.dart';

import '../../home/limit_time_discount_page.dart';

class LimitedTimeDiscount extends StatefulWidget {
  const LimitedTimeDiscount({Key? key}) : super(key: key);

  @override
  _LimitedTimeDiscountState createState() => _LimitedTimeDiscountState();
}

class _LimitedTimeDiscountState extends State<LimitedTimeDiscount> {
  @override
  Widget build(BuildContext context) {
    return head();
  }

  Widget head() {
    return GestureDetector(
      child: Container(
        height: 40.w,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/detail/limit_time_discount_bg.png'),
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
            Expanded(
                child: SizedBox(
              width: 1,
            )),
            Text(
              "最终截止时间至: ",
              style: TextStyle(color: AppColors.white, fontSize: 10.sp),
            ),
            DiscountCountdown(),
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
      ),
      onTap: () {
        Get.to(() => LimitTimeDiscountPage());
      },
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
      width: 2.w,
    );
  }

  Text textItem(String text) {
    return Text(
      text,
      style: TextStyle(color: AppColors.white, fontSize: 10.sp),
    );
  }

  Widget countItem(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 14.sp,
      ),
    );
  }
}

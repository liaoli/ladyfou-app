import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';
import 'arrow_forward.dart';
import 'delivery_content_view.dart';
import 'score_dialog_view.dart';

class HotCommentsView extends StatefulWidget {
  const HotCommentsView({Key? key}) : super(key: key);

  @override
  _HotCommentsViewState createState() => _HotCommentsViewState();
}

class _HotCommentsViewState extends State<HotCommentsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(new Radius.circular(10.w)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
          height: 120.w,
          color: AppColors.white,
          child: Column(
            children: [
              hotComments(),
              Expanded(child: SizedBox()),
              score(),
              Expanded(child: SizedBox()),
              delivery(),
            ],
          ),
        ),
      ),
    );
  }

  Widget hotComments() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "热评",
              style: TextStyle(
                color: AppColors.color_9A9AA3,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Expanded(
              child: Row(
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
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "4.5/5",
                    style: TextStyle(
                      color: AppColors.color_FF333333,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            ArrowForward(
              size: 16.w,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30.w,
            ),
            Text(
              "“衣服非常保暖~~样式还很好看！”",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget score() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          Text(
            "积分",
            style: TextStyle(
              color: AppColors.color_9A9AA3,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Image.asset("assets/images/detail/gold_coin.png"),
          Text(
            "P15",
            style: TextStyle(
              color: AppColors.color_F6AD2A,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Text(
            "ポイントは獲得できます",
            style: TextStyle(
              color: AppColors.color_FF666666,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(child: SizedBox()),
          ArrowForward(
            size: 16.w,
          ),
        ],
      ),
      onTap: () {
        YYDialogDemo(context);
      },
    );
  }

  Widget delivery() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          Text(
            "配送",
            style: TextStyle(
              color: AppColors.color_9A9AA3,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Text(
            "送料無料",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Text(
            "買い物は999円で送料無料です~",
            style: TextStyle(
              color: AppColors.color_FF666666,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(child: SizedBox()),
          ArrowForward(
            size: 16.w,
          ),
        ],
      ),
      onTap: () {
        showModalBottomSheet(
          // backgroundColor: AppColors.transparent,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.w),
          ),
          context: context,
          builder: (context) {
            return SizedBox(
              height: 335.w,
              child: ClipRRect(
                //剪裁为圆角矩形
                borderRadius: BorderRadius.circular(10.w),
                child: Container(
                  width: double.infinity,
                  height: 335.w,
                  color: AppColors.white,
                  alignment: Alignment.centerLeft,
                  child: DeliveryContentView(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  YYDialog YYDialogDemo(BuildContext context) {
    return YYDialog().build(context)
      ..width = 299.w
      ..height = 119.w
      ..borderRadius = 20.w
      ..widget(
        Padding(
          padding: EdgeInsets.all(0.0),
          child: ScoreDialogView(),
        ),
      )
      ..show();
  }
}

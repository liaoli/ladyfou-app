import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/button/common_button.dart';
import 'package:ladyfou/components/clicked_Image_asset.dart';

import '../../../style/Color.dart';

class ScoreDialogView extends StatelessWidget {
  const ScoreDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 299.w,
          height: 119.w,
          child: Column(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "获取条件",
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
                        "订单处于已付款状态",
                        style: TextStyle(
                          color: AppColors.color_FF333333,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "获取积分",
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
                        "20p",
                        style: TextStyle(
                          color: AppColors.color_F6AD2A,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              CommonButton(
                borderRadius: BorderRadius.all(Radius.circular(12.w)),
                bg: AppColors.color_FF999999,
                width: 275.w,
                height: 24.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "注意：已付款的商品会奖励对应积分数额",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
            ],
          ),
        ),
        Positioned(
          right: 6.w,
            top: 6.w,
            child: ClickedImageAsset(
          image: "assets/images/history/browsing_history_close.png",
          onTap: () {
            Navigator.pop(context);
          },
        ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/detail/components/arrow_forward.dart';
import 'package:ladyfou/style/Color.dart';

import '../../../components/clicked_Image_asset.dart';

class AttentionContentView extends StatefulWidget {
  const AttentionContentView({Key? key}) : super(key: key);

  @override
  _AttentionContentViewState createState() => _AttentionContentViewState();
}

class _AttentionContentViewState extends State<AttentionContentView> {
  @override
  Widget build(BuildContext context) {
    double bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return Container(
      color: AppColors.white,
      width: 375.w,
      child: Column(
        children: [
          head(),
          Container(
            width: double.infinity,
            height: 2.w,
            color: AppColors.color_FFF5F5F5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                item("支付问题", "支付问题回答及注意事项", showArrow: true),
                Column(
                  children: [
                    item("客服问题", "客服问题答案", showArrow: true),
                    SizedBox(
                      height: 6.w,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 12.w,
                        ),
                        buildClipOval("assets/images/detail/online.png"),
                        SizedBox(
                          width: 12.w,
                        ),
                        buildClipOval("assets/images/detail/mail.png"),
                        SizedBox(
                          width: 12.w,
                        ),
                        buildClipOval("assets/images/detail/phone.png"),
                      ],
                    )
                  ],
                ),
                item("个人问题", "个人问题回答及注意事项", showArrow: true),
              ],
            ),
          ),
          SizedBox(
            height: bottomBarHeight,
          ),
        ],
      ),
    );
  }

  ClipOval buildClipOval(String image) {
    return ClipOval(
      child: Container(
        width: 42.w,
        height: 42.w,
        color: AppColors.color_FFF5F5F5,
        child: Center(
          child: Image.asset(image),
        ),
      ),
    );
  }

  Widget item(String title, String content,
      {Color contentColor = AppColors.color_FF999999, bool showArrow = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(child: SizedBox()),
          Text(
            content,
            style: TextStyle(
              color: contentColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Visibility(
            visible: showArrow,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16.w,
              color: AppColors.color_FF333333,
            ),
          ),
        ],
      ),
    );
  }

  Widget head() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      height: 44.w,
      width: 375.w,
      child: Row(
        children: [
          Text(
            "注意事项",
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(child: SizedBox()),
          ClickedImageAsset(
            image: "assets/images/history/browsing_history_close.png",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

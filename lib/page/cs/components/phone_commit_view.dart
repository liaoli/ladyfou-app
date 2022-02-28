import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/button/common_button.dart';
import '../../../components/clicked_Image_asset.dart';
import '../../../style/Color.dart';

class PhoneCommitView extends StatefulWidget {
  final String phoneNumber;

  const PhoneCommitView({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _PhoneCommitViewState createState() => _PhoneCommitViewState();
}

class _PhoneCommitViewState extends State<PhoneCommitView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.w,
        horizontal: 12.w,
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "工作时间内可以即时与我们客服通讯",
                style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "*客服上班时间 10:00-12:00  至   2:00-5:00 星期六，星期天休息",
                style: TextStyle(
                    color: AppColors.color_FF666666,
                    fontSize: 10.w,
                    fontWeight: FontWeight.w400),
              ),
              button(
                  text: widget.phoneNumber,
                  textColor: AppColors.blue,
                  onTab: () {
                    //TODO:
                  }),

              button(
                  text: "取消",
                  onTab: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                height: 30.w,
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: ClickedImageAsset(
              image: "assets/images/history/browsing_history_close.png",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget button({required String text, Function()? onTab,Color textColor = AppColors.color_FF333333}) {
    return CommonButton(
      height: 32.w,
      width: 327.w,
      bg: AppColors.white,
      borderColor: AppColors.color_FF999999,
      borderRadius: BorderRadius.all(Radius.circular(16.w)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      onTap: onTab,
    );
  }
}

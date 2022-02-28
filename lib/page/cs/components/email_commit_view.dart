import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/button/common_button.dart';
import '../../../components/clicked_Image_asset.dart';
import '../../../style/Color.dart';

class EmailCommitView extends StatefulWidget {
  const EmailCommitView({Key? key}) : super(key: key);

  @override
  _EmailCommitViewState createState() => _EmailCommitViewState();
}

class _EmailCommitViewState extends State<EmailCommitView> {
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
              button(text: "复制邮箱号", onTab: () {}),
              button(text: "发送邮件", onTab: () {}),
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

  Widget button({required String text, Function()? onTab}) {
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
              color: AppColors.color_FF333333,
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/cs/components/cs_item_view.dart';
import 'package:ladyfou/page/cs/components/phone_commit_view.dart';

import '../../../components/line.dart';
import '../../../style/Color.dart';
import 'package:flutter/cupertino.dart' as cupertino;

import 'email_phone_view.dart';

class PhoneCommitItemView extends StatefulWidget {
  const PhoneCommitItemView({Key? key}) : super(key: key);

  @override
  _PhoneCommitItemViewState createState() => _PhoneCommitItemViewState();
}

class _PhoneCommitItemViewState extends State<PhoneCommitItemView> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "电话咨询",
              style: TextStyle(
                  color: AppColors.color_FF333333,
                  fontSize: 14.w,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 12.w,
            ),
            Text(
              "周内10：00-12：00，14：00-17：00，周末除外，均可以电话联系客服。",
              style: TextStyle(
                  color: AppColors.color_FF333333,
                  fontSize: 10.w,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 12.w,
            ),
            EmailPhoneView(
              title: "客服1号",
              content: "092622321513",
              onTab: (String email) {
                showBottomSheet(context,"092622321513");
              },
            ),
            SizedBox(
              height: 12.w,
            ),
            EmailPhoneView(
              title: "客服1号",
              content: "092622321513",
              onTab: (String email) {
                showBottomSheet(context,"092622321513");
              },
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context, String phone) {
    showModalBottomSheet(
      // backgroundColor: AppColors.transparent,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200.w,
          child: ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(10.w),
            child: Container(
              width: double.infinity,
              height: 200.w,
              color: AppColors.white,
              alignment: Alignment.centerLeft,
              child: PhoneCommitView(
                phoneNumber: phone,
              ),
            ),
          ),
        );
      },
    );
  }
}

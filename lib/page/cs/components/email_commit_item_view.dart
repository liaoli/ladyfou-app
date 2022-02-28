import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/cs/components/cs_item_view.dart';

import '../../../components/line.dart';
import '../../../style/Color.dart';
import 'package:flutter/cupertino.dart' as cupertino;

import 'email_commit_view.dart';
import 'email_phone_view.dart';

class EmailCommitItemView extends StatefulWidget {
  const EmailCommitItemView({Key? key}) : super(key: key);

  @override
  _EmailCommitItemViewState createState() => _EmailCommitItemViewState();
}

class _EmailCommitItemViewState extends State<EmailCommitItemView> {
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
              "邮件提问",
              style: TextStyle(
                  color: AppColors.color_FF333333,
                  fontSize: 14.w,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 12.w,
            ),
            Text(
              "在非客服上班时间您可以选中通过邮件进行咨询，邮件受理顺序按照发送顺序进行。",
              style: TextStyle(
                  color: AppColors.color_FF333333,
                  fontSize: 10.w,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 12.w,
            ),
            EmailPhoneView(
              title: "邮箱号",
              content: "2525@65523.com",
              onTab: (String email) {
                showModalBottomSheet(
                  // backgroundColor: AppColors.transparent,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 209.w,
                      child: ClipRRect(
                        //剪裁为圆角矩形
                        borderRadius: BorderRadius.circular(10.w),
                        child: Container(
                          width: double.infinity,
                          height: 209.w,
                          color: AppColors.white,
                          alignment: Alignment.centerLeft,
                          child: EmailCommitView(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget line() {
    return Padding(
      padding: cupertino.EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Line(
        color: AppColors.color_EAEAEA,
        height: 1.w,
      ),
    );
  }
}

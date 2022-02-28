import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/cs/components/cs_item_view.dart';

import '../../../components/line.dart';
import '../../../style/Color.dart';
import 'package:flutter/cupertino.dart' as cupertino;

class CSQuestionListView extends StatefulWidget {
  const CSQuestionListView({Key? key}) : super(key: key);

  @override
  _CSQuestionListViewState createState() => _CSQuestionListViewState();
}

class _CSQuestionListViewState extends State<CSQuestionListView> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
              child: Text(
                "常见问题",
                style: TextStyle(
                  color: AppColors.color_FF333333,
                  fontSize: 14.w,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            line(),
            CSItemView(
              title: "商品购买说明",
              onTap: () {},
            ),
            line(),
            CSItemView(
              title: "邮费及配送服务",
            ),
            line(),
            CSItemView(
              title: "积分常见问题",
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

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/base_scaffold.dart';
import '../../components/button/common_button.dart';
import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import 'components/cs_question_list_view.dart';
import 'components/cs_search_head.dart';
import 'components/email_commit_item_view.dart';
import 'components/phone_commit_item_view.dart';

class CSMainPage extends StatefulWidget {
  const CSMainPage({Key? key}) : super(key: key);

  @override
  _CSMainPageState createState() => _CSMainPageState();
}

class _CSMainPageState extends State<CSMainPage> {
  bool showCountdown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        leadType: AppBarBackType.Back,
        title: "客服中心",
        body: Column(
          children: [
            searchHead(),
            Expanded(
              child: refresh(),
            ),
          ],
        ));
  }

  Widget searchHead() {
    return CSSearchHead();
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        slivers: <Widget>[
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: questionList()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: emailCommit()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: phoneCommit()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: manualCS()),
        ],
      ),
    );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }

  Widget questionList() {
    return CSQuestionListView();
  }

  Widget emailCommit() {
    return EmailCommitItemView();
  }

  Widget phoneCommit() {
    return PhoneCommitItemView();
  }

  Widget manualCS() {
    return CommonButton(
      height: 43.w,
      width: 351.w,
      bg: AppColors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.w)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "人工客服",
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

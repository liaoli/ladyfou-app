import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/base_scaffold.dart';

import '../../core/constant/base_enum.dart';
import 'components/user_email_item_view.dart';
import 'components/user_name_item_view.dart';

class SettingUserInfoPage extends StatefulWidget {
  const SettingUserInfoPage({Key? key}) : super(key: key);

  @override
  _SettingUserInfoPageState createState() => _SettingUserInfoPageState();
}

class _SettingUserInfoPageState extends State<SettingUserInfoPage> {
  bool showCountdown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: "设 置",
      body: refresh(),
    );
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
          SliverToBoxAdapter(child: userNameItem()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: emailItem()),
        ],
      ),
    );
  }

  Widget userNameItem() {
    return UserNameItemView();
  }

  Widget emailItem() {
    return UserEmailItemView();
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}

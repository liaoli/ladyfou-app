import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/core/common/global.dart';
import 'package:ladyfou/core/constant/share_preference_key.dart';
import 'package:ladyfou/core/model/token_info_model.dart';
import 'package:ladyfou/core/utils/toast.dart';
import 'package:ladyfou/utils/sputils.dart';

import '../../components/button/common_button.dart';
import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import '../../utils/provider.dart';
import 'components/common_setting_view.dart';
import 'components/user_info_item_view.dart';

class SettingMainPage extends StatefulWidget {
  const SettingMainPage({Key? key}) : super(key: key);

  @override
  _SettingMainPageState createState() => _SettingMainPageState();
}

class _SettingMainPageState extends State<SettingMainPage> {
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
      body: Column(
        children: [
          Expanded(
            child: refresh(),
          ),
          CommonButton(
            height: 43.w,
            width: 351.w,
            bg: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "退出登录",
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            onTap: () {
              Global.logout().then((value) {
                ToastUtils.success("退出登录成功");

                if (!mounted) {
                  return;
                }
                Store.of<UserProfile>(context, listen: false).tokenInfoModel =
                    TokenInfoModel();
              });
            },
          ),
          SizedBox(
            height: 100.w,
          ),
        ],
      ),
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
          SliverToBoxAdapter(child: userInfoItem()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: commonSetting()),
        ],
      ),
    );
  }

  Widget userInfoItem() {
    return UserInfoItemView();
  }

  Widget commonSetting() {
    return CommonSettingView();
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}

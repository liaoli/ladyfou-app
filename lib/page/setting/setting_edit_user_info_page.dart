import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/clicked_Image_asset.dart';

import '../../components/button/common_button.dart';
import '../../components/sliver_header_delegate.dart';
import '../../components/web_view_page.dart';
import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import '../home/components/new_product_list.dart';
import '../home/components/recommend_product_bottom.dart';
import '../home/components/recommend_product_head.dart';
import '../home/components/recommend_product_list.dart';
import 'components/common_setting_view.dart';
import 'components/edit_password_item_view.dart';
import 'components/user_email_item_view.dart';
import 'components/user_info_item_view.dart';
import 'components/user_name_item_view.dart';

class SettingEditUserInfoPage extends StatefulWidget {
  const SettingEditUserInfoPage({Key? key}) : super(key: key);

  @override
  _SettingEditUserInfoPageState createState() =>
      _SettingEditUserInfoPageState();
}

class _SettingEditUserInfoPageState extends State<SettingEditUserInfoPage> {
  bool showCountdown = false;

  bool enable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: "密码修改",
      body: Column(
        children: [
          Expanded(child: refresh()),
          CommonButton(
            enable: enable,
            height: 43.w,
            width: 351.w,
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "确 认",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
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
          SliverToBoxAdapter(child: editPasswordItemView()),
        ],
      ),
    );
  }

  Widget editPasswordItemView() {
    return EditPasswordItemView();
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}

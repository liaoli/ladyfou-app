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
import '../login/components/login_text_field.dart';
import 'components/address_text_field.dart';
import 'components/address_view.dart';
import 'components/common_address_switch_view.dart';
import 'components/country_item_view.dart';
import 'components/name_phone_email_view.dart';

class AddressMainPage extends StatefulWidget {
  const AddressMainPage({Key? key}) : super(key: key);

  @override
  _AddressMainPageState createState() => _AddressMainPageState();
}

class _AddressMainPageState extends State<AddressMainPage> {
  bool showCountdown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: "配送地址",
      body: Column(
        children: [
          Expanded(child: refresh()),
          CommonButton(
            height: 33.w,
            width: 343.w,
            borderRadius: BorderRadius.all(Radius.circular(17.w)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "保 存",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 51.w,
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
          SliverToBoxAdapter(child: country()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: namePhoneEmail()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: addressView()),
          buildSliverToBoxAdapter(12.w),
          SliverToBoxAdapter(child: commonAddressSwitch()),
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

  Widget content() {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.w,
        ),
        child: Column(
          children: [
            AddressTextField(
                controller: TextEditingController(),
                title: "邮箱地址",
                prefixIcon: "assets/images/must.png",
                onChanged: (String text) {}),
          ],
        ));
  }

  Widget country() {
    return CountryItemView();
  }

  Widget namePhoneEmail() {
    return NamePhoneEmailView();
  }

  Widget addressView() {
    return AddressView();
  }

  Widget commonAddressSwitch() {
    return CommonAddressSwitchView();
  }
}

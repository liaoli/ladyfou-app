import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/core/utils/toast.dart';

import '../../components/button/common_button.dart';
import '../../core/constant/base_enum.dart';
import '../../core/http/request.dart';
import '../../style/Color.dart';
import 'components/address_text_field.dart';
import 'components/address_view.dart';
import 'components/common_address_switch_view.dart';
import 'components/country_item_view.dart';
import 'components/name_phone_email_view.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({Key? key}) : super(key: key);

  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  bool showCountdown = false;

  @override
  void initState() {


    getCountryList().then((value){
      ToastUtils.success(value.common.debugMessage);
     if(value.common.statusCode == 1000) {

     }else{

     }
    });

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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/page/setting/store/edit_user_info_provider.dart';
import 'package:provider/provider.dart';

import '../../components/button/common_button.dart';
import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import 'components/edit_password_item_view.dart';

class SettingEditUserInfoPage extends StatefulWidget {
  const SettingEditUserInfoPage({Key? key}) : super(key: key);

  @override
  _SettingEditUserInfoPageState createState() =>
      _SettingEditUserInfoPageState();
}

class _SettingEditUserInfoPageState extends State<SettingEditUserInfoPage> {
  bool showCountdown = false;

  bool enable = false;

  late EditUserUserInfoProvider provider;

  @override
  void initState() {
    provider = EditUserUserInfoProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: BaseScaffold(
        leadType: AppBarBackType.Back,
        title: "密码修改",
        body: Column(
          children: [
            Expanded(child: refresh()),
            sureButton(),
            SizedBox(
              height: 100.w,
            ),
          ],
        ),
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

class sureButton extends StatelessWidget {
  const sureButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditUserUserInfoProvider provider = Provider.of(
      context,
    );
    return CommonButton(
      onTap: () {

        provider.reset().then((value){

        });
      },
      enable: provider.enable,
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
    );
  }
}

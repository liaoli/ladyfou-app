import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/base_scaffold.dart';
import 'package:ladyfou/components/button/common_button.dart';
import 'package:ladyfou/core/model/my_address_list_model.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:provider/provider.dart';

import '../../core/constant/base_enum.dart';
import 'components/my_address_list_view.dart';
import 'edit_address_page.dart';
import 'store/my_address_provider.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  late MyAddressProvider provider;

  @override
  void initState() {
    provider = MyAddressProvider();

    provider.getData(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: BaseScaffold(
        leadType: AppBarBackType.Back,
        title: "我的地址",
        body: Column(
          children: [
            Expanded(child: refresh()),
            SizedBox(
              height: 20.w,
            ),
            CommonButton(
              height: 32.w,
              width: 327.w,
              bg: AppColors.Color_E34D59,
              borderColor: AppColors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(16.w)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/edit_white.png"),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "新增收货地址",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.to(() => EditAddressPage(model: AddressModel(),));
              },
            ),
            SizedBox(
              height: 45.w,
            )
          ],
        ),
      ),
    );
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12.w,
        horizontal: 12.w,
      ),
      child: EasyRefresh.custom(
          header: MaterialHeader(),
          onRefresh: () async {
            await provider.getData(context);
          },
          slivers: [
            MyAddressListView(),
          ]),
    );
  }
}

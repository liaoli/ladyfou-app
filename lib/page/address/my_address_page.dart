import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/base_scaffold.dart';

import '../../core/constant/base_enum.dart';
import '../../style/Color.dart';
import '../detail/product_detail_page.dart';
import 'edit_address_page.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  List<Address> address = [];

  @override
  void initState() {
    address.add(Address(isDefault: true));
    address.add(Address());
    address.add(Address());
    address.add(Address());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.Back,
      title: "我的地址",
      body: Column(
        children: [Expanded(child: refresh())],
      ),
    );
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.w,
      ),
      child: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        child: sellInfoList(),
      ),
    );
  }

  Widget sellInfoList() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.w,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: SellInfoItemView(
              address: address[index],
            ),
            onTap: () {
              // Get.to(() => ProductDetailPage());
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 12.w,
          );
        },
        itemCount: address.length);
  }
}

class SellInfoItemView extends StatelessWidget {
  final Address address;

  const SellInfoItemView({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.w,
        ),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "胡仁杰",
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "18258489316",
                  style: TextStyle(
                    color: AppColors.color_FF333333,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  child: Row(
                    children: [
                      Image.asset("assets/images/edit.png"),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "编辑",
                        style: TextStyle(
                          color: AppColors.color_FF333333,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.to(() => EditAddressPage());
                  },
                ),
              ],
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "科兴科学园B4单元1402鲸派电商",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 4.w,
            ),
            Row(
              children: [
                Visibility(
                  child: Row(
                    children: [
                      Image.asset("assets/images/selected.png"),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "默认地址",
                        style: TextStyle(
                          color: AppColors.color_FF999999,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                  visible: address.isDefault,
                ),
                Text(
                  address.address,
                  style: TextStyle(
                    color: AppColors.color_FF999999,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  child: Row(
                    children: [
                      Image.asset("assets/images/trash.png"),
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  ),
                  onTap: () {

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Address {
  bool isDefault;
  String address;
  String name;
  String phone;

  Address({
    this.isDefault = false,
    this.address = "广东省深圳市南山区粤海街道",
    this.name = "胡仁杰",
    this.phone = "18258489316",
  });
}

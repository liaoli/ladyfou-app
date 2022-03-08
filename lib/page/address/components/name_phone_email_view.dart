import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../style/Color.dart';
import '../store/edit_address_provider.dart';
import 'address_text_field.dart';

class NamePhoneEmailView extends StatefulWidget {
  const NamePhoneEmailView({Key? key}) : super(key: key);

  @override
  _NamePhoneEmailViewState createState() => _NamePhoneEmailViewState();
}

class _NamePhoneEmailViewState extends State<NamePhoneEmailView> {
  late EditAddressProvider editAddressProvider;

  @override
  Widget build(BuildContext context) {
    editAddressProvider = Provider.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        height: 212.w,
        color: AppColors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            AddressTextField(
            controller:editAddressProvider.name1Controller,
            title: "名前",
            prefixIcon: "assets/images/must.png",
            onChanged: (String text) {}),
        AddressTextField(
            controller: editAddressProvider.name2Controller,
            title: "名字",
            prefixIcon: "assets/images/must.png",
            onChanged: (String text) {}),
        AddressTextField(
            controller: editAddressProvider.phoneController,
            title: "电话番号",
            prefixIcon: "assets/images/must.png",
            onChanged: (String text) {},
        leftChild: Row(
          children: [
            Container(
              width: 1.w,
              height: 20.w,
              color: AppColors.color_FF333333,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "JP+81",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      AddressTextField(
          controller: editAddressProvider.emailController,
          title: "邮箱地址",
          prefixIcon: "assets/images/must.png",
          onChanged: (String text) {}),
      ],
    )),
    );
  }
}

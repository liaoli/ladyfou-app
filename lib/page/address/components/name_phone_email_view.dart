import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';
import 'address_text_field.dart';

class NamePhoneEmailView extends StatefulWidget {
  const NamePhoneEmailView({Key? key}) : super(key: key);

  @override
  _NamePhoneEmailViewState createState() => _NamePhoneEmailViewState();
}

class _NamePhoneEmailViewState extends State<NamePhoneEmailView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
          height: 212.w,
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddressTextField(
                  controller: controller,
                  title: "名前",
                  prefixIcon: "assets/images/must.png",
                  onChanged: (String text) {}),
              AddressTextField(
                  controller: controller,
                  title: "名字",
                  prefixIcon: "assets/images/must.png",
                  onChanged: (String text) {}),
              AddressTextField(
                controller: controller,
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
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              AddressTextField(
                  controller: controller,
                  title: "邮箱地址",
                  prefixIcon: "assets/images/must.png",
                  onChanged: (String text) {}),
            ],
          )),
    );
  }
}

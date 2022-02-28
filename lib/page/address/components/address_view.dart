import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';
import '../../detail/components/arrow_forward.dart';
import 'address_text_field.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
          height: 155.w,
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddressTextField(
                  controller: controller,
                  title: "邮箱番号",
                  prefixIcon: "assets/images/must.png",
                  onChanged: (String text) {}),
              AddressTextField(
                controller: controller,
                title: "都道府县",
                prefixIcon: "assets/images/must.png",
                onChanged: (String text) {},
                leftChild: ArrowForward(
                  size: 16.w,
                ),
              ),
              AddressTextField(
                  controller: controller,
                  title: "住所",
                  prefixIcon: "assets/images/must.png",
                  onChanged: (String text) {}),
            ],
          )),
    );
  }
}

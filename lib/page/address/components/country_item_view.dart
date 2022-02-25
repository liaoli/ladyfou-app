import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/detail/components/arrow_forward.dart';

import '../../../style/Color.dart';
import 'address_text_field.dart';

class CountryItemView extends StatefulWidget {
  const CountryItemView({Key? key}) : super(key: key);

  @override
  _CountryItemViewState createState() => _CountryItemViewState();
}

class _CountryItemViewState extends State<CountryItemView> {
  TextEditingController controller = TextEditingController(text: "Japan");

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        height: 49.w,
        color: AppColors.white,
        child: AddressTextField(
          controller: controller,
          title: "国/地域",
          prefixIcon: "assets/images/must.png",
          onChanged: (String text) {},
          leftChild: ArrowForward(
            size: 16.w,
          ),
        ),
      ),
    );
  }
}

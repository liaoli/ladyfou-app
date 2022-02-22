import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';
import 'comon_forward_item_view.dart';

class ColorAndSizeEntryView extends StatefulWidget {
  const ColorAndSizeEntryView({Key? key}) : super(key: key);

  @override
  _ColorAndSizeEntryViewState createState() => _ColorAndSizeEntryViewState();
}

class _ColorAndSizeEntryViewState extends State<ColorAndSizeEntryView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(new Radius.circular(10.w)),
        child: Container(
          height: 44.w,
          color: AppColors.white,
          child: CommonForwardItemView(
            title: "选择商品规格",
            subTitle: "选择",
          ),
        ),
      ),
    );
  }
}

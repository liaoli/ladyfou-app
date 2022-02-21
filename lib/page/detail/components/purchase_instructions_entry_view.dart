import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';
import 'comon_forward_item_view.dart';

class PurchaseInstructionsEntry extends StatefulWidget {
  const PurchaseInstructionsEntry({Key? key}) : super(key: key);

  @override
  _PurchaseInstructionsEntryState createState() => _PurchaseInstructionsEntryState();
}

class _PurchaseInstructionsEntryState extends State<PurchaseInstructionsEntry> {
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
            title: "购买说明",
            subTitle: "说明",
          ),
        ),
      ),
    );
  }
}

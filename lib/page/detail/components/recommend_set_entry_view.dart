import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/Color.dart';
import 'arrow_forward.dart';

class RecommendSetEntryView extends StatefulWidget {
  const RecommendSetEntryView({Key? key}) : super(key: key);

  @override
  _RecommendSetEntryViewState createState() => _RecommendSetEntryViewState();
}

class _RecommendSetEntryViewState extends State<RecommendSetEntryView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(new Radius.circular(10.w)),
        child: Container(
          height: 124.w,
          color: AppColors.white,
          padding: EdgeInsets.only(
            left: 12.w,
            top: 6.w,
            bottom: 6.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children(),
          ),
        ),
      ),
    );
  }

  List<Widget> children() {
    List<Widget> childs = [];

    List<int> datas = [1, 1, 1];

    List<Widget> result = datas.map((e) {
      return Row(
        children: [
          Text(
            "夏祭りの商品がよく売れています",
            style: TextStyle(
              color: AppColors.color_FF999999,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(child: SizedBox()),
          SizedBox(
            width: 3.w,
          ),
          ArrowForward(
            size: 16.w,
          ),
        ],
      );
    }).toList();

    childs.add(
      Text(
        "推荐特集",
        style: TextStyle(
          color: AppColors.color_FF333333,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    childs.addAll(result);

    return childs;
  }
}

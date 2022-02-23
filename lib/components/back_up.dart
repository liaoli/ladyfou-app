import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/Color.dart';

class ArrowBack extends StatefulWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  _ArrowBackState createState() => _ArrowBackState();
}

class _ArrowBackState extends State<ArrowBack> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
        child: Icon(
          Icons.arrow_back_ios,
          size: 20.w,
          color: AppColors.color_FF333333,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

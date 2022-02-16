import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

class HengFu extends StatefulWidget {
  const HengFu({Key? key}) : super(key: key);

  @override
  _HengFUState createState() => _HengFUState();
}

class _HengFUState extends State<HengFu> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: AppColors.white,
          height: 28.w,
          child: Row(
            children: [
              SizedBox(
                width: 12.w,
              ),
              Image.asset(
                "assets/images/home/home_volume.png",
                width: 20.w,
                height: 20.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "WINTER SALE 開催中！ ＞",
                style: TextStyle(
                  color: AppColors.Color_E34D59,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ));
  }
}

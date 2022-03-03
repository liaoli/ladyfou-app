import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

class RecommendProductBottom extends StatelessWidget {
  const RecommendProductBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.w,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 12.w,
          ),
          Image.asset(
            "assets/images/home/your_like_bottom.png",
            width: 16.w,
            height: 16.w,
          ),
          Row(
            children: [
              Expanded(
                child: buildLine(),
              ),
              SizedBox(
                width: 12.w,
              ),
              Row(
                children: [
                  Text(
                    "已经刷到底部了！看看其他的吧",
                    style: TextStyle(
                      color: AppColors.color_FF666666,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: buildLine(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLine() => Image.asset(
        "assets/images/home/recommend_bottom_line.png",
        fit: BoxFit.fitWidth,
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

import '../utils/common_util.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;

  SearchBar({Key? key, this.placeholder = "Search", required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(12),
      height: 28.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.white, width: 0.33),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14)),
      child: TextField(
        autofocus: false,
        onChanged: (value) {},
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.color_FF999999,
            ),
            suffixIcon: Offstage(
              offstage: controller.text.isEmpty,
              child: InkWell(
                onTap: () {
                  controller.clear();
                },
                child: Icon(
                  Icons.cancel,
                  color: AppColors.color_FF999999,
                ),
              ),
            ),
            border: InputBorder.none,
            hintText: "当前热搜词",
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.color_FF999999,
                fontSize: 14.sp)),
      ),
    );
  }
}

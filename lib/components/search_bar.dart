import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;

  SearchBar({Key? key, this.placeholder = "Search", required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.w),
        height: 66.w,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12)),
            child: Stack(
              children: [
                Positioned(
                  top: 10.w,
                  left: 10.w,
                  child: new SvgPicture.asset('assets/images/icon_search.svg'),
                ),
                Positioned(
                  top: 0.w,
                  left: 30.w,
                  right: 10.w,
                  bottom: 1.w,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                        fontFamily: "Seravek"),
                    controller: controller,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: this.placeholder,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.transparent),
                      ),
                      //获得焦点下划线设为蓝色
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.transparent)),
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Seravek"),
                    ),
                  ),
                ),
              ],
            )));
  }
}

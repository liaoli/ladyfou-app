import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

class HorizontalScrollTabBar extends StatefulWidget {
  final List<TabData> dataS;

  final ValueSetter<TabData>? onTap;

  const HorizontalScrollTabBar({
    Key? key,
    required this.dataS,
    required this.onTap,
  }) : super(key: key);

  @override
  _HorizontalScrollTabBarState createState() => _HorizontalScrollTabBarState();
}

class _HorizontalScrollTabBarState extends State<HorizontalScrollTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabS(),
      ),
    );
  }

  List<Widget> tabS() {
    return widget.dataS.map((e) {
      return InkWell(
        child: Column(
          children: [
            SizedBox(
              height: 5.w,
            ),
            Text(
              e.title,
              style: myTextStyle(
                color: e.getTextColor(),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 2.w,
            ),
            Container(
              width: 10.w,
              height: 2.w,
              decoration: BoxDecoration(
                color: e.getLineColor(),
                borderRadius: BorderRadius.all(
                  Radius.circular(2.w),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          widget.dataS.forEach((element) {
            element.selected = false;
          });
          e.selected = true;
          if (widget.onTap != null) {
            widget.onTap!(e);
          }
          setState(() {});
        },
      );
    }).toList();
  }
}

class TabData {
  String title;
  bool selected;
  int index;
  Color selectedLineColor;
  Color defaultLineColor;

  Color selectedTextColor;
  Color defaultTextColor;

  TabData({
    required this.title,
    this.selected = false,
    required this.index,
    this.defaultLineColor = AppColors.transparent,
    this.selectedLineColor = AppColors.black,
    this.defaultTextColor = AppColors.black,
    this.selectedTextColor = AppColors.black,
  });

  Color getLineColor() {
    return selected ? selectedLineColor : defaultLineColor;
  }

  Color getTextColor() {
    return selected ? selectedTextColor : defaultTextColor;
  }
}

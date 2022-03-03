import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

import '../../utils/provider.dart';

class MyBlurBottomView extends StatefulWidget {
  final bool showSelectedLabels;
  final bool showUnselectedLabels;
  final VoidCallback? onClick;
  final double filterX;
  final double filterY;
  final double opacity;
  final Color backgroundColor;
  final BottomNavigationBarType bottomNavigationBarType;
  final int currentIndex;
  final List<TabBarModel> tabModels;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Function(int) onIndexChange;

  const MyBlurBottomView(
      {Key? key,
      this.showSelectedLabels = false,
      this.showUnselectedLabels = false,
      this.onClick,
      this.filterX = 5.0,
      this.filterY = 10.0,
      this.opacity = 0.8,
      this.backgroundColor = Colors.white,
      this.bottomNavigationBarType = BottomNavigationBarType.fixed,
      this.currentIndex = 0,
      required this.onIndexChange,
      required this.tabModels,
      this.selectedItemColor = Colors.blue,
      this.unselectedItemColor = Colors.white})
      : super(key: key);

  @override
  _MyBlurBottomViewState createState() => _MyBlurBottomViewState();
}

class _MyBlurBottomViewState extends State<MyBlurBottomView> {
  @override
  Widget build(BuildContext context) {
    double bottomLength = MediaQuery.of(context).padding.bottom;

    AppStatus appStatus = Store.of<AppStatus>(context, listen: true);

    widget.tabModels.forEach((e) {
      e.selected = false;
    });

    widget.tabModels[appStatus.tabIndex].selected = true;

    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.filterX,
            sigmaY: widget.filterY,
          ),
          child: Opacity(
            opacity: widget.opacity,
            child: Container(
              padding: EdgeInsets.only(bottom: bottomLength),
              color: AppColors.white,
              height: 60.w + bottomLength,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: children(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> children() {
    List<Widget> tabs = [];

    for (int i = 0; i < widget.tabModels.length; i++) {
      TabBarModel e = widget.tabModels[i];
      tabs.add(GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              e.getIcon(),
              width: e.size,
              height: e.size,
            ),
            Text(
              e.title,
              style: TextStyle(
                color: e.getTextColor(),
                fontSize: 14,
              ),
            )
          ],
        ),
        onTap: () {
          widget.tabModels.forEach((e) {
            e.selected = false;
          });

          setState(() {
            e.selected = true;
          });
          if (widget.onIndexChange != null) widget.onIndexChange(i);
        },
      ));
    }

    return tabs;
  }
}

class TabBarModel {
  String defaultImg;
  String selectedImg;
  double size;
  bool selected;
  String title;
  int? notify;
  Color defaultTextColor;
  Color selectedTextColor;

  TabBarModel({
    required this.defaultImg,
    required this.selectedImg,
    required this.size,
    this.selected = false,
    this.title = "",
    this.notify,
    this.selectedTextColor = AppColors.Color_E34D59,
    this.defaultTextColor = AppColors.color_FF333333,
  });

  Color getTextColor() {
    return selected ? selectedTextColor : defaultTextColor;
  }

  String getIcon() {
    return selected ? selectedImg : defaultImg;
  }
}

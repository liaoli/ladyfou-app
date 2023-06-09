/*
 * @Descripttion: TODO
 * @FileName: category_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 5:12 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/model/sort_model.dart';

import '../../../style/Color.dart';
import '../../../style/text.dart';

class CategoryWidget extends StatefulWidget {
  final List<SortModel> items;
  final double itemHeight;
  final double? showHeight; // 显示区域高度
  final ValueChanged<int>? menueTaped; // 滚动第几个
  CategoryWidget(
      {Key? key,
      required this.items,
      this.itemHeight = 60,
      this.showHeight,
      this.menueTaped})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CategoryMenueState();
}

class CategoryMenueState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  int currentItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      removeBottom: true,
      context: context,
      child: Container(
        color: AppColors.primaryBackground,
        width: 100.w,
        height: widget.showHeight,
        padding: EdgeInsets.only(left: 10.w, right: 5.w, top: 10.w),
        child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (condex, index) {
              return InkWell(
                onTap: () => _menueTaped(index),
                child: Container(
                  height: widget.itemHeight,
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: index == 0
                        ? BorderRadius.only(
                            topLeft: Radius.circular(10.w),
                            topRight: Radius.circular(10.w))
                        : index + 1 == widget.items.length
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(10.w),
                                bottomRight: Radius.circular(10.w))
                            : BorderRadius.all(Radius.circular(0.w)),
                  ),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 2.w, bottom: 3.w),
                      decoration: BoxDecoration(
                        color: currentItemIndex == index
                            ? Colors.red
                            : Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.itemHeight / 2)),
                      ),
                      child: Text(
                        widget.items[index].name2,
                        style: BaseText.style(
                          fontSize: 14,
                          color: currentItemIndex == index
                              ? Colors.white
                              : AppColors.primaryBlackText,
                          fontWeight: currentItemIndex == index
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  _menueTaped(int i) {
    widget.menueTaped!(i);
    moveToTap(i);
  }

  moveToTap(int i) {
    double begin = currentItemIndex * widget.itemHeight;
    double end = i * widget.itemHeight;
    // print('begin' + begin.toString() + "-----" + end.toString());
    animation = Tween(begin: begin, end: end)
        .animate(new CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.addStatusListener((status) {
      if (AnimationStatus.completed == status) {
        //  print(currentItemIndex);
        currentItemIndex = i;
      }
    });

    controller.forward(from: 0);
  }

  initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    animation = Tween(begin: 0.0, end: 0.0).animate(controller);
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

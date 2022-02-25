/*
 * @Descripttion: TODO
 * @FileName: right_category_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 5:34 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/model/sort_model.dart';
import 'package:ladyfou/page/sort/components/right_category_item_widget.dart';

import '../../../style/Color.dart';

class RightListView extends StatefulWidget {
  final double height;
  final List<SortModel> dataItems;
  final ValueChanged<int>? listViewChanged;

  RightListView(
      {Key? key,
      required this.height,
      required this.dataItems,
      this.listViewChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => RightListViewState();
}

class RightListViewState extends State<RightListView> {
  int currentPage = 0;
  bool isAnimating = false;
  int itemCount = 0;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    itemCount = widget.dataItems.length;
    return Expanded(
      child: MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: Container(
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.w),
          color: AppColors.primaryBackground,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            //禁用手动滑动，于是有了上面的注释
            padding: EdgeInsets.all(0),
            controller: controller,
            itemBuilder: _itembuilder,
            itemCount: itemCount,
            itemExtent: widget.height,
          ),
        ),
      ),

      // ),
    );
  }

  Widget _itembuilder(BuildContext context, int index) {
    var data = widget.dataItems[index];
    return SubCategoryList(data: data, height: widget.height, goPage: goPage);
  }

  void goPage(String tag) {
    if (this.isAnimating) return;
    if (tag == 'pre') {
      if (currentPage == 0) {
        return;
      } else {
        currentPage--;
      }
    } else {
      if (currentPage == itemCount - 1) {
        return;
      } else {
        currentPage++;
      }
    }
    widget.listViewChanged!(currentPage);
    animateTopage(currentPage);
  }

  jumpTopage(int i) {
    currentPage = i;
    double offset = widget.height * i;
    this.controller.jumpTo(offset);
  }

  animateTopage(int i) {
    if (this.isAnimating) return;
    currentPage = i;
    this.isAnimating = true;
    double offset = widget.height * i;
    this
        .controller
        .animateTo(offset,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut)
        .then((onValue) => this.isAnimating = false);
  }
}

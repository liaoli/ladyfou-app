/*
 * @Descripttion: TODO
 * @FileName: right_category_item_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 5:37 PM
 * @LastEditors: tang
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/model/sort_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/image_placehold_widget.dart';
import '../../../style/Color.dart';
import '../../../style/text.dart';

class SubCategoryList extends StatefulWidget {
  final double height;
  final SortModel data;
  final void Function(String)? goPage;
  SubCategoryList({Key? key,required this.height, this.goPage, required this.data})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SubCategoryListState();
}

class SubCategoryListState extends State<SubCategoryList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: this.dragend,
      child: Container(
        height: widget.height,
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 16),
            controller: controller,
            child: Container(
              child: widget.data != null
                  ? SecondryCategory(
                data: widget.data,
              )
                  : Center(
                child: CircularProgressIndicator(),
              ),
              constraints: BoxConstraints(minHeight: widget.height + 5),
            )),
      ),
    );
  }

  dragend(e) {
    double offset = controller.offset;
    double maxExtentLenght = controller.position.maxScrollExtent;

    if (offset < -50) {
      widget.goPage!('pre');
    }

    if (offset - maxExtentLenght > 50) {
      widget.goPage!('next');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SecondryCategory extends StatelessWidget {
  final SortModel data;

  SecondryCategory({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SortDataChild> items = data.children;

    final _childAspectRatio = 136.sp / (88.sp + 23.sp);

    return Column(
      children: <Widget>[
        ImagePlaceholdWidget(url: data.thumb, w: 506, h: 90.sp),
        this.data.name.isEmpty
            ? SizedBox(height: 13)
            : Container(
          height: 46,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/images/sort/sort_section_title_icon.png'),
              Container(
                margin: EdgeInsets.only(left: 8.sp, right: 8.sp),
                constraints: BoxConstraints(
                  maxWidth: 410.sp,
                ),
                child: AutoSizeText(
                  this.data.name,
                  style: BaseText.style(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryBlackText,
                      fontSize: 14),
                  minFontSize: 10,
                  maxFontSize: 14,
                  maxLines: 1,
                ),
              ),
              Image.asset(
                'assets/images/sort/sort_section_title_icon.png',
              ),
            ],
          ),
        ),
        GridView.builder(
          padding: EdgeInsets.only(
              left: 32.sp, right: 32.sp),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 50.sp,
            mainAxisSpacing: 52.sp,
            childAspectRatio: _childAspectRatio,
          ),
          itemCount: items.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _goodsItemWidget(context, items[index]);
          },
        ),
      ],
    );
  }

  Widget _goodsItemWidget(BuildContext context, SortDataChild goodModel) {
    return GestureDetector(
      onTap: () {
        String titleStr = Uri.encodeComponent(goodModel.name);
        /// 跳转搜索
        // BaseNavigation.present("search?id=$titleStr");
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 12.sp),
              height: 88.sp,
              width: 88.sp,
              child: ImagePlaceholdWidget(url: goodModel.thumb),
            ),
            Text(
              goodModel.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: BaseText.style(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlackText),
            )
          ],
        ),
      ),
    );
  }
}
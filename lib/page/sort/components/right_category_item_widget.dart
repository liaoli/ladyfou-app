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
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ladyfou/core/model/sort_model.dart';
import 'package:flutter/material.dart';
import 'package:ladyfou/page/sort/page/goods_list_page.dart';

import '../../../components/image_placehold_widget.dart';
import '../../../style/Color.dart';
import '../../../style/text.dart';

class SubCategoryList extends StatefulWidget {
  final double height;
  final SortModel data;
  final void Function(String)? goPage;
  SubCategoryList(
      {Key? key, required this.height, this.goPage, required this.data})
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
            padding: EdgeInsets.only(top: 16.sp),
            controller: controller,
            child: Container(
              child: widget.data != null
                  ? SecondryCategory(
                      data: widget.data,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              constraints: BoxConstraints(minHeight: widget.height + 5.sp),
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

    final _childAspectRatio = 68.sp / (44.sp + 23.sp);

    return Column(
      children: <Widget>[
        // ImagePlaceholdWidget(url: data.thumb, w: 506, h: 90.sp),
        this.data.name2.isEmpty
            ? SizedBox(height: 13.sp)
            : Container(
                height: 46.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image.asset(
                    //     'assets/images/sort/sort_section_title_icon.png'),
                    Container(
                      margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                      constraints: BoxConstraints(
                        maxWidth: 205.sp,
                      ),
                      child: AutoSizeText(
                        this.data.name2,
                        textAlign: TextAlign.left,
                        style: BaseText.style(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryBlackText,
                            fontSize: 14),
                        minFontSize: 10,
                        maxFontSize: 14,
                        maxLines: 1,
                      ),
                    ),
                    // Image.asset(
                    //   'assets/images/sort/sort_section_title_icon.png',
                    // ),
                    Container(
                      child: GestureDetector(
                        onTap: ()=>{
                          Get.to(() => GoodsListPage(shopId: data.id, title: data.name2))
                        },
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'All',
                                style: BaseText.style(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryBlackText,
                                    fontSize: 14),
                              ),
                            ),
                            Image.asset("assets/images/sort/fi_chevron-right.png"),
                            SizedBox(width: 20.sp),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        GridView.builder(
          padding: EdgeInsets.only(left: 8.sp, right: 8.sp),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 25.sp,
            mainAxisSpacing: 26.sp,
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
        String titleStr = Uri.encodeComponent(goodModel.name2);
        Get.to(() => GoodsListPage(shopId: goodModel.id, title: goodModel.name2));
        /// 跳转搜索
        // BaseNavigation.present("search?id=$titleStr");
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 6.sp),
              height: 54.sp,
              width: 54.sp,
              child: ImagePlaceholdWidget(url: goodModel.thumb),
            ),
            Text(
              goodModel.name2,
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

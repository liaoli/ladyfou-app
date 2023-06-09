/*
 * @Descripttion: TODO
 * @FileName: right_category_item_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 5:37 PM
 * @LastEditors: tang
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ladyfou/core/model/sort_model.dart';
import 'package:flutter/material.dart';
import 'package:ladyfou/page/sort/page/goods_list_page.dart';

import '../../../components/base_image_load.dart';
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
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.w),
                topRight: Radius.circular(10.w))),
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 5.w),
            controller: controller,
            child: Container(
              child: widget.data != null
                  ? SecondryCategory(
                      data: widget.data,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              constraints: BoxConstraints(minHeight: widget.height + 5.w),
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

    final _childAspectRatio = 68.w / (50.w + 25.w);

    return Column(
      children: <Widget>[
        // ImagePlaceholdWidget(url: data.thumb, w: 506.w, h: 90.w),
        this.data.name2.isEmpty
            ? SizedBox(height: 13.w)
            : Container(
                height: 46.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image.asset(
                    //     'assets/images/sort/sort_section_title_icon.png'),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, right: 20.w),
                      constraints: BoxConstraints(
                        maxWidth: 205.w,
                      ),
                      child: AutoSizeText(
                        this.data.name2,
                        textAlign: TextAlign.left,
                        style: BaseText.style(
                            fontWeight: FontWeight.w700,
                            color: AppColors.color_FF333333,
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
                        onTap: () => {
                          Get.to(() =>
                              GoodsListPage(shopId: data.id, title: data.name2))
                        },
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'All',
                                style: BaseText.style(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.color_FF666666,
                                    fontSize: 14.sp),
                              ),
                            ),
                            Image.asset(
                                "assets/images/sort/fi_chevron-right.png"),
                            SizedBox(width: 20.w),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        GridView.builder(
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.w,
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
        Get.to(
            () => GoodsListPage(shopId: data.id, title: goodModel.name2));

        /// 跳转搜索
        // BaseNavigation.present("search?id=$titleStr");
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(new Radius.circular(5.w)),
              child: CachedNetworkImage(
                height: 50.w,
                width: 50.w,
                imageUrl:
                    data.thumb,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 2.w),
            Container(
              child: Text(
                goodModel.name2,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: BaseText.style(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.color_FF3F3F3F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

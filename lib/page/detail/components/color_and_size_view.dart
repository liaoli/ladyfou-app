import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/components/common_label.dart';
import 'package:ladyfou/page/detail/components/detail_bottom_view.dart';
import 'package:provider/provider.dart';

import '../../../components/button/common_button.dart';
import '../../../components/clicked_Image_asset.dart';
import '../../../components/count_edit_view.dart';
import '../../../core/model/product_detail_model.dart';
import '../../../style/Color.dart';
import '../store/select_color_size_provider.dart';

class ColorAndSizeView extends StatefulWidget {
  final ProductDetailModel detailModel;

  const ColorAndSizeView({Key? key, required this.detailModel})
      : super(key: key);

  @override
  _ColorAndSizeViewState createState() => _ColorAndSizeViewState();
}

class _ColorAndSizeViewState extends State<ColorAndSizeView> {
  late SelectColorSizeProvider provider;

  @override
  void initState() {
    provider = SelectColorSizeProvider(productDetailModel: widget.detailModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Container(
        child: Column(
          children: [
            head(),
            Container(
              width: double.infinity,
              height: 2.w,
              color: AppColors.color_FFF5F5F5,
            ),
            Expanded(child: refresh()),
            count(),
            DetailBottomView(),
          ],
        ),
      ),
    );
  }

  Widget head() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(
            12.w,
          ),
          height: 104.w,
          width: 375.w,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(new Radius.circular(10.w)),
                child: CachedNetworkImage(
                  width: 80.w,
                  height: 80.w,
                  imageUrl: provider.featureImg(),
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
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "￥${provider.productDetailModel.price}",
                        style: TextStyle(
                          color: AppColors.Color_E34D59,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      CommonButton(
                        borderRadius:
                            new BorderRadius.all(Radius.circular(17.w)),
                        width: 32.w,
                        height: 12.w,
                        bg: AppColors.Color_E34D59,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${provider.productDetailModel.discount}",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  Text(
                    "请选择：尺码、颜色",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.color_FF030319,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          child: ClickedImageAsset(
            image: "assets/images/history/browsing_history_close.png",
            onTap: () {
              Navigator.pop(context);
            },
          ),
          right: 12.w,
          top: 12.w,
        ),
      ],
    );
  }

  Widget refresh() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: EasyRefresh.custom(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          onRefresh: () async {},
          slivers: <Widget>[
            sliverSizeBox(6.w),
            sliverText("颜色"),
            sliverSizeBox(12.w),
            color(),
            sliverSizeBox(12.w),
            sliverText("尺寸"),
            sliverSizeBox(12.w),
            size(),
          ]),
    );
  }

  SliverToBoxAdapter sliverText(String text) {
    return SliverToBoxAdapter(
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.color_FF333333,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  SliverToBoxAdapter sliverSizeBox(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }

  // Widget color() {
  //   return SliverGrid(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 5, //Grid按两列显示
  //       mainAxisSpacing: 12.w,
  //       crossAxisSpacing: 12.w,
  //       childAspectRatio: 1 / 1,
  //     ),
  //     delegate: SliverChildBuilderDelegate(
  //       (BuildContext context, int index) {
  //         //创建子widget
  //         return ClipRRect(
  //           borderRadius: BorderRadius.all(new Radius.circular(10.w)),
  //           child: CachedNetworkImage(
  //             width: 60.w,
  //             height: 60.w,
  //             imageUrl:
  //                 "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
  //             imageBuilder: (context, imageProvider) => Container(
  //               decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                   image: imageProvider,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             placeholder: (context, url) => Center(
  //               child: SizedBox(
  //                 width: 20.w,
  //                 height: 20.w,
  //                 child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
  //               ),
  //             ),
  //             errorWidget: (context, url, error) => Icon(Icons.error),
  //           ),
  //         );
  //       },
  //       childCount: 3,
  //     ),
  //   );
  // }

  Widget color() {
    List<CommonLabelData<Value>> colorLabel = provider.getColorList();

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, //Grid按两列显示
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
        childAspectRatio: 1 / 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          //创建子widget
          CommonLabelData item = colorLabel[index];
          //创建子widget
          return GestureDetector(
            child: CommonLabel(model: item),
            onTap: () {
              colorLabel.forEach((element) {
                element.isSelected = false;
              });
              item.isSelected = true;

              setState(() {});
            },
          );
        },
        childCount: colorLabel.length,
      ),
    );
  }

  Widget size() {
    List<CommonLabelData<Value>> sizeLabel = provider.getSizeList();

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, //Grid按两列显示
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
        childAspectRatio: 2 / 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          CommonLabelData item = sizeLabel[index];
          //创建子widget
          return GestureDetector(
            child: CommonLabel(model: item),
            onTap: () {
              sizeLabel.forEach((element) {
                element.isSelected = false;
              });
              item.isSelected = true;

              setState(() {});
            },
          );
        },
        childCount: sizeLabel.length,
      ),
    );
  }

  Widget count() {
    return Padding(
      padding:
          EdgeInsets.only(left: 12.w, right: 12.w, top: 20.w, bottom: 30.w),
      child: Row(
        children: [
          Text(
            "数量",
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(child: SizedBox()),
          CountEditView(),
        ],
      ),
    );
  }
}

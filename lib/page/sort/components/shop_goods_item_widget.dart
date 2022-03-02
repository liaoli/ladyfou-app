/*
 * @Descripttion: TODO
 * @FileName: shop_goods_item_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/16/22 10:21 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/model/good_info_model.dart';
import 'package:ladyfou/core/utils/utils.dart';
import 'package:ladyfou/page/sort/components/shop_gradient_button.dart';
import 'package:ladyfou/page/sort/components/shop_management_options.dart';

import '../../../components/base_image_load.dart';
import '../../../core/constant/event_bus.dart';
import '../../../core/utils/event.dart';
import '../../../style/Color.dart';
import '../../../style/text.dart';

typedef CallBackWidget = void Function();

class ShopGoodsItem extends StatefulWidget {
  // 点击整个item
  final VoidCallback? onItemClick;

  // 点击喜欢
  final CallBackWidget onItemLikeClick;

  // 点击更多
  final VoidCallback? onItemMoreClick;

  // 数据model
  GoodsInfoModel goodsModel;

  bool isShowLike;

  ShopGoodsItem(
      {Key? key,
      required this.goodsModel,
      this.onItemClick,
      required this.onItemLikeClick,
      this.onItemMoreClick,
      this.isShowLike = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShopGoodsItemState();
  }
}

class _ShopGoodsItemState extends State<ShopGoodsItem> {
  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();
  var eventBusFn;
  bool isListen = false;

  @override
  void initState() {
    /// : implement initState
    super.initState();

    XEvent.on(EVENT_KEY_WISHED, (WishedModelReq event) {
      bool isWished = widget.goodsModel.isWished;
      if (event.id == widget.goodsModel.id) {
        isWished = event.isWished;
        widget.goodsModel.isWished = isWished;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    /// : implement dispose

    // XEvent.cancelAll(EVENT_KEY_WISHED);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onItemClick,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// 图片模块
            _imageItem(context),

            /// 标题文字模块
            _titleItem(context),

            /// 原价
            _newItem(context),

            /// 价格
            _priceItem(context),

            /// 评分
            _ratationItem(context),
          ],
        ),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  /// 图片模块
  Widget _imageItem(BuildContext context) {
    return Stack(children: [
      // Image.asset(
      //   'assets/images/mine/test_item.png',
      //   width: double.infinity,
      //   fit: BoxFit.fill,
      // ),

      Container(
        constraints: BoxConstraints(
          minHeight: 128.w,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(new Radius.circular(5.w)),
          child: BaseImageLoading(
            imgError: () {
              Future.delayed(Duration(milliseconds: 100)).then((e) {
                setState(() {
                  widget.isShowLike = false;
                });
                // _bloc.changeIsLike(widget.isShowLike);
              });
            },
            url: /*widget.goodsModel.fThumb*/'http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg',
            width: double.infinity,
            placehold: 'assets/images/home/banner_placehold.png',
          ),
        ),
      ),
    ]);
  }

  /// 文字标题模块
  Widget _titleItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <InlineSpan>[
              TextSpan(
                text: widget.goodsModel.name,
                style: BaseText.style(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlackText),
                // recognizer: tapGestureRecognizer
                //   ..onTap = () {
                //     print('111');
                //   }
              ),
            ]),
      ),
    );
  }

  /// 原价
  Widget _newItem(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.w),
        child: Row(
          children: [
            GradientButton(
              width: 50.w,
              height: 20.w,
              fontWeight: FontWeight.bold,
              text: widget.goodsModel.discount,
            ),
            SizedBox(width: 10.w),
            double.parse(widget.goodsModel.listPrice) > 0.0
                ? Text(
                    '￥' +
                        Utils.formatStepCount(
                            double.parse(widget.goodsModel.listPrice)), // 商品原价
                    style: BaseText.style(
                        fontSize: 10.0.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryBlackText.withOpacity(0.5),
                        decoration: TextDecoration.lineThrough),
                  )
                : SizedBox(),
          ],
        ));
  }

  /// 价格模块
  Widget _priceItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 9.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '￥',
                style: BaseText.style(
                    color: AppColors.navigationColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                Utils.formatStepCount(double.parse(widget.goodsModel.price)),

                /// 商品价格
                style: BaseText.style(
                    height: 1.0,
                    color: AppColors.navigationColor,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          // GestureDetector(
          //   onTap: widget.onItemMoreClick,
          //   child: Image.asset(
          //     'assets/images/mine/more_icon.png',
          //     width: 20,
          //     height: 20,
          //   ),
          // ),
        ],
      ),
    );
  }

  /// 评分
  Widget _ratationItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              RatingBar(
                initialRating: widget.goodsModel.rating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemSize: 12.sp,
                // itemBuilder: (context, _) => Icon(
                //   Icons.star,
                //   color: Colors.amber,
                // ),
                ratingWidget: RatingWidget(
                  full: Container(
                      child:
                          Image.asset('assets/images/sort/icon_star_full.png')),
                  half: Container(
                      child:
                          Image.asset('assets/images/sort/icon_star_half.png')),
                  empty: Container(
                      child: Image.asset(
                          'assets/images/sort/icon_star_empty.png')),
                ),
                ignoreGestures: true,
                onRatingUpdate: (double value) {},
              ),
              Text(
                widget.goodsModel.rating.toString(),
                style: BaseText.style(
                    color: AppColors.color_FF333333,
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Row(
            children: [
              widget.isShowLike
                  ? ManagementOptions(
                      onTap: () => widget.onItemLikeClick(),
                      isOptions: widget.goodsModel.isWished,
                      selectUrl: 'assets/images/sort/love_red.png',
                      unchecked: 'assets/images/sort/love_black.png',
                      width: 24.w,
                    )
                  : Padding(padding: EdgeInsets.zero),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  child: Image.asset(
                    'assets/images/sort/shop_detail_shopcart.png',
                    // color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

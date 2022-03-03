/*
 * @Descripttion: TODO
 * @FileName: shop_goods_item2_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/16/22 11:03 AM
 * @LastEditors: tang
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/core/model/good_info_model.dart';
import 'package:ladyfou/core/utils/utils.dart';
import 'package:ladyfou/page/sort/components/shop_gradient_button.dart';
import 'package:ladyfou/page/sort/components/shop_management_options.dart';

import '../../../core/constant/event_bus.dart';
import '../../../core/utils/event.dart';

import '../../../style/Color.dart';
import '../../../style/text.dart';

typedef CallBackWidget = void Function();

class ShopGoodsItem2 extends StatefulWidget {
  // 点击整个item
  final VoidCallback? onItemClick;

  // 点击喜欢
  final CallBackWidget onItemLikeClick;

  // 数据model
  final GoodsInfoModel goodsModel;
  bool isShowLike;

  ShopGoodsItem2(
      {Key? key,
      required this.goodsModel,
      this.onItemClick,
      required this.onItemLikeClick,
      this.isShowLike = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShopGoodsItem2State();
  }
}

class _ShopGoodsItem2State extends State<ShopGoodsItem2> {
  var eventBusFn;
  bool isListen = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
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
    // ignore: todo
    // TODO: implement dispose

    // XEvent.cancelAll(EVENT_KEY_WISHED);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// : implement build
    return GestureDetector(
      onTap: widget.onItemClick,
      child: Container(
        height: 116.0.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 12.0.w),

            /// 图片模块
            _imageItem(context),
            SizedBox(width: 8.0.w),

            /// 标题价格模块
            Flexible(child: _titlePriceItem(context)),
            SizedBox(width: 12.0.w),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
        ),
      ),
    );
  }

  /// 图片模块
  Widget _imageItem(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(5.w)),
      child: CachedNetworkImage(
        height: 92.0.w,
        width: 92.0.w,
        imageUrl:
            "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
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
    );
  }

  /// 右边内容
  Widget _titlePriceItem(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                _titleItem(context),
                SizedBox(height: 2.0.w),
                _newItem(context),
              ],
            ),
          ),
          _priceItem(context),
          _ratationItem(context),
        ],
      ),
    );
  }

  /// 文字标题模块
  Widget _titleItem(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 8.w),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <InlineSpan>[
              TextSpan(
                text: widget.goodsModel.name,
                style: BaseText.style(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlackText),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ]),
      ),
    );
  }

  /// 原价
  Widget _newItem(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 2.w),
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
                        fontSize: 10.0,
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
      margin: EdgeInsets.only(top: 2.w, bottom: 4.w),
      height: 16.0.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '￥',
                style: BaseText.style(
                    color: AppColors.primaryBlackText,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                Utils.formatStepCount(double.parse(widget.goodsModel.price)),

                /// 商品价格
                style: BaseText.style(
                    height: 1.0,
                    color: AppColors.primaryBlackText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 评分
  Widget _ratationItem(BuildContext context) {
    return Container(
      height: 24.0.w,
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
                itemSize: 12.w,
                ignoreGestures: true,
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
                onRatingUpdate: (double value) {},
              ),
              Text(
                widget.goodsModel.rating.toString(),
                style: BaseText.style(
                    color: AppColors.color_FF333333,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Row(
            children: [
              ManagementOptions(
                onTap: () => widget.onItemLikeClick(),
                isOptions: widget.goodsModel.isWished,
                selectUrl: 'assets/images/sort/love_red.png',
                unchecked: 'assets/images/sort/love_black.png',
                width: 24.w,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 24.w,
                  height: 24.w,
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

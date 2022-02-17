/*
 * @Descripttion: TODO
 * @FileName: shop_goods_item2_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/16/22 11:03 AM
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

import '../../../components/image_placehold_widget.dart';
import '../../../generated/l10n.dart';
import '../../../style/Color.dart';
import '../../../style/text.dart';

typedef CallBackWidget = void Function();

class ShopGoodsItem2 extends StatefulWidget {
  // 点击整个item
  final VoidCallback? onItemClick;
  // 点击喜欢
  final CallBackWidget? onItemLikeClick;
  // 数据model
  final GoodsInfoModel goodsModel;
  bool isShowLike;


  ShopGoodsItem2(
      {Key? key,
        required this.goodsModel,
        this.onItemClick,
        this.onItemLikeClick,
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

    // eventBusFn = eventBus.on<GoodsModelEvent>().listen((event) {
    //   bool isCollection = widget.goodsModel.isCollection;
    //   if (event != null && event.id == widget.goodsModel.id) {
    //     isCollection = event.isCollection;
    //     isListen = true;
    //     setState(() {
    //       widget.goodsModel.isCollection = isCollection;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();

    //// 去掉因为有goods2item和goodsitem共用了
    // if (isListen && eventBusFn != null) {
    //   //取消订阅
    //   eventBusFn.cancel();
    //   isListen = false;
    // }
  }

  @override
  Widget build(BuildContext context) {
    /// : implement build
    return GestureDetector(
      onTap: widget.onItemClick,
      child: Container(
        height: 116.0.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 12.0),

            /// 图片模块
            _imageItem(context),
            SizedBox(width: 8.0),

            /// 标题价格模块
            Flexible(child: _titlePriceItem(context)),
            SizedBox(width: 12.0),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  /// 图片模块
  Widget _imageItem(BuildContext context) {
    return Container(
      width: 92.0.sp,
      height: 92.0.sp,
      alignment: Alignment.center,
      child: ImagePlaceholdWidget(
        imgError: () {
          Future.delayed(Duration(milliseconds: 100)).then((e) {
            setState(() {
              widget.isShowLike = false;
            });
          });
        },
        url: widget.goodsModel.fThumb,
        w: double.infinity,
        defImagePath: 'assets/images/home/banner_placehold.png',
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
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
                SizedBox(height: 2.0),
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
      margin: EdgeInsets.only(top: 8),
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
        margin: EdgeInsets.only(top: 2),
        child: Row(
          children: [
            GradientButton(
              width: 50.sp,
              height: 20.sp,
              fontWeight: FontWeight.bold,
              text: widget.goodsModel.discount,
            ),
            SizedBox(width: 10.sp),
            double.parse(widget.goodsModel.listPrice) > 0.0
                ? Text( '￥'+
                Utils.formatStepCount(
                    double.parse(widget.goodsModel.listPrice)), // 商品原价
              style: BaseText.style(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryBlackText.withOpacity(0.5),
                  decoration: TextDecoration.lineThrough
              ),
            )
                : SizedBox(),
          ],
        )
    );
  }

  /// 价格模块
  Widget _priceItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.sp,bottom: 4.sp),
      height: 16.0.sp,
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
                    fontSize: 15,
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
      height: 24.0.sp,
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
                itemSize: 13.sp,
                ignoreGestures: true,
                ratingWidget: RatingWidget(
                  full: Container(child: Image.asset('assets/images/sort/icon_star_full.png')),
                  half: Container(child: Image.asset('assets/images/sort/icon_star_half.png')),
                  empty: Container(child: Image.asset('assets/images/sort/icon_star_empty.png')),
                ),
                onRatingUpdate: (double value) {},
              ),
              Text(
                widget.goodsModel.rating.toString(),
                style: BaseText.style(
                    color: AppColors.jp_color153,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),

          Row(
            children: [
               ManagementOptions(
                  onTap: () => widget.onItemLikeClick!(),
                  isOptions: widget.goodsModel.isLuckyBag > 0 ? true : false,
                  selectUrl: 'assets/images/sort/love_red.png',
                  unchecked: 'assets/images/sort/love_black.png',
                  width: 24.sp,
                ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 24.sp,
                  height: 24.sp,
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
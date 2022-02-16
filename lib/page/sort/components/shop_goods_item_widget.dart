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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/model/good_info_model.dart';
import 'package:ladyfou/core/utils/utils.dart';
import 'package:ladyfou/page/sort/components/shop_management_options.dart';

import '../../../components/image_placehold_widget.dart';
import '../../../generated/l10n.dart';
import '../../../style/Color.dart';
import '../../../style/text.dart';

typedef CallBackWidget = void Function();

class ShopGoodsItem extends StatefulWidget {
  // 点击整个item
  final VoidCallback? onItemClick;
  // 点击喜欢
  final CallBackWidget? onItemLikeClick;
  // 点击更多
  final VoidCallback? onItemMoreClick;
  // 数据model
  GoodsInfoModel goodsModel;

  bool isShowLike;

  ShopGoodsItem(
      {Key? key,
        required this.goodsModel,
        this.onItemClick,
        this.onItemLikeClick,
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

    // eventBusFn = eventBus.on<GoodsModelEvent>().listen((event) {
    //   bool isCollection = widget.goodsModel.isCollection;
    //   if (event != null && event.id == widget.goodsModel.id) {
    //     setState(() {
    //       isCollection = event.isCollection;
    //       isListen = true;
    //       widget.goodsModel.isCollection = isCollection;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    /// : implement dispose
    super.dispose();

    // if (isListen && eventBusFn != null) {
    //   //取消订阅
    //   eventBusFn.cancel();
    //   isListen = false;
    // }
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

            /// 新品模块
            // widget.goodsModel.isNew == 1 ? _newItem(context) : SizedBox(),
            _newItem(context),

            /// 价格
            _priceItem(context),
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
          minHeight: 148.sp,
        ),
        child: ImagePlaceholdWidget(
          imgError: () {
            Future.delayed(Duration(milliseconds: 100)).then((e) {
              setState(() {
                widget.isShowLike = false;
              });
              // _bloc.changeIsLike(widget.isShowLike);
            });
          },
          url: widget.goodsModel.fThumb,
          w: double.infinity,
          defImagePath: 'assets/images/home/banner_placehold.png',
        ),
      ),

      widget.isShowLike
          ? Positioned(
        top: 16,
        right: 12,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: AppColors.bgGreytr,
            borderRadius: BorderRadius.all(
              Radius.circular(17),
            ),
          ),
          child: ManagementOptions(
            onTap: () => widget.onItemLikeClick!(),
            isOptions: widget.goodsModel.isLuckyBag > 0 ? true : false,
            selectUrl: 'assets/images/home/love_red.png',
            unchecked: 'assets/images/home/love_black.png',
            width: 24.sp,
          ),
        ),
      )
          : Padding(padding: EdgeInsets.zero),
    ]);
  }

  /// 文字标题模块
  Widget _titleItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 10),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <InlineSpan>[
              // WidgetSpan(
              //   child: Container(
              //     child: TipsTitleLab(
              //       text: _getType(),
              //     ),
              //   ),
              // ),

              // 添加5的间距
              WidgetSpan(child: SizedBox(width: 5.0)),

              TextSpan(
                text: widget.goodsModel.name,
                style: BaseText.style(
                    fontSize: 12.0,
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

  /// 新品模块
  Widget _newItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 5),
      width: 32.sp,
      height: 12,
      decoration: new BoxDecoration(
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: Color.fromRGBO(15, 76, 129, 1),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        S.current.home_new_products,  /// 新品
        textAlign: TextAlign.center,
        style: BaseText.style(
            height: 1.4,
            color: Color.fromRGBO(15, 76, 129, 1),
            fontSize: 8,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  /// 价格模块
  Widget _priceItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '￥',
                style: BaseText.style(
                    color: AppColors.navigationColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                Utils.formatStepCount(double.parse(widget.goodsModel.price)),

                /// 商品价格
                style: BaseText.style(
                    height: 1.0,
                    color: AppColors.navigationColor,
                    fontSize: 18,
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
}
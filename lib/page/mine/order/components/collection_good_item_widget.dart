/*
 * @Descripttion: TODO
 * @FileName: collection_good_item_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/23/22 3:40 PM
 * @LastEditors: tang
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../components/image_placehold_widget.dart';
import '../../../../core/model/good_info_model.dart';
import '../../../../core/utils/utils.dart';
import '../../../../style/Color.dart';
import '../../../../style/text.dart';
import '../../../sort/components/shop_gradient_button.dart';

typedef CallBackWidget = void Function();
typedef CallCollectionWidget = void Function(GoodsInfoModel model);

class CollectionGoodItem extends StatefulWidget {
  // 点击整个item
  final VoidCallback? onItemClick;

  // 点击喜欢
  final CallBackWidget? onItemLikeClick;

  // 收藏-点击选中
  final CallCollectionWidget onCollectionSelectClick;

  // 数据model
  final GoodsInfoModel goodsModel;
  bool isShowLike;
  final bool isEditCollection;
  final bool isSelect;

  CollectionGoodItem({
    Key? key,
    required this.goodsModel,
    required this.onCollectionSelectClick,
    this.onItemClick,
    this.onItemLikeClick,
    this.isShowLike = true,
    this.isEditCollection = false,
    this.isSelect = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CollectionGoodItemState();
  }
}

class _CollectionGoodItemState extends State<CollectionGoodItem> {
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
    return Row(
      children: [
        widget.isEditCollection
            ? InkWell(
                onTap: () {
                  widget.onCollectionSelectClick(widget.goodsModel);
                },
                child: Container(
                  height: 116.0.w,
                  width: 50.w,
                  child: Image.asset(widget.isSelect ? "assets/images/sort/fi_check.png" : "assets/images/sort/fi_check_nor.png"),
                ),
              )
            : SizedBox(),
        Expanded(
            child: GestureDetector(
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
        )),
      ],
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
      padding: EdgeInsets.only(top: 8.w, bottom: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlackText),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ]),
      ),
    );
  }

  /// 积分
  Widget _newItem(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 2.w),
        child: Row(
          children: [
            Image.asset("assets/images/mine/fi_integral.png"),
            SizedBox(width: 5.w),
            Text(
              'P${widget.goodsModel.point}',
              style: BaseText.style(
                  color: AppColors.color_F6AD2A,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700),
            ),
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
          Container(
            child: Row(
              children: [
                Text(
                  '￥',
                  style: BaseText.style(
                      color: AppColors.navigationColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  Utils.formatStepCount(double.parse(widget.goodsModel.price)),

                  /// 商品价格
                  style: BaseText.style(
                      height: 1.0,
                      color: AppColors.navigationColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 5.w),
                GradientButton(
                  width: 35.w,
                  height: 15.w,
                  fontWeight: FontWeight.bold,
                  text:
                      '${widget.goodsModel.discount == '' ? 0 : widget.goodsModel.discount}%',
                ),
              ],
            ),
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
    );
  }
}

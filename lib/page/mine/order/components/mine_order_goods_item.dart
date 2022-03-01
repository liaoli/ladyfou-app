/*
 * @Descripttion: TODO
 * @FileName: mine_order_goods_item
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/21/22 11:14 AM
 * @LastEditors: tang
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/core/utils/utils.dart';

import '../../../../components/image_placehold_widget.dart';
import '../../../../core/model/order_info_model.dart';
import '../../../../style/Color.dart';
import '../../../../style/text.dart';

class OrderGoodsItemWidget extends StatelessWidget {
  const OrderGoodsItemWidget(
      {Key? key, required this.product, this.isOrderDetail = false})
      : super(key: key);
  final Product product;
  final bool isOrderDetail; // 订单详情显示spec参数

  @override
  Widget build(BuildContext context) {
    String imgCoverStr = /*product.fThumb*/"http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg";
    String specStr = '';
      List specs = [];
      product.optionsInfo.forEach((spec) {
        String specsStr = '';

        List specs2 = [];
        spec.optionValues.forEach((element) {
          if (element.name2.isNotEmpty) {
            specs2.add(element.name2);
          }
        });
        specsStr += spec.name2 + ':' + specs2.join('、');
        specs.add(specsStr);
      });
      specStr = specs.join(' ');

    return Container(
      padding: EdgeInsets.only(bottom: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 商品封面
          ClipRRect(
            borderRadius: BorderRadius.all(new Radius.circular(5.w)),
            child: CachedNetworkImage(
              height: 75.0.w,
              width: 75.0.w,
              imageUrl:
              imgCoverStr,
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
          SizedBox(width: 5.w),
          // 封面右侧商品信息
          _orderGoodsInfo(context, product, specStr),
        ],
      ),
    );
  }

  Widget _orderGoodsInfo(
      BuildContext context, Product product, String specStr) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              // 商品名
              Expanded(
                child: Text(
                  product.name,
                  style: BaseText.style(
                    fontSize: 12.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 40.w),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 单价
                    Row(
                      children: [
                        Text(
                          '￥',
                          style: BaseText.style(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlackText),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          Utils.formatStepCount(double.parse(product.price)),
                          style: BaseText.style(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlackText),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    // 税后
                    Text(
                      '税込',
                      style: BaseText.style(
                          fontSize: 12.sp, color: AppColors.color_FF999999),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(height: 10.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  specStr,
                  style: BaseText.style(
                    fontSize: 12.sp,
                    color: AppColors.primaryGreyText,
                  ),
                ),
                Text(
                  'x${product.qty}',
                  style: BaseText.style(
                      fontSize: 12.sp, color: AppColors.color_FF999999),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

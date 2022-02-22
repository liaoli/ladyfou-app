/*
 * @Descripttion: TODO
 * @FileName: mine_order_item
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/21/22 11:02 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/page/mine/order/components/mine_order_goods_item.dart';

import '../../../../core/model/order_info_model.dart';
import '../../../../generated/l10n.dart';
import '../../../../style/Color.dart';
import '../../../../style/text.dart';
import 'mine_order_operation.dart';

class MineOrderItem extends StatefulWidget {
  MineOrderItem({Key? key, required this.orderModel}) : super(key: key);
  final OrderInfoModel orderModel;
  @override
  _MineOrderItemState createState() => _MineOrderItemState();
}

class _MineOrderItemState extends State<MineOrderItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // String itemStr = json.encode(widget.orderModel);
        // itemStr = Uri.encodeComponent(itemStr);
        // BaseNavigation.push('set/order/detail?id=$itemStr', context: context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 10.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Text(
                        S.current.mine_page_order_sn + '${widget.orderModel.sn}',
                        style: BaseText.style(
                            fontSize: 14.sp,
                            color: AppColors.primaryBlackText,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Text(
                  stateStr(widget.orderModel.code, context),
                  style: BaseText.style(
                    fontSize: 14.sp,
                    color: AppColors.navigationColor,
                  ),
                ),
              ],
            ),
            OrderGoodsListWidet(orderModel: widget.orderModel),
            // 商品底部操作按钮
            OrderOperationWidget(
              state: widget.orderModel.code,
              isHideComment: false,
              orderModel: widget.orderModel,
              qtys: jumpQtys(),
              callBack: () {

              },
            ),
          ],
        ),
      ),
    );
  }

  int jumpQtys() {
    int result = 0;
    widget.orderModel.product.forEach((e) => {
      result = e.qty + result
    });
    return result;
  }
}



// 商品列表
class OrderGoodsListWidet extends StatelessWidget {
  const OrderGoodsListWidet({Key? key, required this.orderModel}) : super(key: key);
  final OrderInfoModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.w),
      child: ListView.builder(
          itemCount: orderModel.product.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            Product product = orderModel.product[index];
            bool isHiddenComment = false;
            // if (orderModel.state == 2 && goodsModel.isComment == true) {
            //   isHiddenComment = true;
            // }
            return Container(
              // 底部标签和上面商品信息
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 商品信息
                  OrderGoodsItemWidget(
                    product: product,
                  ),
                  // SizedBox(height: 12.w),
                ],
              ),
            );
          }),
    );
  }
}

// 订单状态
String stateStr(String code, BuildContext context) {
  switch (code) {
    case 'placed'://已下单
      return '已下单';
    case 'paid'://已支付
      return '已支付';
    case 'payment_failed': // 支付失败
      return '支付失败';
    case 'stockout': // 缺货
      return '缺货';
    case 'delivered': // 已发货
      return '已发货';
    case 'canceled': // 已取消
      return '已取消';
    case 'repeated': // 重复订单
      return '重复订单';
    case 'pressed': // 已催款
      return '已催款';
    case 'stockup': // 已备货
      return '已备货';
    case 'submitted': // 已提交
      return '已提交';
    case 'confirmreceipt': // 确认收货
      return '确认收货';
    case 'pending': // 支付确认中
      return '支付确认中';
    case 'refunded': // 已退款
      return '已退款';
    case 'cod_verified': // COD客服审核完成
      return 'COD客服审核完成';
    default:
      return '';
  }
}
/*
 * @Descripttion: TODO
 * @FileName: mine_order_operation
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/22/22 2:13 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/model/order_info_model.dart';

import '../../../../core/utils/utils.dart';
import '../../../../style/Color.dart';
import '../../../../style/text.dart';

typedef UpdateCallBackWidget = void Function();

class OrderOperationWidget extends StatelessWidget {
  const OrderOperationWidget({
    Key? key,
    required this.state,
    required this.qtys,
    required this.orderModel,
    required this.callBack,
    this.isHideComment = false,
    this.addressJsonStr = '',
  }) : super(key: key);
  final String state;
  final int qtys;
  final bool isHideComment; // 已完成订单，如果已经评论，不允许再次评论
  final OrderInfoModel orderModel;
  final String addressJsonStr;
  final UpdateCallBackWidget callBack;

  @override
  Widget build(BuildContext context) {
    List menuList = _operatMenuList(context, state);
    if (isHideComment) menuList.removeAt(1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '共${qtys}件  合计  ',
              style: BaseText.style(
                fontSize: 12.sp,
                color: AppColors.primaryGreyText,
              ),
            ),
            Row(
              children: [
                Text(
                  '￥',
                  style: BaseText.style(
                      fontSize: 10.sp, color: AppColors.navigationColor),
                ),
                Text(
                  Utils.formatStepCount(double.parse(orderModel.totalPrice)),
                  style: BaseText.style(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navigationColor),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 10.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: menuList.map((value) {
            int menuIndex = menuList.indexOf(value);
            return ItemButtom(
              item: value,
              state: state,
              color: menuIndex == menuList.length - 1
                  ? AppColors.navigationColor
                  : AppColors.primaryBlackText,
              orderModel: orderModel,
              addressJsonStr: addressJsonStr,
              callBack: callBack,
            );
          }).toList(),
        )
      ],
    );
  }
}

class ItemButtom extends StatelessWidget {
  const ItemButtom({
    Key? key,
    required this.item,
    required this.state,
    required this.orderModel,
    required this.callBack,
    this.color = AppColors.primaryBlackText,
    this.addressJsonStr = '',
  }) : super(key: key);
  final Color color;
  final Map item;
  final String state;
  final OrderInfoModel orderModel;
  final String addressJsonStr;
  final UpdateCallBackWidget callBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _operatAction(context, item['action'], orderModel, addressJsonStr,
        //     state, goodsModel);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 12.w),
        height: 24.w,
        width: 62.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5.w,
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        child: Text(
          item['title'],
          style: BaseText.style(
            fontSize: 10.sp,
            color: color,
          ),
        ),
      ),
    );
  }

// 操作按钮点击事件
// void _operatAction(BuildContext context, int action, Product orderModel,
//     String addressJsonStr, String state, OrderInfoModel goodsModel) {
//   switch (action) {
//     case 0:
//       showModalBottomSheet(
//         isScrollControlled: true,
//         builder: (BuildContext context) {
//           //构建弹框中的内容
//           return SizedBox(
//             height: jpScreenHeight(1310),
//             child: CancelDeal(
//               confirmCallBack: () {
//                 Provider.of<OrderProvider>(context, listen: false)
//                     .cancleOrder(orderModel.orderNum, true, 0)
//                     .then((value) {
//                   if (value == "sucess") {
//                     if (action > 0) {
//                       Future.delayed(const Duration(milliseconds: 100), () {
//                         BaseNavigation.pop(context: context);
//                       });
//                     }
//                   }
//                 });
//               },
//             ),
//           );
//         },
//         context: context,
//       );
//       break;
//     case 1:
//       // 修改订单
//
//       String itemStr = json.encode(goodsModel);
//       itemStr = Uri.encodeComponent(itemStr);
//       BaseNavigation.push('mine/publish?id=$itemStr', context: context);
//
//       // if (!ObjectUtil.isEmptyString(addressJsonStr)) {
//       //   String str = Uri.encodeComponent(addressJsonStr);
//       //   BaseNavigation.push(
//       //           'set/modify/order?id=$str&sn=${orderModel.orderNum}',
//       //           context: context)
//       //       .then((value) {
//       //     if (!ObjectUtil.isEmpty(value)) {
//       //       callBack();
//       //     }
//       //   });
//       // } else {
//       //   JPUnit().showLoaidng(context);
//       //   // 获取收货地址
//       //   OrderDetailProvider()
//       //       .getOrderDetailData(orderModel.orderNum)
//       //       .then((value) {
//       //     Navigator.of(context, rootNavigator: true).pop(); // 移除loading
//       //     if (!ObjectUtil.isEmpty(value)) {
//       //       String str = Uri.encodeComponent(value);
//       //       BaseNavigation.push(
//       //           'set/modify/order?id=$str&sn=${orderModel.orderNum}',
//       //           context: context);
//       //     }
//       //   });
//       // }
//       break;
//     case 2:
//       // 去支付
//       Provider.of<OrderProvider>(context, listen: false)
//           .requestGoodsAgain(state, orderModel.id)
//           .then((value) {
//         if (value != 'faile') {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return WebViewPayPage(
//               title: S.current.cart_pay_home_tip,
//               url: value,
//               callBackWidget: (success) {
//                 if (success) {
//                   /// 支付成功了
//                   showToast(S.current.cart_pay_success, context: context);
//                 }
//               },
//             );
//           }));
//         }
//       });
//       break;
//     case 3:
//       // 再次购买(加入购物车)
//       GoodsOrderModel addModel = GoodsOrderModel();
//       addModel.id = goodsModel.id;
//       addModel.count = 1;
//       Provider.of<CartPageProvider>(context, listen: false)
//           .addGoodsToCart(addModel, specIdStr: goodsModel.specIds);
//       break;
//     case 4:
//       // 申请退款
//       break;
//     case 5:
//       // 我要退单
//       break;
//     case 6:
//       // 确认收货
//       break;
//     case 7:
//       // 退换/售后
//       break;
//     case 8:
//       // 评价晒单
//       String itemStr = json.encode(goodsModel);
//       itemStr = Uri.encodeComponent(itemStr);
//       BaseNavigation.push('mine/publish?id=$itemStr', context: context);
//       break;
//     default:
//   }
// }
}

// 操作按钮
List _operatMenuList(BuildContext context, String code) {
  switch (code) {
    case 'placed': //已下单
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
        {
          // 修改订单
          'action': 1,
          'title': '修改订单',
        },
        {
          // 去支付
          'action': 2,
          'title': '去支付',
        }
      ];
    case 'paid': //已支付
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
        {
          // 修改订单
          'action': 1,
          'title': '修改订单',
        },
        {
          // 去支付
          'action': 2,
          'title': '去支付',
        }
      ];
    case 'payment_failed': // 支付失败
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
        {
          // 修改订单
          'action': 1,
          'title': '修改订单',
        }
      ];
    case 'stockout': // 缺货
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
        {
          // 修改订单
          'action': 1,
          'title': '修改订单',
        },
      ];
    case 'delivered': // 已发货
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
      ];
    case 'canceled': // 已取消
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
        {
          // 修改订单
          'action': 1,
          'title': '修改订单',
        },
        {
          // 去支付
          'action': 2,
          'title': '去支付',
        }
      ];
    case 'repeated': // 重复订单
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
      ];
    case 'pressed': // 已催款
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
      ];
    case 'stockup': // 已备货
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
      ];
    case 'submitted': // 已提交
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
      ];
    case 'confirmreceipt': // 确认收货
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
      ];
    case 'pending': // 支付确认中
      return [
        {
          // 再次购买
          'action': 1,
          'title': '再次购买',
        },
      ];
    case 'refunded': // 已退款
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
      ];
    case 'cod_verified': // COD客服审核完成
      return [
        {
          // 取消订单
          'action': 0,
          'title': '取消订单',
        },
      ];
    default:
      return [];
  }
}

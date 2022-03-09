import 'dart:ffi';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:ladyfou/core/utils/toast.dart';
import 'package:ladyfou/page/cart/components/discounts_tab_widget.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/base_bloc.dart';
import '../../../core/utils/utils.dart';
import '../model/cart_model.dart';
import '../store/cart_provider.dart';

class BottomPayWidget extends StatefulWidget {
  BottomPayWidget({Key? key, required this.cartInfo}) : super(key: key);

  final CartInfo cartInfo;

  @override
  _BottomPayWidgetState createState() => _BottomPayWidgetState();
}

class _BottomPayWidgetState extends State<BottomPayWidget> {
  bool isSelectDiscounts = true;
  late TextEditingController discountController;
  late TextEditingController couponController;
  late CartProvider provider;

  @override
  void initState() {
    // TODO: implement initState

    discountController = TextEditingController();
    couponController = TextEditingController();

    discountController.addListener(() {
      int input = 0;
      try {
        input = int.parse(discountController.text);
      } catch (e) {
        return;
      }
      provider.updateUseIntegral(input);
    });
    couponController.addListener(() {});

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bottomSafeHg = MediaQuery.of(context).padding.bottom;
    double screenWd = MediaQuery.of(context).size.width;
    double couponsWd = (screenWd - 36) / 2.6; // 优惠券按钮宽度

    provider = Provider.of(context, listen: false);

    return Container(
      padding: EdgeInsets.fromLTRB(12, 13, 12, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 0.5, color: AppColors.transparent_Black3),
        ),
      ),
      height: bottomSafeHg + 110,
      width: screenWd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "合计金额：",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlackText51),
              ),
              TextSpan(
                text: "${Utils.formatStepCount(double.parse("3479"))}円 ",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlackText51),
              ),
              TextSpan(
                text: "(不含配送费)",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.jp_color153),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            height: 42,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => showDiscountsWidget(context, bottomSafeHg,
                      provider, discountController, couponController),
                  child: Container(
                    alignment: Alignment.center,
                    width: couponsWd,
                    height: 33,
                    decoration: new BoxDecoration(
                      color: AppColors.color_FCE6E9,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Text(
                      '使用积分/优惠券',
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.1,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryBlackText51),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      color: AppColors.color_E34D59,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Text(
                      '购入',
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.1,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 选择积分/优惠券弹框
  void showDiscountsWidget(
      BuildContext context,
      double bottomSafeHg,
      CartProvider provider,
      TextEditingController discountController,
      TextEditingController couponController) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      builder: (BuildContext bc) {
        return Container(
            width: double.infinity,
            height: 134 + bottomSafeHg,
            child: StreamBuilder<bool>(
                initialData: true,
                stream: BaseBloc.instance.addLisenerCartDiscountsStream,
                builder: (ctx, snapshot) {
                  bool isSelect = snapshot.data != false ? true : false;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 12, top: 0),
                        width: double.infinity,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              width: 4,
                              color: AppColors.primaryBackground,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DiscountsTabWidget(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 7),
                                width: 30,
                                height: 30,
                                child: Image.asset(
                                  'assets/images/close_icon.png',
                                  width: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IntegralWidget(
                        cartInfo: widget.cartInfo,
                        isSelectDiscounts: isSelect,
                        discountController: discountController,
                        couponController: couponController,
                        provider: provider,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text(
                          '*当前最大可使用积分为${widget.cartInfo.userSumActiveRewardPoints}pt',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.jp_color153,
                          ),
                        ),
                      ),
                    ],
                  );
                }));
      },
    );
  }
}

class IntegralWidget extends StatefulWidget {
  IntegralWidget(
      {Key? key,
      required this.isSelectDiscounts,
      required this.discountController,
      required this.couponController,
      required this.cartInfo,
      required this.provider})
      : super(key: key);

  final bool isSelectDiscounts;
  final TextEditingController discountController;
  final TextEditingController couponController;
  final CartInfo cartInfo;
  final CartProvider provider;

  @override
  IntegralWidgetState createState() => IntegralWidgetState();
}

// 积分输入框
class IntegralWidgetState extends State<IntegralWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // 点击使用
  void clickUserAction(BuildContext context) {
    // 点击积分使用
    if (widget.isSelectDiscounts) {
      int input = 0;
      try {
        input = int.parse(widget.discountController.text);
      } catch (e) {
        ToastUtils.toast("请输入正确的积分数！");
        return;
      }

      if (input > widget.cartInfo.userSumActiveRewardPoints) {
        ToastUtils.toast("已超出最大可使用积分！");
        return;
      }
      if (input < 0) {
        ToastUtils.toast("请输入正确的积分数！");
        return;
      }
      Navigator.pop(context);
      widget.provider.updateUseIntegral(input);
    }
    // 点击优惠券使用
    else {
      widget.provider.updateUseCoupon(null);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              height: 40,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 0.5, color: AppColors.primaryBlackText51),
              ),
              child: widget.isSelectDiscounts
                  ? TextField(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.jp_color153,
                      ),
                      keyboardType: TextInputType.number,
                      controller: widget.discountController,
                      decoration: InputDecoration.collapsed(hintText: "输入积分数额"),
                    )
                  : TextField(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.jp_color153,
                      ),
                      keyboardType: TextInputType.number,
                      controller: widget.couponController,
                      decoration: InputDecoration.collapsed(hintText: "请选择优惠券"),
                      readOnly: true,
                      onTap: () {
                        showCouponsWidget(
                            context, widget.couponController, widget.provider);
                      },
                    ),
            ),
          ),
          InkWell(
            onTap: () {
              clickUserAction(context);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10),
              width: 73,
              height: 40,
              decoration: new BoxDecoration(
                color: widget.isSelectDiscounts == true
                    ? widget.provider.currentIntegral > 0
                        ? AppColors.color_E34D59
                        : AppColors.color_FF999999
                    : widget.provider.currentCoupon.tips.length > 0
                        ? AppColors.color_E34D59
                        : AppColors.color_FF999999,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Text(
                '使用',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void showCouponsWidget(BuildContext context, TextEditingController controller,
    CartProvider provider) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: provider.couponList.map((coupon) {
            return ListTile(
              title: Text(
                coupon.tips,
                style:
                    BaseText.style(fontSize: 12, fontWeight: FontWeight.normal),
              ),
              onTap: () {
                controller.text = coupon.tips;
                provider.updateUseCoupon(coupon);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      });
}

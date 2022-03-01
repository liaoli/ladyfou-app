/*
 * @Descripttion: TODO
 * @FileName: mine_order_detail_page
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/22/22 3:57 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ladyfou/core/utils/utils.dart';
import 'package:ladyfou/page/mine/order/page/mine_order_logistics.dart';
import 'package:ladyfou/style/text.dart';
import 'package:provider/provider.dart';

import '../../../../components/base_scaffold.dart';
import '../../../../core/constant/base_enum.dart';
import '../../../../core/model/order_info_model.dart';
import '../../../../style/Color.dart';
import '../components/mine_order_item.dart';
import '../store/order_detail_provider.dart';

class MineOrderDetailPage extends StatefulWidget {
  MineOrderDetailPage({Key? key, required this.orderModel}) : super(key: key);

  final OrderInfoModel orderModel;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineOrderDetailPageState();
  }
}

class _MineOrderDetailPageState extends State<MineOrderDetailPage>
    with AutomaticKeepAliveClientMixin {
  late OrderDetailProvider provider;
  bool isExitAddress = true;

  // 配送方式数据
  List shoppingMethodDatas = [];

  // 支付方式数据库
  List payMethodDatas = [];

  // 请求金额
  List priceDatas = [];

  @override
  void initState() {
    // TODO: implement initState

    shoppingMethodDatas = getShoppintMethodList();
    payMethodDatas = getPayMethodList();
    priceDatas = getPriceList();

    provider = OrderDetailProvider();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ChangeNotifierProvider.value(
        value: provider,
        child: BaseScaffold(
            title: '订单管理',
            leadType: AppBarBackType.Back,
            actions: [
              GestureDetector(
                onTap: () {
                  // BaseNavigation.push('mine/news/list', context: context);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Image.asset(
                    'assets/images/mine/icon_customer.png',
                    width: 25.0.w,
                    height: 25.0.w,
                  ),
                ),
              ),
            ],
            body: Stack(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    // 触摸收起键盘
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w,
                          ScreenUtil().bottomBarHeight + 84.w),
                      child: EasyRefresh.custom(
                        controller: provider.refreshController,
                        // onRefresh: () async {},
                        // onLoad: () async {},
                        enableControlFinishLoad: false,
                        enableControlFinishRefresh: false,
                        header: MaterialHeader(),
                        footer: MaterialFooter(),
                        slivers: <Widget>[bodyWidget(context)],
                      )),
                ),
                Positioned(
                  bottom: 0.w,
                  child: Container(
                    height: ScreenUtil().bottomBarHeight + 84.w,
                    width: 375.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(
                                width: 0.5.w,
                                color: AppColors.color_FFDADADA))),
                    child: buildBottomWidget(),
                  ),
                ),
              ],
            )));
  }

  /// Body
  Widget bodyWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            orderStatusWidget(context),
            SizedBox(height: 10.w),
            isExitAddress ? addressWidget(context) : noAddressWidget(context),
            SizedBox(height: 10.w),
            shoppingMethodWidget(context),
            SizedBox(height: 10.w),
            payMethodWidget(context),
            SizedBox(height: 10.w),
            orderInfoWidget(context),
            SizedBox(height: 10.w),
            orderPriceWidget(context),
            SizedBox(height: 10.w),
          ],
        ),
      ),
    );
  }

  /// 支付状态
  Widget orderStatusWidget(BuildContext context) {
    return Container(
      height: 46.w,
      decoration: BoxDecoration(
        color: AppColors.navigationColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12.w),
            child: Text('待支付',
                style: BaseText.style(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: AppColors.white)),
          ),
          Container(
            padding: EdgeInsets.only(right: 12.w),
            child: Text('23小时后将自动取消订单',
                style: BaseText.style(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.white)),
          ),
        ],
      ),
    );
  }

  /// 有地址栏
  Widget addressWidget(BuildContext context) {
    return Container(
      height: 60.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text('${'三浦惠子'}    ${'0262525159'}',
                      style: BaseText.style(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                          color: AppColors.primaryBlackText)),
                ),
                Container(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Image.asset('assets/images/mine/me_right_arrow.png',
                      color: AppColors.primaryBlackText),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.w),
          Container(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: Text('${'コーポレートガバナンスなど、いろいろな側面から企業の567号'}',
                maxLines: 2,
                style: BaseText.style(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.primaryBlackText)),
          ),
        ],
      ),
    );
  }

  /// 无地址
  Widget noAddressWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        height: 60.w,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 12.w),
              child: Image.asset("assets/images/mine/fi_x-circle-add.png"),
            ),
            Container(
              padding: EdgeInsets.only(left: 12.w),
              child: Text('暂无地址,请添加地址',
                  style: BaseText.style(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.primaryBlackText)),
            ),
          ],
        ),
      ),
    );
  }

  /// 配送方式
  Widget shoppingMethodWidget(BuildContext context) {
    return Container(
      height: 35.w * shoppingMethodDatas.length + 35.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.w),
            child: Text('配送方式',
                style: BaseText.style(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: AppColors.primaryBlackText)),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
                itemCount: shoppingMethodDatas.length,
                itemBuilder: (context, index) {
                  Map data = shoppingMethodDatas[index];
                  return InkWell(
                    onTap: () => {
                      setState(() {
                        shoppingMethodDatas.forEach(
                            (element) => element['isSelected'] = false);
                        shoppingMethodDatas[index]['isSelected'] = true;
                      })
                    },
                    child: Container(
                      height: 35.w,
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(data['isSelected'] == false
                                  ? "assets/images/sort/fi_check_nor.png"
                                  : "assets/images/sort/fi_check.png"),
                              SizedBox(width: 5.w),
                              Text(data['title'],
                                  style: BaseText.style(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: AppColors.primaryBlackText)),
                            ],
                          ),
                          Container(
                            child: Text(
                                "￥${Utils.formatStepCount(double.parse(data['price']))}元",
                                style: BaseText.style(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: AppColors.navigationColor)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )),
        ],
      ),
    );
  }

  /// 支付方式
  Widget payMethodWidget(BuildContext context) {
    return Container(
      height: 35.w * payMethodDatas.length + 35.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.w),
            child: Text('支付方式选择',
                style: BaseText.style(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: AppColors.primaryBlackText)),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
                itemCount: payMethodDatas.length,
                itemBuilder: (context, index) {
                  Map data = payMethodDatas[index];
                  List<String> images = data['images'];
                  List<Widget> result = images.map((e) {
                    return Image.asset(e.toString());
                  }).toList();
                  return InkWell(
                    onTap: () => {
                      setState(() {
                        payMethodDatas.forEach(
                            (element) => element['isSelected'] = false);
                        payMethodDatas[index]['isSelected'] = true;
                      })
                    },
                    child: Container(
                      height: 35.w,
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(data['isSelected'] == false
                                  ? "assets/images/sort/fi_check_nor.png"
                                  : "assets/images/sort/fi_check.png"),
                              SizedBox(width: 5.w),
                              Text(data['title'],
                                  style: BaseText.style(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: AppColors.primaryBlackText)),
                            ],
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: result,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )),
        ],
      ),
    );
  }

  /// 订单信息
  Widget orderInfoWidget(BuildContext context) {
    return Container(
      height: 85.w * widget.orderModel.product.length + 90.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.w),
            child: Text('订单信息',
                style: BaseText.style(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: AppColors.primaryBlackText)),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OrderGoodsListWidet(orderModel: widget.orderModel),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '共${jumpQtys()}件  合计  ',
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
                              fontSize: 10.sp,
                              color: AppColors.navigationColor),
                        ),
                        Text(
                          Utils.formatStepCount(
                              double.parse(widget.orderModel.totalPrice)),
                          style: BaseText.style(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.navigationColor),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  /// 请求金额
  Widget orderPriceWidget(BuildContext context) {
    return Container(
      height: 35.w * priceDatas.length + 35.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.w),
            child: Text('请求金额',
                style: BaseText.style(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: AppColors.primaryBlackText)),
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
                itemCount: priceDatas.length,
                itemBuilder: (context, index) {
                  Map data = priceDatas[index];
                  return InkWell(
                    onTap: () => {},
                    child: Container(
                      height: 35.w,
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(data['title'],
                                style: BaseText.style(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: AppColors.primaryBlackText)),
                          ),
                          Container(
                            child: Text(
                                "${data['opr']} ￥${Utils.formatStepCount(double.parse(data['price']))}",
                                style: BaseText.style(
                                    fontWeight: FontWeight.w700,
                                    fontSize: data['title'] == '总金额(税后)'
                                        ? 14.sp
                                        : 12.sp,
                                    color: (data['opr'] == '-' ||
                                            data['title'] == '总金额(税后)')
                                        ? AppColors.navigationColor
                                        : AppColors.primaryBlackText)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )),
        ],
      ),
    );
  }

  /// 底部结算
  Widget buildBottomWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('合计金额:',
                    style: BaseText.style(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColors.primaryBlackText)),
                SizedBox(width: 5.w),
                Text(
                    '￥${Utils.formatStepCount(double.parse(widget.orderModel.totalPrice))}',
                    style: BaseText.style(
                        height: 1.5.sp,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: AppColors.primaryBlackText)),
              ],
            ),
          ),
          SizedBox(height: 5.w),
          Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 34.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Get.to(() => MineOrderLogisticsPage());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      decoration: BoxDecoration(
                          color: AppColors.navigationColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(17.w))),
                      child: Text('立即结算',
                          style: BaseText.style(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white)),
                    ),
                  )),
                ],
              )),
        ],
      ),
    );
  }

  int jumpQtys() {
    int result = 0;
    widget.orderModel.product.forEach((e) => {result = e.qty + result});
    return result;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

/// 配送方式数据
List getShoppintMethodList() {
  return [
    {'title': '经济性速送递', 'price': '0', 'isSelected': false},
    {'title': 'EMS全国速递', 'price': '1590', 'isSelected': true},
    {'title': 'Express', 'price': '3999', 'isSelected': false},
  ];
}

/// 支付方式数据
List getPayMethodList() {
  return [
    {
      'title': 'VISA/Master',
      'images': [
        'assets/images/mine/fi_visa_pay.png',
        'assets/images/mine/fi_master_pay.png'
      ],
      'isSelected': true
    },
    {
      'title': 'JCB',
      'images': ['assets/images/mine/fi_jcb_pay.png'],
      'isSelected': false
    },
  ];
}

/// 请求金额
List getPriceList() {
  return [
    {'title': '商品合计(税后)', 'price': '3598', 'opr': ''},
    {'title': '3件折扣/5件折扣活动', 'price': '598', 'opr': '-'},
    {'title': '优惠劵割引', 'price': '598', 'opr': '-'},
    {'title': '积分割引', 'price': '598', 'opr': '-'},
    {'title': '邮费', 'price': '3598', 'opr': ''},
    {'title': '总金额(税后)', 'price': '13598', 'opr': ''},
  ];
}

/*
 * @Descripttion: TODO
 * @FileName: mine_order_page
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/21/22 10:37 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/model/order_info_model.dart';
import 'package:provider/provider.dart';

import '../../../../components/base_scaffold.dart';
import '../../../../core/constant/base_enum.dart';
import '../../../../generated/l10n.dart';
import '../../../../style/Color.dart';
import '../../../../style/text.dart';
import '../components/mine_order_list.dart';
import '../store/order_provider.dart';

// class MineOrderPage extends StatelessWidget {
//   final OrderStatus orderStatus;
//
//   MineOrderPage({Key? key, this.orderStatus = OrderStatus.all}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return ChangeNotifierProvider(
//         create: (_) => OrderProvider(), child: MineOrderPageFul(orderStatus: orderStatus));
//   }
// }

class MineOrderPage extends StatefulWidget {
  final OrderStatus orderStatus;

  MineOrderPage({Key? key, this.orderStatus = OrderStatus.all})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineOrderPageState();
  }
}

class _MineOrderPageState extends State<MineOrderPage>
    with TickerProviderStateMixin {
  OrderStatus selectOrderStatus = OrderStatus.all;
  TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  late OrderProvider provider;
  List _orderList = [
    /// 全部
    S.current.mine_page_all,

    /// 待付款
    S.current.mine_page_to_be_paid,

    /// 待收货
    S.current.mine_page_to_be_received,

    /// 已完成
    S.current.mine_page_completed,

    /// 已取消
    S.current.mine_page_canclled,
  ];
  DateTime _lastRequestAdt = DateTime.now();

  @override
  void initState() {
    selectOrderStatus = widget.orderStatus;

    /// 默认获取所有订单列表
    provider = OrderProvider();
    provider.getOrderList(selectOrderStatus, isFirst: true).then((value) {
      setState(() {});
    });

    _tabController = TabController(
      length: _orderList.length,
      vsync: this,
      initialIndex: selectOrderStatus.index,
    );

    _tabController.addListener(() {
      // 不晓得为什么会走两次，所以处理下
      if (_lastRequestAdt == null ||
          DateTime.now().difference(_lastRequestAdt) > Duration(seconds: 1)) {
        // 超过1秒允许再次请求
        _lastRequestAdt = DateTime.now();
        provider.getOrderList(OrderStatus.values[_tabController.index],
            isLoadMore: false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _tabController.animateTo(selectIndex == 'all' ? 0 : int.parse(selectIndex));

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
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // 触摸收起键盘
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  height: 54.w,
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 4.w,
                  ),
                  child: TabBar(
                    tabs: _orderList.map((f) {
                      return Text(f);
                    }).toList(),
                    controller: _tabController,
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    labelColor: AppColors.primaryBlackText,
                    unselectedLabelColor: AppColors.primaryBlackText,
                    labelStyle: BaseText.style(height: 2, fontSize: 15.sp),
                    onTap: (int status) {
                      selectOrderStatus = OrderStatus.values[status];
                    },
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: createPages(),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  // 列表
  List<Widget> createPages() {
    List<Widget> desList = [];
    for (int i = 0; i < _orderList.length; i++) {
      desList.add(OrderListPage(pageIndex: i, provider: provider));
    }
    return desList;
  }

  // Widget _searchBarWidget(BuildContext context) {
  //   return Container(
  //     width: 280.w,
  //     height: 32.0.w,
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //           color: AppColors.primaryBlackText.withOpacity(0.05), width: 1.0),
  //       color: AppColors.primaryBlackText.withOpacity(0.05),
  //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
  //     ),
  //     child: TextFormField(
  //       controller: _searchController,
  //       keyboardType: TextInputType.text,
  //       style: BaseText.style(
  //         fontSize: 12.0,
  //         fontWeight: FontWeight.w400,
  //         color: AppColors.primaryBlackText,
  //       ),
  //       decoration: InputDecoration(
  //         suffixIcon: GestureDetector(
  //           //onTap: onTap,
  //           child: _searchController.text != ''
  //               ? Icon(Icons.cancel, size: 15)
  //               : SizedBox(),
  //         ),
  //         contentPadding: EdgeInsets.only(left: 10.0.w),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(8),
  //           borderSide: BorderSide.none,
  //         ),
  //         filled: true,
  //         fillColor: Colors.white,
  //         hintText: S.current.mine_page_search_my_order,
  //
  //         /// 搜索我的订单
  //         hintStyle: BaseText.style(
  //           color: AppColors.primaryGreyText,
  //           fontSize: 12.0,
  //         ),
  //         prefixIcon: Container(
  //           width: jpScreenWidth(74),
  //           alignment: Alignment.centerRight,
  //           padding: EdgeInsets.only(right: jpScreenWidth(20)),
  //           child: Image(
  //             image: AssetImage('assets/images/home/icon_search.png'),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// 点击返回
  void backPressAction(BuildContext context) async {
    // BaseNavigation.pop(context: context);
    // LogUtil.e("点击返回");
  }
}

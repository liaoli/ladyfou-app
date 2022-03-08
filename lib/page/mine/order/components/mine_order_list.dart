/*
 * @Descripttion: TODO
 * @FileName: mine_order_list
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/22/22 9:55 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/model/good_info_model.dart';
import 'package:ladyfou/core/model/order_info_model.dart';
import 'package:ladyfou/page/mine/order/store/order_provider.dart';
import 'package:provider/provider.dart';

import '../../../../style/Color.dart';
import '../../../../style/text.dart';
import '../../../sort/components/shop_grid_list_view.dart';
import 'mine_order_item.dart';

class OrderListPage extends StatefulWidget {
  OrderListPage({Key? key, required this.pageIndex, required this.provider})
      : super(key: key);
  final int pageIndex;
  final OrderProvider provider;

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 10.w),
      child: EasyRefresh.custom(
        controller: widget.provider.refreshController,
        onRefresh: () async {},
        onLoad: () async {},
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        slivers: <Widget>[
          /// List
          _orderListWidget(context)
        ],
      ),
      // child: SmartRefresher(
      //   controller: Provider.of<OrderProvider>(context, listen: false)
      //       .refreshController,
      //   enablePullUp: true,
      //   onRefresh: () => Provider.of<OrderProvider>(context, listen: false)
      //       .getOrderList(widget.pageIndex, isLoadMore: false),
      //   onLoading: () => Provider.of<OrderProvider>(context, listen: false)
      //       .getOrderList(widget.pageIndex, isLoadMore: true),
      //   header: WaterDropMaterialHeader(),
      //   footer: BaseRefreshFooter(),
      //   child: CustomScrollView(
      //     slivers: [
      //       // 订单列表
      //       SliverPadding(
      //         padding: EdgeInsets.only(top: 12),
      //         sliver: _orderListWidget(context),
      //       ),
      //       // 分割头部
      //       _segmentHeadWidget(context),
      //       // 推荐商品列表
      //       _recommendGoodsListWidget(context),
      //     ],
      //   ),
      // ),
    );
  }

  // 订单列表
  Widget _orderListWidget(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, child, value) {
      List<OrderInfoModel> showList = [];
      if (widget.pageIndex == 0) {
        showList = child.orderAllList;
      } else if (widget.pageIndex == 1) {
        showList = child.waitPayList;
      } else if (widget.pageIndex == 2) {
        showList = child.waitReceiveList;
      } else if (widget.pageIndex == 3) {
        showList = child.finishList;
      } else {
        showList = child.cancleList;
      }
      if (showList.isEmpty) {
        showList = child.orderInfoList;
      }

      if (showList.isEmpty) {
        return _noDataWidget(context);
      }
      return SliverList(
        delegate: SliverChildBuilderDelegate((content, index) {
          return Container(
            child: MineOrderItem(orderModel: showList[index]),
            margin: EdgeInsets.only(
              bottom: 12.w,
            ),
          );
        }, childCount: showList.length),
      );
    });
  }

  // 分割header
  Widget _segmentHeadWidget(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, child, value) {
      List<GoodsInfoModel> goodsShowList = _goodsShowList(child);
      return SliverToBoxAdapter(
        child: Visibility(
          visible: goodsShowList.length > 0,
          child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: AppColors.navigationColor,
                  height: 1,
                  width: 120.w,
                ),
                Row(children: [
                  // Image.asset('assets/images/home/comment_lover_icon.png'),
                  Text(
                    '为你推荐',

                    /// 为你推荐
                    style: BaseText.style(
                      fontSize: 12,
                      color: AppColors.primaryBlackText,
                    ),
                  ),
                ]),
                Container(
                  color: AppColors.navigationColor,
                  height: 1,
                  width: 120.w,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  // 推荐商品列表
  Widget _recommendGoodsListWidget(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, child, value) {
      List<GoodsInfoModel> goodsShowList = _goodsShowList(child);
      return SliverToBoxAdapter(
        child: ShopGridListView(
          goodsList: [],
          padding: EdgeInsets.only(top: 12),
          loverClick: (index) {},
        ),
      );
    });
  }

  // 无数据缺省页
  Widget _noDataWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: 375.w,
            height: 200,
            child: Image.asset('assets/images/home/cart_empty.png'),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 11.w),
            child: Text(
              '您还没有相关订单',
              style: BaseText.style(
                  fontSize: 12,
                  color: AppColors.color_FF999999,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  // 推荐商品列表
  List<GoodsInfoModel> _goodsShowList(OrderProvider provider) {
    List<GoodsInfoModel> goodsShowList = [];
    if (widget.pageIndex == 0) {
      goodsShowList = provider.orderAllGoodsList;
    } else if (widget.pageIndex == 1) {
      goodsShowList = provider.waitPayGoodsList;
    } else if (widget.pageIndex == 2) {
      goodsShowList = provider.waitReceiveGoodsList;
    } else if (widget.pageIndex == 3) {
      goodsShowList = provider.finishGoodsList;
    } else {
      goodsShowList = provider.cancleGoodsList;
    }
    return goodsShowList;
  }

  @override
  bool get wantKeepAlive => true;
}

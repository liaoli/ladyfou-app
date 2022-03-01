/*
 * @Descripttion: TODO
 * @FileName: mine_order_logistics_page
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 3/1/22 2:17 PM
 * @LastEditors: tang
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/style/text.dart';
import 'package:provider/provider.dart';

import '../../../../components/base_scaffold.dart';
import '../../../../core/constant/base_enum.dart';
import '../../../../style/Color.dart';
import '../store/order_detail_provider.dart';

class MineOrderLogisticsPage extends StatefulWidget {
  MineOrderLogisticsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineOrderLogisticsState();
  }
}

class _MineOrderLogisticsState extends State<MineOrderLogisticsPage> {
  late OrderDetailProvider provider;

  @override
  void initState() {
    // TODO: implement initState

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
          body: EasyRefresh.custom(
            controller: provider.logisticsRefreshController,
            onRefresh: () async {},
            enableControlFinishLoad: false,
            enableControlFinishRefresh: true,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            slivers: <Widget>[
              _buildItem1(),
            ],
          )),
    );
  }

  Widget _buildItem1() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(15.w),
        height: 74.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10.w),
            ClipRRect(
              borderRadius: BorderRadius.all(new Radius.circular(25.w)),
              child: CachedNetworkImage(
                height: 50.0.w,
                width: 50.0.w,
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
            ),
            SizedBox(width: 10.w),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '注文番号:${'201950548802021'}',
                  style: BaseText.style(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color_FF333333),
                ),
                SizedBox(height: 5.w),
                Text(
                  '配送方法:${'999速便'}',
                  style: BaseText.style(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color_FF333333),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

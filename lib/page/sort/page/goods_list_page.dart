/*
 * @Descripttion: TODO
 * @FileName: goods_list_page
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/15/22 3:03 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/core/constant/base_bloc.dart';
import 'package:provider/provider.dart';

import '../../../components/base_scaffold.dart';
import '../../../core/constant/base_enum.dart';
import '../../../core/model/sort_model.dart';
import '../../../style/Color.dart';
import '../../../style/text.dart';
import '../components/shop_grid_list_view.dart';
import '../store/sort_provider.dart';
import '../../../generated/l10n.dart';

class GoodsListPage extends StatelessWidget {
  final int shopId;
  final SortModel sortModel;
  GoodsListPage({Key? key, required this.shopId, required this.sortModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(create: (_) => SortProvider(),child: GoodsListPageFul(shopId: shopId,sortModel: sortModel));
  }
}

class GoodsListPageFul extends StatefulWidget {
  final int shopId;
  final SortModel sortModel;
  GoodsListPageFul({Key? key,required this.shopId, required this.sortModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _GoodsListPageState();
  }
}

class _GoodsListPageState extends State<GoodsListPageFul>  {

  late SortProvider provider;
  bool isDisplay = false;
  bool isEnable = true;
  List<String> tabTitles = [];
  bool isSelect = false;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState

    // 请求分类数据
    Provider.of<SortProvider>(context,listen: false).getCategoryProducts(widget.shopId,isFirst: true);
    
    super.initState();
  }

  List<String> getTabTitles() {
    List<String> tabs = [
      S.current!.store_comprehensive, // 综合
      S.current.store_classification, // 全部分类
      S.current.store_conditions // 全部条件
    ];
    return tabs;
  }

  /// 点击切换列表展示
  void checkDisplayAction(BuildContext context) async {
    isDisplay = !isDisplay;
    if (isEnable) {
      isEnable = false;
      //延时500毫秒执行
      Future.delayed(const Duration(milliseconds: 200), () {
        if (!isDisplay) {
          Provider.of<SortProvider>(context, listen: false)
              .switchListType(DisplayType.grid_shape);
        } else {
          Provider.of<SortProvider>(context, listen: false)
              .switchListType(DisplayType.list_form);
        }
        isEnable = true;
      });
    }
  }

  /// 点击tab切换
  void selectTabItem(int index) {
    // provider.getCategoryProducts(provider.inputKeyword,
    //     shopId: widget.shopId, isFirstInt: true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<SortProvider>(builder: (ctx, child, value) {
      provider = child;
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: BaseScaffold(
          leadType: AppBarBackType.Back,
          brightness: Brightness.dark,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(44.0 + ScreenUtil().statusBarHeight),
            child: BaseAppBar(
              title: Container(
                child: Text(widget.sortModel.name2,style: BaseText.style(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlackText,
                    fontSize: 14)),
              ),
              elevation: 0,
              actions: <Widget>[
                /// 切换按钮
                listTypeItem(context),
              ],
              // bottom: PreferredSize(
              //   preferredSize: Size.fromHeight(35.0),
              //   child: _buildTabListWidget(context),
              // ),
            ),
          ),
          body: Material(
            color: AppColors.primaryBackground,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                // 触摸收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: EasyRefresh.custom(
                  controller: provider.refreshController,
                  onRefresh: () => provider.getCategoryProducts(widget.shopId, isRefresh: true),
                  onLoad: () => provider.getCategoryProducts(widget.shopId,isRefresh: false),
                  enableControlFinishLoad: true,
                  enableControlFinishRefresh: true,
                  header: MaterialHeader(),
                  footer: MaterialFooter(),
                  slivers: <Widget>[
                    /// List
                    SliverToBoxAdapter(
                      child: _buildList(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  // 分类还是列表按钮
  Widget listTypeItem(BuildContext context) {
    return GestureDetector(
      onTap: () => checkDisplayAction(context),
      child: Image.asset(
        BaseBloc.instance.displayType == DisplayType.list_form
            ? 'assets/images/store/store_display.png'
            : 'assets/images/store/store_display_sqr.png',
      ),
    );
  }

  /*---  List ---*/
  Widget _buildList(BuildContext context) {
    return ShopGridListView(
      displayType: BaseBloc.instance.displayType,
      goodsList: provider.goodsInfoList,
      padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 16.0, right: 16.0),
      loverClick: (index) {
        // if (UserInfoManager().isLogin(context)) {
        //   Provider.of<StoreHomeProvider>(context, listen: false)
        //       .isCollectionAction(index);
        // }
      },
    );
  }
}
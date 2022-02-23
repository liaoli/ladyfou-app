/*
 * @Descripttion: TODO
 * @FileName: mine_collection_page
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/23/22 11:13 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:provider/provider.dart';

import '../../../../components/base_scaffold.dart';
import '../../../../core/constant/base_bloc.dart';
import '../../../../core/constant/base_enum.dart';
import '../../../../generated/l10n.dart';
import '../../../../style/Color.dart';
import '../../../../style/text.dart';
import '../../../sort/components/shop_gradient_button.dart';
import '../components/mine_collection_list_view.dart';
import '../store/goods_operation_provider.dart';

class MineCollectionPage extends StatelessWidget {
  MineCollectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
        create: (_) => GoodsOperationProvider(), child: MineCollectionFul());
  }
}

class MineCollectionFul extends StatefulWidget {
  MineCollectionFul({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineCollectionState();
  }
}

class _MineCollectionState extends State<MineCollectionFul> {
  List<String> tabTitles = [];
  late GoodsOperationProvider provider;
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();
  GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState

    provider = Provider.of<GoodsOperationProvider>(context, listen: false);
    provider.getCollectionLists().then((value) {
      // if (provider.goodCollectionList.length > 0) {
      //   tabTitles = getTabTitles(true);
      // } else {
      //   tabTitles = getTabTitles(false);
      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<GoodsOperationProvider>(builder: (context, child, value) {
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
              preferredSize: Size.fromHeight(56.0.w),
              child: BaseAppBar(
                title: Container(
                  child: Text('商品收藏',
                      style: BaseText.style(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryBlackText,
                          fontSize: 14.sp)),
                ),
                elevation: 0,
                actions: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Row(
                      children: [
                        /// 管理-完成
                        GestureDetector(
                          onTap: () {
                            provider.checkEditCollection();
                          },
                          child: Container(
                            child: Text(
                              provider.isEditCollection ? '完成':'管理',
                              style: BaseText.style(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
                  child: Stack(
                    key: _stackKey,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /// 综合筛选
                          tabTitles.length > 0
                              ? GZXDropDownHeader(
                                  items: getItems(),
                                  stackKey: _stackKey,
                                  controller: _dropdownMenuController,
                                  height: 40.w,
                                  color: Colors.white,
                                  borderWidth: 1.w,
                                  borderColor: AppColors.bgGreytr,
                                  dividerHeight: 0.w,
                                  dividerColor: Colors.white,
                                  style: BaseText.style(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryBlackText),
                                  dropDownStyle: BaseText.style(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.navigationColor),
                                  iconSize: 20.w,
                                  iconColor: AppColors.color_FF666666,
                                  iconDropDownColor: AppColors.navigationColor,
                                  onItemTap: (index) {},
                                )
                              : _noDataWidget(context),

                          /// 商品列表
                          tabTitles.length > 0
                              ? Expanded(
                                  child: EasyRefresh.custom(
                                  controller: provider.refreshController,
                                  onRefresh: () async {},
                                  onLoad: () async {},
                                  enableControlFinishLoad: false,
                                  enableControlFinishRefresh: false,
                                  header: MaterialHeader(),
                                  footer: MaterialFooter(),
                                  slivers: <Widget>[
                                    /// List
                                    SliverToBoxAdapter(
                                      child: _buildList(context),
                                    ),
                                  ],
                                ))
                              : SizedBox(),
                        ],
                      ),
                      GZXDropDownMenu(
                          controller: _dropdownMenuController,
                          animationMilliseconds: 300,
                          dropdownMenuChanged: (isShow, index) {
                            print("(已经${isShow ? '显示' : '隐藏'}$index)");
                            BaseBloc.instance.addListenerAllSortShow(isShow);
                          },
                          menus: getBuilderMenus()),
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }

  /// List
  Widget _buildList(BuildContext context) {
    return CollectionGridListView(
      displayType: DisplayType.list_form,
      goodsList: provider.goodCollectionList,
      selectCollectionGoodList: provider.selectCollectionGoodList,
      padding: EdgeInsets.only(
          left: provider.isEditCollection ? 0.w : 16.w, top: 8.0.w, bottom: 16.0.w, right: 16.0.w),
      isEditCollection: provider.isEditCollection,
      loverClick: (index) {
      },
      onCollectionSelectClick: (model) {
        provider.checkSelectCollection(model);
      },
    );
  }

  List<GZXDropDownHeaderItem> getItems() {
    List<GZXDropDownHeaderItem> items = [];
    if (tabTitles.length > 1) {
      items = [
        GZXDropDownHeaderItem(tabTitles[0],
            iconSize: 0.w,
            iconData: Icons.arrow_drop_down,
            iconDropDownData: Icons.arrow_drop_up),
        GZXDropDownHeaderItem(tabTitles[1],
            iconSize: 0.w,
            iconData: Icons.arrow_drop_down,
            iconDropDownData: Icons.arrow_drop_up),
      ];
    }
    if (tabTitles.length > 2) {
      items = [
        GZXDropDownHeaderItem(tabTitles[0],
            iconSize: 0.w,
            iconData: Icons.arrow_drop_down,
            iconDropDownData: Icons.arrow_drop_up),
        GZXDropDownHeaderItem(tabTitles[1],
            iconSize: 0.w,
            iconData: Icons.arrow_drop_down,
            iconDropDownData: Icons.arrow_drop_up),
        GZXDropDownHeaderItem(tabTitles[2],
            iconData: Icons.arrow_drop_down,
            iconDropDownData: Icons.arrow_drop_up),
      ];
    }
    return items;
  }

  List<GZXDropdownMenuBuilder> getBuilderMenus() {
    List<GZXDropdownMenuBuilder> items = [];
    tabTitles.forEach((e) {
      items.add(GZXDropdownMenuBuilder(
        dropDownHeight: 40.w * 5.0,
        dropDownWidget: Container(child: Text('测试')),
      ));
    });
    return items;
  }

  // 无数据缺省页
  Widget _noDataWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: 375.w,
          height: 200,
          child: Image.asset('assets/images/mine/fi_no_collection_goods.png'),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 11.w),
          child: Text(
            '您当前无收藏商品',
            style: BaseText.style(
                fontSize: 12.sp,
                color: AppColors.color_FF999999,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 40.w),
        GradientButton(
          width: 145.w,
          height: 35.w,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          text: '检索商品',
          onTap: () => {},
        ),
      ],
    );
  }
}

List<String> getTabTitles(bool exitData) {
  List<String> tabs = [
    S.current.mine_page_all, // 综合
    S.current.mine_promotion, // 促销
    S.current.store_classification, // 全部分类
  ];
  List<String> noTabs = [
    S.current.mine_page_all, // 综合
    S.current.mine_promotion, // 促销
  ];
  return exitData ? tabs : noTabs;
}
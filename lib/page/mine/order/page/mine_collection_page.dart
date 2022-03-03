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
import '../../../sort/components/classification_widget.dart';
import '../../../sort/components/shop_gradient_button.dart';
import '../../../sort/components/wrap_gradient_widget.dart';
import '../../../sort/page/goods_list_page.dart';
import '../components/mine_collection_list_view.dart';
import '../store/goods_operation_provider.dart';
import '../../../../core/constant/constant.dart';

class MineCollectionPage extends StatefulWidget {
  MineCollectionPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineCollectionState();
  }
}

class _MineCollectionState extends State<MineCollectionPage> {
  List<String> tabTitles = [];
  late GoodsOperationProvider provider;
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();
  GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    provider = GoodsOperationProvider();
    tabTitles = getTabTitles(false);
    provider.getCollectionLists().then((value) {
      if (provider.goodCollectionList.length > 0) {
        tabTitles = getTabTitles(true);
      }
      setState(() {});
    });

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
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Consumer<GoodsOperationProvider>(
              builder: (context, child, value) {
            provider = child;
            return BaseScaffold(
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
                                provider.isEditCollection ? '完成' : '管理',
                                style: BaseText.style(
                                    fontSize: 14,
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryBlackText),
                                    dropDownStyle: BaseText.style(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.navigationColor),
                                    iconSize: 20.w,
                                    iconColor: AppColors.color_FF666666,
                                    iconDropDownColor:
                                        AppColors.navigationColor,
                                    onItemTap: (index) {
                                      if (index < 2) {
                                        _dropdownMenuController.hide();
                                        _dropdownMenuController.isShow = true;
                                        provider
                                            .getCollectionLists(
                                                promotion: index,
                                                isRefresh: true)
                                            .then((value) {
                                          setState(() {});
                                        });
                                      }
                                    },
                                  )
                                : SizedBox(),

                            /// 商品列表
                            provider.goodCollectionList.length > 0
                                ? Expanded(
                                    child: EasyRefresh.custom(
                                    controller: provider.refreshController,
                                    onRefresh: () async {
                                      provider.currentPage += CURRENT_PAGE;
                                      return provider.getCollectionLists(
                                          isRefresh: true,
                                          page: provider.currentPage);
                                    },
                                    onLoad: () async {
                                      provider.currentPage += 1;
                                      return provider.getCollectionLists(
                                          isRefresh: false,
                                          page: provider.currentPage);
                                    },
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
                                : _noDataWidget(context),
                          ],
                        ),
                        GZXDropDownMenu(
                            controller: _dropdownMenuController,
                            animationMilliseconds: 300,
                            dropdownMenuChanging: (isShow, index) {
                              print("(已经${isShow ? '显示' : '隐藏'}$index)");
                              if (!isShow) {
                                if (index == 2) {
                                  BaseBloc.instance
                                      .addListenerCollectionAlertShowShow(
                                          isShow);
                                }
                              }
                            },
                            dropdownMenuChanged: (isShow, index) {
                              if (isShow) {
                                if (index == 2) {
                                  BaseBloc.instance
                                      .addListenerCollectionAlertShowShow(
                                          isShow);
                                }
                              }
                            },
                            menus: getBuilderMenus()),
                        provider.isEditCollection
                            ? Positioned(
                                bottom: 0.w,
                                child: Container(
                                  height: ScreenUtil().bottomBarHeight + 84.w,
                                  width: 375.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          top: BorderSide(
                                              width: 0.5.w,
                                              color:
                                                  AppColors.color_FFDADADA))),
                                  child: buildBottomWidget(),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ));
  }

  /// List
  Widget _buildList(BuildContext context) {
    return Consumer<GoodsOperationProvider>(builder: (context, value, child) {
      return CollectionGridListView(
        displayType: DisplayType.list_form,
        goodsList: value.goodCollectionList,
        selectCollectionGoodList: value.selectCollectionGoodList,
        padding: EdgeInsets.only(
            left: value.isEditCollection ? 0.w : 16.w,
            top: 8.0.w,
            bottom: 16.0.w,
            right: 16.0.w),
        isEditCollection: value.isEditCollection,
        loverClick: (index) {},
        onCollectionSelectClick: (model) {
          provider.checkSelectCollection(model);
          setState(() {});
        },
      );
    });
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
    List<double> list = [1.w * 1, 1.w * 1, 40.w * 4.0];
    list.forEach((e) {
      items.add(_menuBuilder(e));
    });
    return items;
  }

  GZXDropdownMenuBuilder _menuBuilder(double height) {
    return GZXDropdownMenuBuilder(
        dropDownHeight: height,
        dropDownWidget: height < 50.w
            ? Container()
            : StreamBuilder<bool>(
                initialData: false,
                stream: BaseBloc.instance.addListenerCollectionAlertShowStream,
                builder: (ctx, snapshot) {
                  List<ItemButtonModel> models = [];
                  provider.categoryInfoModels.forEach((element) {
                    models.add(
                        ItemButtonModel.fromModel(element.cid, element.name2));
                  });
                  return ClassificationWidget(
                    itemList: models,
                    selectItemList: ItemButtonModel.fromCategoryListItemModels(
                        provider.selectCategoryInfoModels),
                    isShow: snapshot.data ?? false,
                    callBack: (infoModels) {
                      provider.selectCategoryInfoModels =
                          ItemButtonModel.toFindCategoryListItemModels(
                              provider.categoryInfoModels, infoModels);
                      provider.querySortCategoryProducts();
                    },
                    finishCallBack: () {
                      _dropdownMenuController.hide();
                      provider.querySortCategoryProducts();
                    },
                  );
                },
              ));
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
                fontSize: 12,
                color: AppColors.color_FF999999,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 40.w),
        GradientButton(
          width: 145.w,
          height: 35.w,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          text: '检索商品',
          onTap: () {
            GoodsListPage(shopId: 0, title: '');
          },
        ),
      ],
    );
  }

  /// 底部
  Widget buildBottomWidget() {
    return Consumer<GoodsOperationProvider>(builder: (context, value, child) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 15.w),
            InkWell(
                onTap: () {
                  value.checkSelectAll();
                },
                child: Container(
                  child: Row(children: [
                    Image.asset(value.isSelectAll
                        ? "assets/images/sort/fi_check.png"
                        : "assets/images/sort/fi_check_nor.png"),
                    SizedBox(width: 5.w),
                    Text(
                      '全选',
                      style: BaseText.style(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.color_FF333333),
                    )
                  ]),
                )),
            SizedBox(width: 15.w),
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      value.cancleCollection();
                    },
                    child: Container(
                      height: 33.w,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        decoration: BoxDecoration(
                            color: AppColors.color_FFF5F5F5,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.5.w))),
                        child: Text(
                            value.selectCollectionGoodList.length > 0
                                ? '取消收藏(${value.selectCollectionGoodList.length})'
                                : '取消收藏',
                            style: BaseText.style(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.color_FF333333)),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  GestureDetector(
                    onTap: () {
                      List<int> ids = [];
                      value.selectCollectionGoodList.forEach((element) {
                        ids.add(element.id);
                      });
                      value.addToCart(ids);
                    },
                    child: Container(
                      height: 33.w,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        decoration: BoxDecoration(
                            color: AppColors.navigationColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.5.w))),
                        child: Text('加入购物车',
                            style: BaseText.style(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(width: 15.w),
          ],
        ),
      );
    });
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

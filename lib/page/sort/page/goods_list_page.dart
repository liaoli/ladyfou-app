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
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:ladyfou/core/constant/base_bloc.dart';
import 'package:ladyfou/page/sort/components/comprehensive_widget.dart';
import 'package:provider/provider.dart';

import '../../../components/base_scaffold.dart';
import '../../../core/constant/base_enum.dart';
import '../../../core/constant/constant.dart';
import '../../../style/Color.dart';
import '../../../style/text.dart';
import '../../../utils/sputils.dart';
import '../../cart/page/cart_page.dart';
import '../components/classification_widget.dart';
import '../components/shop_grid_list_view.dart';
import '../components/wrap_gradient_widget.dart';
import '../store/sort_provider.dart';
import '../../../generated/l10n.dart';

// class GoodsListPage extends StatelessWidget {
//   final int shopId;
//   final String title;
//
//   GoodsListPage({Key? key, required this.shopId, required this.title})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return ChangeNotifierProvider(
//         create: (_) => SortProvider(),
//         child: GoodsListPageFul(shopId: shopId, title: title));
//   }
// }

class GoodsListPage extends StatefulWidget {
  final int shopId;
  final String title;

  GoodsListPage({Key? key, required this.shopId, required this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _GoodsListPageState();
  }
}

class _GoodsListPageState extends State<GoodsListPage>
    with TickerProviderStateMixin {
  late SortProvider provider;
  bool isDisplay = false;
  bool isEnable = true;
  List<String> tabTitles = [];
  bool isSelect = false;
  int currentIndex = 0;
  int currentAlertIndex = 0;
  late TabController tabController;
  GlobalKey _stackKey = GlobalKey();
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();

  @override
  void initState() {
    // TODO: implement initState

    provider = SortProvider();

    // 请求分类数据
    provider.getCategoryProducts(widget.shopId, isFirst: true).then((value) {
      setState(() {});
    });
    // 请求筛选的数据
    provider.getCategoryChildDatas(widget.shopId).then((value) {
      setState(() {});
    });
    provider.getConditionChildDatas(widget.shopId).then((value) {
      setState(() {});
    });

    tabTitles = getTabTitles();
    tabController = TabController(length: tabTitles.length, vsync: this);

    if (tabController != null) {
      tabController.addListener(() {
      });
    }

    super.initState();
  }

  List<String> getTabTitles() {
    List<String> tabs = [
      S.current.store_comprehensive, // 综合
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
          provider.switchListType(DisplayType.grid_shape);
        } else {
          provider.switchListType(DisplayType.list_form);
        }
        isEnable = true;
      });
    }
  }

  /// 点击跳转购物车
  void checkPushCartAction(BuildContext context) async {
    Get.to(()=> CartPage());
  }

  /// 点击tab切换
  void selectTabItem(int index) {
    // provider.getCategoryProducts(provider.inputKeyword,
    //     shopId: widget.shopId, isFirstInt: true);
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
          child: BaseScaffold(
            leadType: AppBarBackType.Back,
            brightness: Brightness.dark,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(56.0.w),
              child: BaseAppBar(
                title: Container(
                  child: Text(widget.title,
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
                        /// 切换按钮
                        listTypeItem(context),
                        SizedBox(width: 20.w),

                        /// 购物车按钮
                        carItem(context),
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
                  padding: EdgeInsets.only(bottom: 10.0.w),
                  child: Stack(
                    key: _stackKey,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          /// 综合筛选
                          GZXDropDownHeader(
                            items: [
                              GZXDropDownHeaderItem(tabTitles[0],
                                  iconData: Icons.arrow_drop_down,
                                  iconDropDownData: Icons.arrow_drop_up),
                              GZXDropDownHeaderItem(tabTitles[1],
                                  iconData: Icons.arrow_drop_down,
                                  iconDropDownData: Icons.arrow_drop_up),
                              GZXDropDownHeaderItem(tabTitles[2],
                                  iconData: Icons.arrow_drop_down,
                                  iconDropDownData: Icons.arrow_drop_up),
                            ],
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
                            onItemTap: (index) {
                              // if (index == 1) {
                              //   // 请求筛选的数据
                              //   provider.getCategoryChildDatas(widget.shopId).then((value) {
                              //     setState(() {});
                              //   });
                              // }
                              // if (index == 2) {
                              //   provider.getConditionChildDatas(widget.shopId).then((value) {
                              //     setState(() {});
                              //   });
                              // }
                            },
                          ),

                          /// 商品列表
                          Expanded(
                              child: EasyRefresh.custom(
                            controller: provider.refreshController,
                            onRefresh: () {
                              provider.currentPage += CURRENT_PAGE;
                              return provider.getCategoryProducts(widget.shopId,
                                  isRefresh: true, page: provider.currentPage);
                            },
                            onLoad: () {
                              provider.currentPage += 1;
                              return provider.getCategoryProducts(widget.shopId,
                                  isRefresh: false, page: provider.currentPage);
                            },
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
                          )),
                        ],
                      ),
                      GZXDropDownMenu(
                          controller: _dropdownMenuController,
                          animationMilliseconds: 300,
                          dropdownMenuChanging: (isShow, index) {
                            print("(已经${isShow ? '显示' : '隐藏'}$index)");
                            if(!isShow) {
                              if (index == 1) {
                                BaseBloc.instance.addListenerAlertShow(isShow);
                              }
                              if (index == 2) {
                                BaseBloc.instance
                                    .addListenerConditionShow(isShow);
                              }
                            }
                          },
                          dropdownMenuChanged: (isShow,index) {
                            if (isShow) {
                              if (index == 1) {
                                BaseBloc.instance.addListenerAlertShow(isShow);
                              }
                              if (index == 2) {
                                BaseBloc.instance
                                    .addListenerConditionShow(isShow);
                              }
                            }
                          },
                          menus: [
                            GZXDropdownMenuBuilder(
                                dropDownHeight: 40.w * 5.0,
                                dropDownWidget: _buildComprehensive(context)),
                            GZXDropdownMenuBuilder(
                                dropDownHeight: 40.w * 4.0,
                                dropDownWidget: _buildClassification(context)),
                            GZXDropdownMenuBuilder(
                                dropDownHeight: 40.w * 4.0,
                                dropDownWidget: _buildConditions(context)),
                          ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
    // });
  }

  // 分类还是列表按钮
  Widget listTypeItem(BuildContext context) {
    return Consumer<SortProvider>(builder: (context, child, value) {
      return GestureDetector(
        onTap: () => checkDisplayAction(context),
        child: Image.asset(
          BaseBloc.instance.displayType == DisplayType.list_form
              ? 'assets/images/sort/store_display.png'
              : 'assets/images/sort/store_display_sqr.png',
        ),
      );
    });
  }

  /// 购物车按钮
  Widget carItem(BuildContext context) {
    return GestureDetector(
      onTap: () => checkPushCartAction(context),
      child: Image.asset('assets/images/sort/shop_detail_shopcart.png'),
    );
  }

  /// List
  Widget _buildList(BuildContext context) {
    return Consumer<SortProvider>(builder: (context, child, value) {
      return ShopGridListView(
        displayType: BaseBloc.instance.displayType,
        goodsList: provider.goodsInfoList,
        padding:
            EdgeInsets.only(left: 16.0, top: 8.0, bottom: 16.0, right: 16.0),
        loverClick: (index) {
          if (SPUtils.tryToLogin(context)) {
            provider.collectionAction(index);
          }
        },
      );
    });
  }

  /// 综合筛选
  Widget _buildComprehensive(BuildContext context) {
    return ComprehensiveWidget(callBack: (order_type) {});
  }

  /// 全部分类筛选
  Widget _buildClassification(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: false,
        stream: BaseBloc.instance.addListenerAlertShowStream,
        builder: (ctx, snapshot) {
          List<ItemButtonModel> models = [];
          provider.categoryInfoModels.forEach((element) {
            models.add(ItemButtonModel.fromModel(element.id, element.name2));
          });
          return ClassificationWidget(
            itemList: models,
            selectItemList: ItemButtonModel.fromItemModels(provider.selectCategoryInfoModels),
            isShow: snapshot.data ?? false,
            callBack: (infoModels) {
              provider.selectCategoryInfoModels = ItemButtonModel.toFindModels(provider.categoryInfoModels, infoModels);
              setState(() {
              });
            },
          );
        });
  }

  /// 全部条件筛选
  Widget _buildConditions(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: false,
        stream: BaseBloc.instance.addListenerConditionStream,
        builder: (ctx, snapshot) {
          List<ItemButtonModel> models = [];
          provider.conditionInfoModels.forEach((element) {
            models.add(ItemButtonModel.fromModel(element.id, element.name2));
          });
          return ClassificationWidget(
            itemList: models,
            selectItemList: ItemButtonModel.fromItemModels(provider.selectConditionInfoModels),
            isShow: snapshot.data ?? false,
            callBack: (infoModels) {
              provider.selectConditionInfoModels = ItemButtonModel.toFindModels(provider.conditionInfoModels, infoModels);
              setState(() {
              });
            },
          );
        });
  }
}

/*
 * @Descripttion: TODO
 * @FileName: mine_collection_list_view
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/23/22 3:36 PM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/constant/base_enum.dart';
import '../../../../core/model/good_info_model.dart';
import '../../../sort/components/shop_goods_item_widget.dart';
import 'collection_good_item_widget.dart';

typedef CallBackWidget = void Function(int index);
typedef CallCollectionWidget = void Function(GoodsInfoModel model);

class CollectionGridListView extends StatefulWidget {

  final List<GoodsInfoModel> goodsList;
  final List<GoodsInfoModel> selectCollectionGoodList;
  final EdgeInsetsGeometry? padding;
  final CallBackWidget? loverClick;
  final bool isEditCollection;
  // 收藏-点击选中
  final CallCollectionWidget onCollectionSelectClick;
  DisplayType displayType;

  CollectionGridListView({
    Key? key,
    this.padding,
    this.loverClick,
    this.displayType = DisplayType.grid_shape,
    this.isEditCollection = false,
    required this.onCollectionSelectClick,
    this.selectCollectionGoodList = const [],
    required this.goodsList,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CollectionGridListViewState();
  }
}

class CollectionGridListViewState extends State<CollectionGridListView> {
  ScrollController _controller = ScrollController();

  /// 切换列表形态
  void reloadBuild(DisplayType type) {
    //延时执行的代码
    // LogUtil.e('延时执行的代码');
    setState(() {
      //延时更新状态
      // LogUtil.e('延时更新状态');
      widget.displayType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.displayType == DisplayType.list_form
        ? buildListForm(context)
        : buildGridShape(context);
  }

  Widget buildGridShape(BuildContext context) {
    EdgeInsetsGeometry? pagePadding = widget.padding == null
        ? EdgeInsets.only(left: 16.0.w, right: 16.0.w)
        : widget.padding;
    return StaggeredGridView.countBuilder(
      padding: pagePadding,
      shrinkWrap: true,
      controller: _controller,
      crossAxisSpacing: 7,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      itemCount: widget.goodsList.length,
      itemBuilder: (context, index) {
        return ShopGoodsItem(
          goodsModel: widget.goodsList[index],
          onItemClick: () {
            // BaseNavigation.push('goods/detail?id=${widget.goodsList[index].id}',
            //     context: context);
          },
          onItemLikeClick: () {
            // widget.loverClick(index);
          },
          onItemMoreClick: () {
            print('点击更多');
          },
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.fit(1);
      },
    );
  }

  Widget buildListForm(BuildContext context) {
    EdgeInsetsGeometry? pagePadding = widget.padding == null
        ? EdgeInsets.only(left: 16.0.w, right: 16.0.w)
        : widget.padding;
    return AnimationLimiter(
      child: StaggeredGridView.countBuilder(
        padding: pagePadding,
        shrinkWrap: true,
        controller: _controller,
        crossAxisSpacing: 7,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        itemCount: widget.goodsList.length,
        itemBuilder: (context, index) {

          GoodsInfoModel model = widget.goodsList[index];
          bool isExit = false;
          widget.selectCollectionGoodList.forEach((e) {
            if (model.id == e.id) {
              isExit = true;
            }
          });

          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0.w,
              child: FadeInAnimation(
                child: CollectionGoodItem(
                  goodsModel: widget.goodsList[index],
                  isEditCollection: widget.isEditCollection,
                  onItemClick: () {
                    // BaseNavigation.push(
                    //     'goods/detail?id=${widget.goodsList[index].id}',
                    //     context: context);
                  },
                  onItemLikeClick: () {
                    // widget.loverClick(index);
                  },
                  isSelect: isExit,
                  onCollectionSelectClick: (model) {
                    widget.onCollectionSelectClick(model);
                  },
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.fit(2);
        },
      ),
    );
  }
}
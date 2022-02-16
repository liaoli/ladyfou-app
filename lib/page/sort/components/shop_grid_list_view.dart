/*
 * @Descripttion: TODO
 * @FileName: shop_grid_list_view
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/16/22 10:13 AM
 * @LastEditors: tang
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ladyfou/core/model/good_info_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ladyfou/page/sort/components/shop_goods_item2_widget.dart';
import 'package:ladyfou/page/sort/components/shop_goods_item_widget.dart';

import '../../../core/constant/base_enum.dart';

typedef CallBackWidget = void Function(int index);

class ShopGridListView extends StatefulWidget {
  final List<GoodsInfoModel> goodsList;
  final EdgeInsetsGeometry? padding;
  final CallBackWidget? loverClick;
  DisplayType displayType;

  ShopGridListView({
    Key? key,
    this.padding,
    this.loverClick,
    this.displayType = DisplayType.grid_shape,
    required this.goodsList,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShopGridListViewState();
  }
}

class ShopGridListViewState extends State<ShopGridListView> {
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
        ? EdgeInsets.only(left: 16.0, right: 16.0)
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
        ? EdgeInsets.only(left: 16.0, right: 16.0)
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
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ShopGoodsItem2(
                  goodsModel: widget.goodsList[index],
                  onItemClick: () {
                    // BaseNavigation.push(
                    //     'goods/detail?id=${widget.goodsList[index].id}',
                    //     context: context);
                  },
                  onItemLikeClick: () {
                    // widget.loverClick(index);
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
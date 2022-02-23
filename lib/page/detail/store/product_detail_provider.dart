import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/horizontal_scroll_tab_bar.dart';

const int product_index = 1;
const int comment_index = 2;
const int description_index = 3;
const int recommend_index = 4;

class ProductDetailProvider extends ChangeNotifier {
  late ScrollController scrollController;

  final List<TabData> tabS = [];
  TabData product = TabData(title: "商品", index: product_index, selected: true);
  TabData commend = TabData(
    title: "评价",
    index: comment_index,
  );
  TabData description = TabData(
    title: "详情",
    index: description_index,
  );
  TabData recommend = TabData(
    title: "推荐",
    index: recommend_index,
  );

  double productOffset = 0.w;
  double commentOffset = 957.w;
  double descriptionOffset = 1239.w;
  double recommendOffset = 1993.w;

  ProductDetailProvider() {
    scrollController = ScrollController();
    tabS.add(product);
    tabS.add(commend);
    tabS.add(description);
    tabS.add(recommend);
  }

  void resetTabs() {
    tabS.forEach((e) {
      e.selected = false;
    });
  }

  void scroll2Position(TabData tabData) {
    switch (tabData.index) {
      case product_index:
        scrollTo(productOffset);
        break;
      case comment_index:
        scrollTo(commentOffset);
        break;
      case description_index:
        scrollTo(descriptionOffset);
        break;
      case recommend_index:
        scrollTo(recommendOffset);
        break;
    }
  }

  void scrollTo(double position) {
    scrollController.jumpTo(position);
  }
}

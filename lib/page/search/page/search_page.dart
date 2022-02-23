// 搜索页

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladyfou/components/search_bar.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 15,
        automaticallyImplyLeading: false,
        title: Container(
          height: 32,
          child: _searchBarWidget(),
        ),
      ),
      body: NormalWidget(),
    );
  }

  Widget _searchBarWidget() {
    return SearchBar(
      controller: TextEditingController(),
      barBgColor: AppColors.primaryBackground,
      actions: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 12),
            child: Text(
              '取消',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NormalWidget extends StatelessWidget {
  const NormalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _historyWidget(context),
        TabListWidget(),
      ],
    );
  }

  // 历史记录
  Widget _historyWidget(BuildContext context) {
    List searchList = [
      '连衣裙',
      '冬季大衣女',
      '连帽卫衣',
      '羽绒服',
      '保暖加厚羊毛衫',
      '圣诞新款潮服',
      '男鞋',
      '短裙'
    ];
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 0, 2, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '历史搜索',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlackText51,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/search/delete_icon.png'),
                  ),
                )
              ],
            ),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.start,
              children: searchList
                  .map((index) => _itemWidget(context, index))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(BuildContext context, String index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Text(
          index,
          style: TextStyle(color: AppColors.primaryBlackText51, fontSize: 10),
        ),
      ),
    );
  }
}

class TabListWidget extends StatefulWidget {
  TabListWidget({Key? key}) : super(key: key);

  @override
  State<TabListWidget> createState() => _TabListWidgetState();
}

class _TabListWidgetState extends State<TabListWidget>
    with TickerProviderStateMixin {
  List _orderList = ['人气', 'INS', '新品', '推荐'];
  late TabController _tabController;
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: _orderList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 36, left: 12, right: 12),
        padding: EdgeInsets.only(top: 20),
        height: 205,
        decoration: new BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              tabs: _orderList.map((f) {
                return Text(f);
              }).toList(),
              controller: _tabController,
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              labelColor: AppColors.color_E34D59,
              unselectedLabelColor: AppColors.color_FF666666,
              labelStyle:
                  myTextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              unselectedLabelStyle:
                  myTextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              onTap: (int index) {
                selectIndex = index;
              },
            ),
            Container(
              height: 1,
              color: AppColors.primaryBackground,
              margin: EdgeInsets.fromLTRB(12, 10, 12, 11),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: createPages(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createPages() {
    List<Widget> desList = [];
    for (int i = 0; i < _orderList.length; i++) {
      desList.add(
        TabItemListWidget(
          pageIndex: i,
        ),
      );
    }
    return desList;
  }
}

class TabItemListWidget extends StatefulWidget {
  TabItemListWidget({Key? key, this.pageIndex = 0}) : super(key: key);
  final int pageIndex;
  @override
  State<TabItemListWidget> createState() => _TabItemListWidgetState();
}

class _TabItemListWidgetState extends State<TabItemListWidget> {
  List rowList = [
    {'title': 'シフォンの春にぴっ', 'hot_num': '1100'},
    {'title': 'カジュアルスウ', 'hot_num': '800'},
    {'title': '4色展開スタン', 'hot_num': '200'}
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        itemCount: rowList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          String iconImg = 'assets/images/search/rank_first.png';
          if (index == 1) {
            iconImg = 'assets/images/search/rank_second.png';
          } else if (index == 2) {
            iconImg = 'assets/images/search/rank_third.png';
          }
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            height: 41,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(iconImg, width: 22),
                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          rowList[index]['title'],
                          style: myTextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.primaryBlackText51,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    '热度：${rowList[index]['hot_num']}',
                    style: myTextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: AppColors.Color_E34D59,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

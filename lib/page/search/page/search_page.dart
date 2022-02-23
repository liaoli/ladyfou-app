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
        automaticallyImplyLeading: false, //隐藏返回箭头
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
      child: Column(
        children: [
          TabBar(
            tabs: _orderList.map((f) {
              return Text(f);
            }).toList(),
            controller: _tabController,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: AppColors.primaryBlackText,
            unselectedLabelColor: AppColors.primaryBlackText,
            labelStyle: myTextStyle(height: 2, fontSize: 12),
            onTap: (int index) {
              selectIndex = index;
            },
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _orderList.map((e) {
                return Container();
              }).toList(),
            ),
          ),
        ],
      ),
    ));
  }

  List<Widget> createPages() {
    List<Widget> desList = [];
    for (int i = 0; i < _orderList.length; i++) {
      desList.add(
        // TabItemListWidget(
        //   pageIndex: i,
        // ),
        Container(),
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

class _TabItemListWidgetState extends State<TabItemListWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}

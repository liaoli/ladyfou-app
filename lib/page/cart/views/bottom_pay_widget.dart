import 'package:flutter/material.dart';
import 'package:ladyfou/style/Color.dart';

class BottomPayWidget extends StatelessWidget {
  const BottomPayWidget({Key? key}) : super(key: key);

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(
  //     length: _tabValues.length,
  //     vsync: ScrollableState(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double bottomSafeHg = MediaQuery.of(context).padding.bottom;
    double screenWd = MediaQuery.of(context).size.width;
    double couponsWd = (screenWd - 36) / 2.6; // 优惠券按钮宽度

    return Container(
      padding: EdgeInsets.fromLTRB(12, 13, 12, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 0.5, color: AppColors.transparent_Black3),
        ),
      ),
      height: bottomSafeHg + 76,
      width: screenWd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "合计金额：",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlackText51),
              ),
              TextSpan(
                text: "3,479円 ",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlackText51),
              ),
              TextSpan(
                text: "(不含配送费)",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.jp_color153),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            height: 33,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _showDiscountsWidget(context, bottomSafeHg),
                  child: Container(
                    alignment: Alignment.center,
                    width: couponsWd,
                    height: 33,
                    decoration: new BoxDecoration(
                      color: AppColors.color_FCE6E9,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Text(
                      '使用积分/优惠券',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryBlackText51),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      color: AppColors.color_E34D59,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Text(
                      '购入',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDiscountsWidget(BuildContext context, double bottomSafeHg) {
    List<String> _tabValues = ['积分使用', '优惠券'];
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (BuildContext bc) {
          return Container(
            width: double.infinity,
            height: 134 + bottomSafeHg,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        width: 4,
                        color: AppColors.primaryBackground,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 44,
                        child: TabBar(
                          tabs: _tabValues.map((value) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(value),
                            );
                          }).toList(),

                          indicator: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(255, 111, 397, 1),
                                Color.fromRGBO(222, 0, 32, 1),
                              ],
                            ),
                          ),
                          //indicatorColor: Colors.transparent,
                          isScrollable: true,
                          labelColor: AppColors.primaryBlackText51,
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            // color: AppColors.jp_color153,
                          ),
                          unselectedLabelColor: AppColors.jp_color153,
                          unselectedLabelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            // color: AppColors.jp_color153,
                          ),
                          // controller: _tabController,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 7),
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            'assets/images/close_icon.png',
                            width: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: TabBarView(
                //     controller: _tabController,
                //     children: createPages(),
                //   ),
                // )
              ],
            ),
          );
        });
  }

  // 列表
  // List<Widget> createPages() {
  //   List<Widget> desList = [];
  //   for (int i = 0; i < _tabValues.length; i++) {
  //     desList.add(Container());
  //   }
  //   return desList;
  // }
}

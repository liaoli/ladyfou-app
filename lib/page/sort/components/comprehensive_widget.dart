/*
 * @Descripttion: TODO
 * @FileName: comprehensive_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/18/22 10:27 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

import '../../../generated/l10n.dart';

typedef CallBackWidget = void Function(String order_type);

class ComprehensiveWidget extends StatefulWidget {
  final CallBackWidget callBack;

  ComprehensiveWidget({Key? key, required this.callBack}) : super(key: key);

  @override
  _ComprehensiveState createState() => _ComprehensiveState();
}

class _ComprehensiveState extends State<ComprehensiveWidget> {
  List<Map> titleList = [];

  @override
  void initState() {
    // TODO: implement initState

    titleList = bodyList();

    super.initState();
  }

  List<Map> bodyList() {
    return [
      {
        "title": S.current.store_comprehensive, // 综合
        "isSelect": 1,
        "order_type": ""
      },
      {
        "title": S.current.home_new_products, // 新品
        "isSelect": 0,
        "order_type": "created_at|desc"
      },
      {
        "title": S.current.price_news_asc, // 升序
        "isSelect": 0,
        "order_type": "price|asc"
      },
      {
        "title": S.current.price_news_desc, // 降序
        "isSelect": 0,
        "order_type": "price|desc"
      },
      {
        "title": S.current.best_high, // 最高人气
        "isSelect": 0,
        "order_type": "saled|desc"
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ListView.builder(
            itemCount: titleList.length,
            itemBuilder: (condex, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    titleList
                        .asMap()
                        .keys
                        .map((idx) => {
                              if (idx == index)
                                {
                                  if (titleList[idx]['isSelect'] == 0)
                                    {titleList[idx]['isSelect'] = 1}
                                  else
                                    {titleList[idx]['isSelect'] = 0}
                                }
                              else
                                {titleList[idx]['isSelect'] = 0}
                            })
                        .toList();
                    widget.callBack(titleList[index]['order_type']);
                  });
                },
                child: Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 20, right: 20.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(titleList[index]['title'],
                            style: BaseText.style(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: titleList[index]['isSelect'] == 0
                                    ? AppColors.jp_color153
                                    : AppColors.primaryBlackText)),
                      ),
                      Image.asset(titleList[index]['isSelect'] == 0
                          ? 'assets/images/sort/fi_check_nor.png'
                          : 'assets/images/sort/fi_check.png')
                    ],
                  ),
                ),
              );
            }));
  }
}

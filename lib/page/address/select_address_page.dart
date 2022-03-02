import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/horizontal_scroll_tab_bar.dart';
import 'package:ladyfou/components/line.dart';
import 'package:ladyfou/page/address/components/select_address_head.dart';
import 'package:ladyfou/page/address/store/select_address_provicer.dart';
import 'package:provider/provider.dart';

import '../../components/clicked_Image_asset.dart';
import '../../style/Color.dart';
import 'components/city_list_view.dart';
import 'components/county_list_view.dart';
import 'components/province_list_view.dart';

class SelectAddressPage extends StatefulWidget {
  const SelectAddressPage({Key? key}) : super(key: key);

  @override
  _SelectAddressPageState createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
  late SelectedAddressProvider provider;

  int index = province_index;

  PageController pageController = PageController(keepPage: true);

  @override
  void initState() {
    provider = SelectedAddressProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
        body: Column(
          children: [
            head(),
            Line(
              width: double.infinity,
              height: 10.w,
            ),
            SelectAddressHead(onTap: (TabData tab) {
              pageController.jumpToPage(tab.index);
            }),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                pageSnapping: false,
                children: [
                  ProvinceListView(),
                  CityListView(),
                  CountyListView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget head() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      height: 44.w,
      child: Row(
        children: [
          Text(
            "请选择所在地区",
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(child: SizedBox()),
          ClickedImageAsset(
            image: "assets/images/history/browsing_history_close.png",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

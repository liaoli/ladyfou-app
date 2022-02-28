import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

import '../../../components/common_label.dart';
import '../../../components/search_bar.dart';

class CSSearchHead extends StatefulWidget {
  const CSSearchHead({Key? key}) : super(key: key);

  @override
  _CSSearchHeadState createState() => _CSSearchHeadState();
}

class _CSSearchHeadState extends State<CSSearchHead> {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar();
  }

  Widget buildSearchBar() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(
            controller: TextEditingController(),
            enabled: false,
            barBgColor: AppColors.color_FFF5F5F5,
          ),
          SizedBox(
            height: 10.w,
          ),
          Wrap(
            children: searchKeyItems(),
            spacing: 10.w,
            runSpacing: 10.w,
          )
        ],
      ),
    );
  }

  List<String> searchKey = ["常见问题汇总", "商品购买", "邮费及配送", "积分"];

  List<CommonLabelData<String>> searchKeyDataS = [];

  List<Widget> searchKeyItems() {
    if (searchKeyDataS.length == 0) {
      searchKeyDataS = searchKey.map((e) {
        return CommonLabelData(
            label: e,
            isSelected: false,
            data: e,
            default_bg: AppColors.transparent,
            selected_bg: AppColors.Color_E34D59,
            default_text_color: AppColors.color_FF333333,
            selected_text_color: AppColors.white,
            selected_borderColor: AppColors.Color_E34D59,
            default_borderColor: AppColors.color_FF999999,
            height: 20.w,
            width: 120.w,
            borderRadius: 16.w,
            useTextWidth: true);
      }).toList();
    }

    List<Widget> children = searchKeyDataS
        .map(
          (e) => GestureDetector(
            onTap: () {
              searchKeyDataS.forEach((e) {
                e.isSelected = false;
              });
              e.isSelected = true;

              setState(() {});
            },
            child: CommonLabel(
              model: e,
            ),
          ),
        )
        .toList();

    return children;
  }
}

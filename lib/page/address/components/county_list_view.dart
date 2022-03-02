import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:provider/provider.dart';

import '../../../components/line.dart';
import '../../../core/http/request.dart';
import '../../../core/model/province_list_model.dart';
import '../../../core/utils/toast.dart';
import '../../../style/Color.dart';
import '../../../utils/address_sort_util.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../model/string_suspension_bean.dart';
import '../store/select_address_provicer.dart';
import 'address_list_item_view.dart';

class CountyListView extends StatefulWidget {
  const CountyListView({Key? key}) : super(key: key);

  @override
  _CountyListViewState createState() => _CountyListViewState();
}

class _CountyListViewState extends State<CountyListView>
    with AutomaticKeepAliveClientMixin {
  List<String> counties = [];
  List<StringSuspensionBean> dataList = [];
  final ItemScrollController itemScrollController = ItemScrollController();
  late SelectedAddressProvider provider;

  @override
  void initState() {
    provider = Provider.of(context, listen: false);
    provider.getCounties().then((value) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context, listen: true);
    counties = provider.counties;
    loadData();
    return Column(
      children: [
        Expanded(
          child: AzListView(
            data: dataList,
            indexBarData: AddressSortUtil.getTagIndexList(dataList),
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              StringSuspensionBean model = dataList[index];
              return getListItem(context, model);
            },
            itemScrollController: itemScrollController,
            susItemBuilder: (BuildContext context, int index) {
              StringSuspensionBean model = dataList[index];
              return getSusItem(context, model.getSuspensionTag());
            },
            indexBarOptions: IndexBarOptions(
              needRebuild: true,
              selectTextStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              selectItemDecoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF333333)),
              indexHintWidth: 96,
              indexHintHeight: 97,
              indexHintDecoration: BoxDecoration(color: AppColors.Color_E34D59),
              indexHintAlignment: Alignment.centerRight,
              indexHintTextStyle: TextStyle(
                  fontSize: 10.0,
                  color: AppColors.color_FF666666,
                  fontWeight: FontWeight.w500),
              indexHintOffset: Offset(-30, 0),
            ),
          ),
        )
      ],
    );
  }

  void loadData() async {
    dataList = counties.map((e) {
      String pinyin = PinyinHelper.getPinyinE(e);
      String tag = pinyin.substring(0, 1).toUpperCase();

      String tagIndex = "#";
      if (RegExp("[A-Z]").hasMatch(tag)) {
        tagIndex = e.substring(0, 1);
      }
      return StringSuspensionBean(
        name: e,
        tagIndex: tagIndex,
      );
    }).toList();

    _handleList();
  }

  void _handleList() {
    if (dataList.isEmpty) {
      setState(() {});
      return;
    }

    // A-Z sort.
    AddressSortUtil.sortListBySuspensionTag(dataList);

    // show sus tag.
    AddressSortUtil.setShowSuspensionStatus(dataList);

    setState(() {});

    if (itemScrollController.isAttached) {
      itemScrollController.jumpTo(index: 0);
    }
  }

  Widget getSusItem(BuildContext context, String tag, {double susHeight = 24}) {
    return AddressSusItem(
      susHeight: susHeight,
      tag: tag,
    );
  }

  Widget getListItem(BuildContext context, StringSuspensionBean model,
      {double susHeight = 50}) {
    return InkWell(
      child: AddressListItem(
        susHeight: susHeight,
        text: model.name,
      ),
      onTap: () {

        Navigator.pop(context,);
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/model/province_list_model.dart';
import '../../../style/Color.dart';
import '../../../utils/address_sort_util.dart';
import '../store/select_address_provicer.dart';
import 'address_list_item_view.dart';

class ProvinceListView extends StatefulWidget {
  const ProvinceListView({Key? key}) : super(key: key);

  @override
  _ProvinceListViewState createState() => _ProvinceListViewState();
}

class _ProvinceListViewState extends State<ProvinceListView>
    with AutomaticKeepAliveClientMixin {
  List<ProvinceModel> provinces = [];
  final ItemScrollController itemScrollController = ItemScrollController();
  late SelectedAddressProvider provider;

  @override
  void initState() {
    provider = Provider.of(context, listen: false);

    provider.getProvinces().then((value){

      setState(() {

      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provinces = provider.provinces;
    loadData();
    return Column(
      children: [
        Expanded(
          child: AzListView(
            data: provinces,
            indexBarData: AddressSortUtil.getTagIndexList(provinces),
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: provinces.length,
            itemBuilder: (BuildContext context, int index) {
              ProvinceModel model = provinces[index];
              return getListItem(context, model);
            },
            itemScrollController: itemScrollController,
            susItemBuilder: (BuildContext context, int index) {
              ProvinceModel model = provinces[index];
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
    provinces.forEach((e) {
      String pinyin = PinyinHelper.getPinyinE(e.name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      e.pinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        e.tagIndex = e.name.substring(0, 1);
      } else {
        e.tagIndex = "#";
      }
    });

    _handleList();
  }

  void _handleList() {
    if (provinces.isEmpty) {
      setState(() {});
      return;
    }

    // A-Z sort.
    AddressSortUtil.sortListBySuspensionTag(provinces);

    // show sus tag.
    AddressSortUtil.setShowSuspensionStatus(provinces);

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

  Widget getListItem(BuildContext context, ProvinceModel model,
      {double susHeight = 50}) {
    return InkWell(
      child: AddressListItem(
        susHeight: susHeight,
        text: model.name,
      ),
      onTap: () {
        provider.provinceModel = model;
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

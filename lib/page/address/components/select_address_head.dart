import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/horizontal_scroll_tab_bar.dart';
import '../store/select_address_provicer.dart';

class SelectAddressHead extends StatelessWidget {

  final ValueSetter<TabData>? onTap;
  const SelectAddressHead({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectedAddressProvider  provider = Provider.of(context, listen: true);
    return  HorizontalScrollTabBar(
        dataS: provider.getTabs(),
        onTap: onTap );
  }
}

/*
 * @Descripttion: TODO
 * @FileName: shop_management_options
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/16/22 10:32 AM
 * @LastEditors: tang
 */

import 'package:flutter/cupertino.dart';

class ManagementOptions extends StatefulWidget {
  ManagementOptions(
      {Key? key,
        this.isOptions = false,
        this.selectUrl,
        this.unchecked,
        this.onTap,
        this.width = 16,
        this.isEnable = true})
      : super(key: key);
  final bool isOptions;
  final bool isEnable;
  final double width;
  final Function? onTap;
  final String? selectUrl;
  final String? unchecked;

  @override
  _ManagementOptionsState createState() => _ManagementOptionsState();
}

class _ManagementOptionsState extends State<ManagementOptions> {
  @override
  Widget build(BuildContext context) {
    String? url = widget.unchecked != null
        ? widget.unchecked
        : 'assets/images/mine/management_options_false.png';
    if (widget.isOptions) {
      url = widget.selectUrl != null
          ? widget.selectUrl
          : 'assets/images/mine/management_options_true.png';
    }
    if (widget.isEnable) {
      return GestureDetector(
        onTap: () => widget.onTap!(),
        child: Container(
          width: widget.width,
          child: Image.asset('$url'),
        ),
      );
    }
    return Container(
      width: widget.width,
      child: Image.asset('$url'),
    );
  }
}
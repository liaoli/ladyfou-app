import 'package:flutter/material.dart';

// 选中和非选中复选框
class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({Key? key, this.isSelect = false}) : super(key: key);
  final bool isSelect;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    String imgAsset = widget.isSelect
        ? 'assets/images/cart/checkbox_select.png'
        : 'assets/images/cart/checkbox_unselect.png';
    return Container(
      width: 32,
      child: Image.asset(imgAsset, width: 16),
    );
  }
}

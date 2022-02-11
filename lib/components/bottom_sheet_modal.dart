import 'package:flutter/material.dart';
import 'package:ladyfou/style/Color.dart';

bottomSheetModal(
  BuildContext context,
  Widget child,
) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SingleChildScrollView(
            child: SizedBox(
                child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: child,
        )));
      });
}

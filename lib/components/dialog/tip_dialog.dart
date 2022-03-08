import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/line.dart';

import '../../style/Color.dart';

class TipDialogView extends StatefulWidget {
  final Function? sure;

  final Function? cancel;

  final String tips;
  final String leftButton;
  final String rightButton;

  const TipDialogView(
      {Key? key,
      this.sure,
      this.cancel,
      this.leftButton = "取消",
      this.rightButton = "确认",
      this.tips = "确认要删除地址吗？"})
      : super(key: key);

  @override
  _TipDialogViewState createState() => _TipDialogViewState();
}

class _TipDialogViewState extends State<TipDialogView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99.w,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.tips,
                  style:
                      TextStyle(color: AppColors.color_FF333333, fontSize: 12),
                )
              ],
            ),
          ),
          Line(
            height: 1.w,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 41.w,
                  child: TextButton(
                    onPressed: () {
                      if (widget.cancel == null) {
                        widget.cancel!();
                      }

                      Navigator.pop(context);
                    },
                    child: Text(
                      widget.leftButton,
                      style: TextStyle(color: AppColors.black, fontSize: 12),
                    ),
                    style: TextButton.styleFrom(),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 41.w,
                  child: TextButton(
                    onPressed: () {
                      if (widget.sure != null) {
                        widget.sure!();
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      widget.rightButton,
                      style: TextStyle(color: AppColors.black, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

YYDialog TipDialog(BuildContext context, {Function? sure, Function? cancel}) {
  return YYDialog().build(context)
    ..width = 283.w
    ..height = 99.w
    ..borderRadius = 20.w
    ..widget(
      Padding(
        padding: EdgeInsets.all(0.0),
        child: TipDialogView(
          sure: sure,
          cancel: cancel,
        ),
      ),
    )
    ..show();
}

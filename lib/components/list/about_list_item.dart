import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:ladyfou/style/text.dart';

/// 列表项
class AboutListItem extends StatefulWidget {
  // 点击事件
  final VoidCallback? onPressed;


  // 标题
  final String? title;
  final Color titleColor;

  // 右侧控件
  final Widget? rightWidget;

  // 构造函数
  AboutListItem({
    Key? key,
    this.onPressed,

    this.title,
    this.titleColor: Colors.black,

    this.rightWidget,
  }) : super(key: key);

  @override
  _AboutListItemState createState() => _AboutListItemState();
}

class _AboutListItemState extends State<AboutListItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Container(
          height: 40.0,
          width: double.infinity,
          child: Row(
            children: <Widget>[

              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    widget.title != null
                        ? Text(
                      widget.title!,
                        style: myTextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                    )
                        : Container(),

                  ],
                ),
              ),
              widget.rightWidget == null ? Container() : widget.rightWidget!,
              Container(
                width: 15.0,
              ),
            ],
          )),
    );
  }
}

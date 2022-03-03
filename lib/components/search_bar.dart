import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/style/Color.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final List<Widget>? actions; // 右边按钮
  final double barHeight;
  final Color barBgColor;
  final bool enabled;

  SearchBar({Key? key,
    this.placeholder = "Search",
    required this.controller,
    this.actions,
    this.barHeight = 28,
    this.enabled = true,
    this.barBgColor = AppColors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(12),
        height: barHeight,
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 0.33),
                  color: barBgColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  enabled: enabled,
                  autofocus: false,
                  onChanged: (value) {},
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        bottom: 12.w
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.color_FF999999,
                    ),
                    suffixIcon: Offstage(
                      offstage: controller.text.isEmpty,
                      child: InkWell(
                        onTap: () {
                          controller.clear();
                        },
                        child: Icon(
                          Icons.cancel,
                          color: AppColors.color_FF999999,
                        ),
                      ),
                    ),
                    border: InputBorder.none,
                    hintText: "当前热搜词",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.color_FF999999,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            // 输入框右边添加按钮
            _actionsWidget(),
          ],
        ));
  }

  Widget _actionsWidget() {
    if (actions != null && actions!.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: actions!,
      );
    } else {
      return Container();
    }
  }
}

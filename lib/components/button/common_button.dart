import 'package:flutter/material.dart';
import 'package:ladyfou/style/Color.dart';

class CommonButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color bg;
  final Color diableBg;
  final BorderRadius? borderRadius;
  final Function()? onTap;
  final bool enable;
  final Color borderColor;

  const CommonButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.child,
      this.diableBg = AppColors.color_E7E7E7,
      this.bg = AppColors.Color_E34D59,
      this.enable = true,
      this.borderRadius,
      this.borderColor = AppColors.transparent,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null && enable) {
          onTap!();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: enable ? bg : diableBg,
          border: new Border.all(color: this.borderColor, width: 1),
        ),
        child: child,
      ),
    );
  }
}

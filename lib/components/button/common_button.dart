import 'package:flutter/material.dart';
import 'package:ladyfou/style/Color.dart';

class CommonButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color bg;
  final BorderRadius? borderRadius;
  final Function()? onTap;

  const CommonButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.child,
      this.bg = AppColors.Color_E34D59,
      this.borderRadius,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: width,
          height: height,
          color: bg,
          child: child,
        ),
      ),
    );
  }
}

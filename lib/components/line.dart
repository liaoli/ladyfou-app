import 'package:flutter/material.dart';

import '../style/Color.dart';

class Line extends StatelessWidget {
  final Color color;
  final double? width;
  final double? height;

  const Line({
    Key? key,
    this.width,
    this.height,
    this.color = AppColors.color_EAEAEA,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color_EAEAEA,
      height: height ?? double.infinity,
      width: width ?? double.infinity,
    );
  }
}

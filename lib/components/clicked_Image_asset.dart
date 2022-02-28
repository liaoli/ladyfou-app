import 'package:flutter/material.dart';

class ClickedImageAsset extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final Function()? onTap;
  final BoxFit? fit;

  const ClickedImageAsset({
    Key? key,
    required this.image,
     this.width,
     this.height,
    this.fit,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Image.asset(
        image,
        fit:fit,
        width: width,
        height: height,

      ),
      onTap: onTap,
    );
  }
}

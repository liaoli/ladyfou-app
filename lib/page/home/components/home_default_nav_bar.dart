import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/search_bar.dart';
import 'package:ladyfou/router/router.dart';

import '../../../components/clicked_Image_asset.dart';

class HomeDefaultNavBar extends StatefulWidget {
  const HomeDefaultNavBar({Key? key}) : super(key: key);

  @override
  _HomeDefaultNavBarState createState() => _HomeDefaultNavBarState();
}

class _HomeDefaultNavBarState extends State<HomeDefaultNavBar> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headHeight = 92.w;

    return Container(
      height: headHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
      child: defaultHead(),
    );
  }

  Row defaultHead() {
    return Row(
      children: [
        SizedBox(
          width: 12.w,
        ),
        Image.asset(
          "assets/images/home/home_head_logo.png",
          width: 105.w,
          height: 28.w,
          fit: BoxFit.cover,
        ),
        Expanded(child: SizedBox()),
        buildImageAsset(
            image: "assets/images/home/home_head_search.png",
            onTap: () {
              //TODO:跳转
            }),
        SizedBox(
          width: 12.w,
        ),
        buildImageAsset(
            image: "assets/images/home/home_head_heart.png",
            onTap: () {
              //TODO:跳转
            }),
        SizedBox(
          width: 12.w,
        ),
        buildImageAsset(
            image: "assets/images/home/home_shopping_cart.png",
            onTap: () {
              XRouter.goCartPage();
            }),
        SizedBox(
          width: 12.w,
        ),
      ],
    );
  }
}

Widget buildImageAsset({required String image, Function()? onTap}) {
  return ClickedImageAsset(
    image: image,
    height: 20.w,
    width: 20.w,
    onTap: onTap,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/search_bar.dart';

import 'home_default_nav_bar.dart';

class HomeSearchNavBar extends StatefulWidget {
  const HomeSearchNavBar({Key? key}) : super(key: key);

  @override
  _HomeSearchNavBarState createState() => _HomeSearchNavBarState();
}

class _HomeSearchNavBarState extends State<HomeSearchNavBar> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headHeight = 92.w;

    return Container(
      height: headHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home/home_head_search_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 12.w,
          ),
          buildImageAsset(
            image: "assets/images/home/home_head_message.png",
              onTap: () {
                //TODO:跳转
              }
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(child: SearchBar(controller: TextEditingController())),
          SizedBox(
            width: 12.w,
          ),
          buildImageAsset(
            image: "assets/images/home/home_head_heart.png",
              onTap: () {
                //TODO:跳转
              }
          ),
          SizedBox(
            width: 12.w,
          ),
          buildImageAsset(
            image: "assets/images/home/home_shopping_cart.png",
              onTap: () {
                //TODO:跳转
              }
          ),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
    );
  }
}

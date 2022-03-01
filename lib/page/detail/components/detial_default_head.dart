import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladyfou/components/search_bar.dart';
import 'package:ladyfou/style/Color.dart';
import 'package:provider/provider.dart';

import '../../../components/clicked_Image_asset.dart';
import '../../../components/horizontal_scroll_tab_bar.dart';
import '../../../router/router.dart';
import '../store/product_detail_provider.dart';

class DetailDefaultNavBar extends StatefulWidget {
  const DetailDefaultNavBar({Key? key}) : super(key: key);

  @override
  _DetailDefaultNavBarState createState() => _DetailDefaultNavBarState();
}

class _DetailDefaultNavBarState extends State<DetailDefaultNavBar> {
  late double opacity = 0;

  bool whiteIcon = false;

  late ProductDetailProvider productDetailProvider;

  @override
  void initState() {
    productDetailProvider =
        Provider.of<ProductDetailProvider>(context, listen: false);

    productDetailProvider.scrollController.addListener(() {
      double offset = productDetailProvider.scrollController.offset;

      double h = (375 + 40).w;

      if (offset < h) {
        setState(() {
          opacity = offset / h;
          if (opacity < 0) {
            opacity = 0;
          }
          whiteIcon = false;
        });
      } else {
        whiteIcon = true;
        if (opacity != 1) {
          setState(() {
            opacity = 1;
          });
        }
      }

      if (offset < productDetailProvider.commentOffset) {
        productDetailProvider.resetTabs();
        productDetailProvider.product.selected = true;
        setState(() {});
      } else if (offset < productDetailProvider.descriptionOffset) {
        productDetailProvider.resetTabs();
        productDetailProvider.commend.selected = true;
        setState(() {});
      } else if (offset < productDetailProvider.recommendOffset) {
        productDetailProvider.resetTabs();
        productDetailProvider.description.selected = true;
        setState(() {});
      } else {
        productDetailProvider.resetTabs();
        productDetailProvider.recommend.selected = true;
        setState(() {});
      }

      debugPrint("${opacity}");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double headHeight = 92.w;

    return Container(
      height: headHeight,
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: BoxDecoration(
        color: opacity > 0 ? AppColors.transparent : AppColors.white,
        image: DecorationImage(
          opacity: opacity,
          image: AssetImage('assets/images/home/home_head_search_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: defaultHead(),
    );
  }

  Row defaultHead() {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.w,
              color: whiteIcon ? AppColors.white : AppColors.color_FF333333,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Expanded(
            child: HorizontalScrollTabBar(
          dataS: productDetailProvider.tabS,
          onTap: (TabData tab) {
            productDetailProvider.scroll2Position(tab);
          },
        )),
        SizedBox(
          width: 12.w,
        ),
        shoppingCart(),
        SizedBox(
          width: 12.w,
        ),
        more(),
        SizedBox(
          width: 12.w,
        ),
      ],
    );
  }

  Widget more() {
    return buildImageAsset(
        image: getMoreIcon(),
        onTap: () {
          //TODO:跳转
        });
  }

  Widget shoppingCart() {
    return buildImageAsset(
        image: getShoppingCartIcon(),
        onTap: () {
          //TODO:跳转
          XRouter.goCartPage();
        });
  }

  String getShoppingCartIcon() {
    return whiteIcon
        ? "assets/images/home/home_shopping_cart.png"
        : "assets/images/action_bar_shopping_cart_black.png";
  }

  String getMoreIcon() {
    return whiteIcon
        ? "assets/images/more_icon_white.png"
        : "assets/images/more_icon.png";
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

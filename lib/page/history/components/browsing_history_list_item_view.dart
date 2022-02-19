import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/components/clicked_Image_asset.dart';

import '../../../style/Color.dart';

class BrowsingHistoryListItemView extends StatelessWidget {
  const BrowsingHistoryListItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(new Radius.circular(10.w)),
          child: Stack(
            children: [
              CachedNetworkImage(
                width: 110.w,
                height: 110.w,
                imageUrl:
                    "http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: SpinKitFadingCircle(color: AppColors.Color_E34D59),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Positioned(
                top: 6.w,
                left: 6.w,
                child: ClickedImageAsset(
                  image: "assets/images/history/browsing_history_delete.png",
                  onTap: () {
                    //TODO:delete history
                  },
                ),
              ),
              Positioned(
                bottom: 6.w,
                right: 6.w,
                child: ClickedImageAsset(
                  image: "assets/images/history/browsing_history_like.png",
                  onTap: () {
                    //TODO:delete history
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.w,
        ),
        Row(
          children: [
            Text(
              "￥4475",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ladyfou/page/detail/components/thumbs_up_view.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../style/Color.dart';
import '../../../utils/net_image_url_util.dart';
import '../store/product_detail_provider.dart';

class ProductDescriptionList extends StatefulWidget {
  final Widget background;
  final EdgeInsetsGeometry padding;
  final int count;

  const ProductDescriptionList({
    Key? key,
    required this.background,
    required this.padding,
    this.count = 2,
  }) : super(key: key);

  @override
  _ProductDescriptionListState createState() => _ProductDescriptionListState();
}

class _ProductDescriptionListState extends State<ProductDescriptionList> {
  @override
  Widget build(BuildContext context) {
    ProductDetailProvider provider = Provider.of(context, listen: false);

    List<String> imgs = provider.detailModel!.contentImages!;

    return SliverStack(
      insetOnOverlap: false, // defaults to false
      children: <Widget>[
        SliverPositioned.fill(
          child: widget.background,
        ),
        SliverPadding(
          padding: widget.padding,
          sliver: SliverGrid(
            //Grid
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, //Grid按两列显示
              mainAxisSpacing: 12.w,
              crossAxisSpacing: 12.w,
              childAspectRatio: 1 / 1,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return ProductDescriptionItemView(
                  img: imgs[index],
                );
              },
              childCount: imgs.length,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductDescriptionItemView extends StatelessWidget {
  final String img;

  const ProductDescriptionItemView({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(new Radius.circular(10.w)),
      child: CachedNetworkImage(
        width: 327.w,
        height: 327.w,
        imageUrl: getImageUrl(img),
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
    );
  }
}

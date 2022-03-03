import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../core/model/daily_new_product_list_model.dart';
import '../../../style/Color.dart';
import '../../detail/product_detail_page.dart';
import '../new_product_page.dart';
import '../store/home_provider.dart';

class DailyNewProductView extends StatefulWidget {
  const DailyNewProductView({Key? key}) : super(key: key);

  @override
  _DailyNewProductViewState createState() => _DailyNewProductViewState();
}

class _DailyNewProductViewState extends State<DailyNewProductView> {
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of(context, listen: true);
    return ClipRRect(
      borderRadius: new BorderRadius.all(new Radius.circular(10.w)),
      child: Container(
        height: 183.w,
        color: AppColors.white,
        width: double.infinity,
        child: Column(
          children: [
            head(),
            DailyNewProductList(
              data: homeProvider.dailyNew,
            ),
          ],
        ),
      ),
    );
  }

  Widget head() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 44.w,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 12.w,
            ),
            Image.asset(
              "assets/images/home/daily_new_icon.png",
              width: 16.w,
              height: 16.w,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              "NEW",
              style: TextStyle(
                color: AppColors.color_FF333333,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Container(
              height: 13.w,
              width: 1.w,
              color: AppColors.color_FFDADADA,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              "每日上新",
              style: TextStyle(
                color: AppColors.color_FF999999,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Expanded(
              child: SizedBox(
                width: 1,
              ),
            ),
            Row(
              children: [
                Text(
                  "立即查看",
                  style: TextStyle(
                    color: AppColors.color_FF999999,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Image.asset(
                  "assets/images/home/daily_new_arrow.png",
                  width: 7.w,
                  height: 12.w,
                ),
              ],
            ),
            SizedBox(
              width: 12.w,
            ),
          ],
        ),
      ),
      onTap: () {
        Get.to(() => NewProductPage());
      },
    );
  }
}

class DailyNewProductList extends StatelessWidget {
  final List<DailyNewProduct> data;

  const DailyNewProductList({Key? key, this.data = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 139.w,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 15.w, top: 0.w, bottom: 6.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          DailyNewProduct product = data[index];
          return GestureDetector(
            child: DailyNewProductItemView(
              dailyNewProduct: product,
            ),
            onTap: () {
              Get.to(() => ProductDetailPage());
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12.w,
          );
        },
        itemCount: data.length,
      ),
    );
  }
}

class DailyNewProductItemView extends StatelessWidget {
  final DailyNewProduct dailyNewProduct;

  const DailyNewProductItemView({
    required this.dailyNewProduct,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(10.w),
            child: CachedNetworkImage(
              width: 86.w,
              height: 86.w,
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
          ),
          SizedBox(
            height: 6.w,
          ),
          Text(
            dailyNewProduct.name ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.color_FF666666,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 2.w,
          ),
          Text(
            "￥${dailyNewProduct.price ?? 0}",
            style: TextStyle(
              color: AppColors.color_FF333333,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

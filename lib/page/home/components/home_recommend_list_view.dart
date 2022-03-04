import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/home_provider.dart';
import 'recommend_product_list.dart';

class HomeRecommendListView extends StatelessWidget {
  const HomeRecommendListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context, listen: true);
    return RecommendProductList(
      data: homeProvider.reCommend,
    );
  }
}

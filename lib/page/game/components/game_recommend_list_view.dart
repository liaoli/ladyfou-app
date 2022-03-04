import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../home/components/recommend_product_list.dart';
import '../store/game_provider.dart';



class GameRecommendListView extends StatelessWidget {
  const GameRecommendListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameProvider homeProvider = Provider.of(context, listen: true);
    return RecommendProductList(
      data: homeProvider.reCommend,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
    );
  }
}

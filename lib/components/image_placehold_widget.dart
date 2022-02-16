/*
 * @Descripttion: TODO
 * @FileName: image_placehold_widget
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 5:44 PM
 * @LastEditors: tang
 */

// 封装图片加载控件，图片加载失败时加载默认图片

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ladyfou/core/utils/utils.dart';
import 'dart:io';

typedef CallbackAction = void Function();

class ImagePlaceholdWidget extends StatelessWidget {
  ImagePlaceholdWidget(
      {required this.url,
      this.w,
      this.imgError,
      this.h,
      this.defImagePath = 'assets/images/home/placeholder.jpg',
      this.fill = BoxFit.fill});
  final CallbackAction? imgError;
  final String url;
  final double? w;
  final double? h;
  final String? defImagePath;
  final BoxFit? fill;

  @override
  Widget build(BuildContext context) {
    String imgUrl = url;
    imgUrl = imgUrl.contains('assets/') ? imgUrl : Utils.url(imgUrl);
    if (imgUrl.isEmpty) {
      return Image.asset(defImagePath!, width: w, height: h, fit: fill);
    } else if (imgUrl.contains('http')) {
      return CachedNetworkImage(
          imageUrl: Utils.url(imgUrl),
          fit: fill,
          width: w,
          height: h,
          // 默认国
          placeholder: (_, __) {
            return Image.asset(defImagePath!, width: w, height: h, fit: fill);
          },
          // 请求失败
          errorWidget: (
            _,
            __,
            ___,
          ) {
            if (imgError != null) imgError!();
            return Icon(Icons.error);
          });
    } else if (url.contains('file://')) {
      imgUrl = imgUrl.substring(7);
      return Image.file(
        File(imgUrl),
        width: 62,
        height: 62,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(imgUrl, width: w, height: h, fit: fill);
    }
  }
}

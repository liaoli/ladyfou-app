/*
 * @Descripttion: TODO
 * @FileName: base_image_load
 * @version: 1.0.0
 * @Author: ladyfou-app
 * @Date: 2/14/22 5:44 PM
 * @LastEditors: tang
 */

// 封装图片加载控件，图片加载失败时加载默认图片

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ladyfou/core/http/http.dart';
import 'package:ladyfou/core/utils/utils.dart';
import 'dart:io';

import '../core/http/base_url.dart';

typedef CallbackAction = void Function();

class BaseImageLoading extends StatelessWidget {
  BaseImageLoading({
    required this.url,
    this.width,
    this.imgError,
    this.height,
    this.placehold =
        'http://ccshop-erp.neverdown.cc/storage/app/uploads/public/620/371/65e/62037165e02aa022387786.jpg', // 需要给UI要占位图
    this.fill = BoxFit.fill,
  });
  final CallbackAction? imgError;
  final String url;
  final double? width;
  final double? height;
  final String? placehold;
  final BoxFit? fill;

  @override
  Widget build(BuildContext context) {
    // 没有图片
    if (url.isEmpty) {
      return Image.asset(placehold!, width: width, height: height, fit: fill);
    }
    // 本地图片(后台给的图片地址，有的也是assets/images，不过会带有plugins，排除掉)
    else if (url.contains('assets/images') && !url.contains('plugins/')) {
      return Image.asset(url, width: width, height: height, fit: fill);
    } else if (url.contains('file:')) {
      // 相册图片
      String imgUrl = url.substring(7);
      return Image.file(
        File(imgUrl),
        width: width,
        height: height,
        fit: fill,
      );
    } else {
      String imgUrl;
      if (url.contains('http:') || url.contains('https:')) {
        imgUrl = url;
      } else {
        imgUrl = baseUrl + url;
      }
      return CachedNetworkImage(
          imageUrl: Utils.url(imgUrl),
          fit: fill,
          width: width,
          height: height,
          // 默认图
          placeholder: (_, __) {
            return Image.asset(placehold!,
                width: width, height: height, fit: fill);
          },
          // 加载失败
          errorWidget: (
            _,
            __,
            ___,
          ) {
            if (imgError != null) imgError!();
            return Icon(Icons.error);
          });
    }
  }
}

 import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeaderImageItem extends StatelessWidget {


  final GestureTapCallback? cb;
  final double height;
  final String imageUrl;
  final double width;

  HeaderImageItem({Key? key,this.cb ,this.height = 76,this.width = 76,this.imageUrl = "http://img1.mukewang.com/5c18cf540001ac8206000338.jpg"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.black,
      child: InkWell(

        onTap: cb,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(height/2),

          child: CachedNetworkImage(
            fit: BoxFit.fitWidth,

            placeholder: (context, url) => Container(
              // color: Colors.grey[200],
              child:  Image(image:AssetImage("assets/images/header_image.jpg")),
            ),
            imageUrl: imageUrl,
            errorWidget:
                (BuildContext context, String url, dynamic error) {
              return SizedBox();
            },

          ),
        ),

      ),

    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:payuung_clone/presentation/shared/loaders/shimmer_circle.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle({Key? key, this.height, this.width, this.image})
      : super(key: key);
  final double? width, height;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image!,
      height: height,
      width: width,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return ShimmerCircle(
            height: height, width: width, padding: EdgeInsets.zero);
      },
      errorWidget: (context, url, error) {
        return ShimmerCircle(
            height: height, width: width, padding: EdgeInsets.zero);
      },
    );
  }
}

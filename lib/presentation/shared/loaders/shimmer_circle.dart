import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircle extends StatefulWidget {
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  const ShimmerCircle({Key? key, this.height, this.width, this.padding})
      : super(key: key);

  @override
  State<ShimmerCircle> createState() => _ShimmerCircleState();
}

class _ShimmerCircleState extends State<ShimmerCircle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: widget.width ?? double.infinity,
              height: widget.height ?? 49.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/online_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OnlineImageContainer extends StatelessWidget {
  const OnlineImageContainer({
    super.key,
    this.color,
    this.radius,
    this.height,
    this.width,
    this.padding,
    required this.imageUrl,
  });
  final String imageUrl;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(
            radius ?? SizesManager.bigRoundedCorners,
          ),
        ),
        child: OnlineImage(
          imageUrl: imageUrl,
          padding: padding ?? SizesManager.padding14,
        ),
      ),
    );
  }
}

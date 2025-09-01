import 'package:ecommerce/core/utils/sizes_manager.dart';
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
        child: Image.network(
          imageUrl,
          fit: BoxFit.scaleDown,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              // Image has finished loading, return the image
              return Padding(
                padding: EdgeInsets.all(padding ?? SizesManager.padding14),
                child: child,
              );
            } else {
              return Skeletonizer.zone(
                ignorePointers: false,
                enabled: true,
                switchAnimationConfig: SwitchAnimationConfig(
                  duration: const Duration(seconds: 1),
                ),
                child: Bone.square(
                  size: height,
                  borderRadius: BorderRadius.circular(
                    radius ?? SizesManager.bigRoundedCorners,
                  ),
                ),
              );
            }
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
        ),
      ),
    );
  }
}

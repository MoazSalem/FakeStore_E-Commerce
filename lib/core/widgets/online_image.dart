import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OnlineImage extends StatelessWidget {
  const OnlineImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.scaleDown,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          // Image has finished loading, return the image
          return child;
        } else {
          return Skeletonizer(
            child: Bone.square(
              borderRadius: BorderRadius.circular(
                SizesManager.bigRoundedCorners,
              ),
            ),
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}

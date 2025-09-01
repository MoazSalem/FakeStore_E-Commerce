import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OnlineImage extends StatelessWidget {
  const OnlineImage({super.key, required this.imageUrl, this.padding = 0});
  final String imageUrl;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 200),
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        padding: EdgeInsets.all(padding),
        child: Image(image: imageProvider, fit: BoxFit.scaleDown),
      ),
      fit: BoxFit.scaleDown,
      placeholder: (context, url) => Skeletonizer(
        enabled: true,
        child: Skeleton.leaf(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(
                SizesManager.bigRoundedCorners,
              ),
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

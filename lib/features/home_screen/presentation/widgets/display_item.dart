import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DisplayItem extends StatelessWidget {
  final Product product;
  final bool isTall;
  const DisplayItem({super.key, this.isTall = false, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: SizesManager.padding20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: SizesManager.displayItemWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SizesManager.displayItemWidth,
                  clipBehavior: Clip.antiAlias,
                  height: isTall
                      ? SizesManager.tallDisplayItemHeight
                      : SizesManager.displayItemHeight,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(
                      SizesManager.bigRoundedCorners,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(SizesManager.padding14),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.scaleDown,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          // Image has finished loading, return the image
                          return child;
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: SizesManager.padding10),
                Text(
                  product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: SizesManager.font14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: SizesManager.padding5),
                Text(
                  product.category,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: SizesManager.padding10),
                Row(
                  spacing: SizesManager.padding5,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: SizesManager.padding5),
                    SvgPicture(AssetBytesLoader(AssetsManager.star)),
                    Text(
                      product.rating.rate.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: SizesManager.font12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: SizesManager.padding,
              right: SizesManager.padding,
            ),
            child: Container(
              width: SizesManager.heartRadius,
              height: SizesManager.heartRadius,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  SizesManager.bigRoundedCorners,
                ),
              ),
              child: UnconstrainedBox(
                child: SvgPicture(
                  AssetBytesLoader(AssetsManager.heart),
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.surface,
                    BlendMode.srcIn,
                  ),
                  height: SizesManager.iconSize20,
                  width: SizesManager.iconSize20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

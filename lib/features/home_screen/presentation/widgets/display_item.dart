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
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 170,
                height: isTall ? 260 : 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    SizesManager.bigRoundedCorners,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(height: SizesManager.padding10),
              Text(
                product.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: SizesManager.font16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: SizesManager.padding5),
              Text(
                product.description,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: SizesManager.padding10),
              SizedBox(
                width: 170,
                child: Row(
                  spacing: 20,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        SvgPicture(AssetBytesLoader(AssetsManager.star)),
                        Text(
                          "5.0",
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(SizesManager.padding20),
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
                  height: SizesManager.iconSize16,
                  width: SizesManager.iconSize16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/image_container.dart';
import 'package:ecommerce/core/widgets/online_image.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/details_screen/presentation/screens/details_screen.dart';
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
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailsScreen(id: product.id)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: SizesManager.padding20),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              width: SizesManager.displayItemWidth,
              child: Column(
                children: [
                  ImageContainer(
                    height: isTall
                        ? SizesManager.tallDisplayItemHeight
                        : SizesManager.displayItemHeight,
                    width: double.infinity,
                    child: OnlineImage(imageUrl: product.image),
                  ),
                  ProductDetails(product: product, theme: theme),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(SizesManager.padding),
              child: CircularButton(
                padding: SizesManager.padding5,
                backgroundColor: theme.colorScheme.primary,
                child: SvgImage(
                  asset: AssetsManager.heart,
                  color: theme.colorScheme.onPrimary,
                  height: SizesManager.iconSize20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product, required this.theme});

  final Product product;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            const SizedBox(width: SizesManager.padding10),
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
    );
  }
}

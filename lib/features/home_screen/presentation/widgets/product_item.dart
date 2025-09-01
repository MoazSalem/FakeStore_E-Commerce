import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/online_image_container.dart';
import 'package:ecommerce/core/widgets/save_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/details_screen/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final bool isTall;

  const ProductItem({super.key, this.isTall = false, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              ProductDetailsScreen(id: product.id, product: product),
        ),
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
                  OnlineImageContainer(
                    height: isTall
                        ? SizesManager.tallDisplayItemHeight
                        : SizesManager.displayItemHeight,
                    width: double.infinity,
                    imageUrl: product.image,
                  ),
                  ProductDetails(product: product, theme: theme),
                ],
              ),
            ),
            Skeleton.ignore(
              child: Padding(
                padding: const EdgeInsets.all(SizesManager.padding),
                child: SaveButton(productId: product.id),
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
            SvgImage(
              asset: AssetsManager.star,
              height: SizesManager.iconSize18,
            ),
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

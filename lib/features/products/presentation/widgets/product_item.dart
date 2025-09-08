import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/online_image_container.dart';
import 'package:ecommerce/core/widgets/save_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final bool isTall;

  const ProductItem({super.key, this.isTall = false, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => {
        Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                  id: widget.product.id,
                  product: widget.product,
                ),
              ),
            )
            .then(
              (value) => {
                _animationController.reset(),
                _animationController.forward(),
              },
            ),
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: SizesManager.padding20),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              width: SizesManager.displayItemWidth,
              child: Column(
                children: [
                  Hero(
                    tag: widget.product.id,
                    child: OnlineImageContainer(
                      height: widget.isTall
                          ? SizesManager.tallDisplayItemHeight
                          : SizesManager.displayItemHeight,
                      width: double.infinity,
                      imageUrl: widget.product.image,
                    ),
                  ),
                  ProductDetails(product: widget.product, theme: theme),
                ],
              ),
            ),
            Skeleton.ignore(
              child: Padding(
                padding: const EdgeInsets.all(SizesManager.padding),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SaveButton(productId: widget.product.id),
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

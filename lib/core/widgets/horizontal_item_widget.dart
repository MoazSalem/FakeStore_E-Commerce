import 'package:ecommerce/core/utils/navigation_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/online_image_container.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class HorizontalItemWidget extends StatelessWidget {
  final Product product;
  final String uniqueTag;
  final bool pressable;

  const HorizontalItemWidget({
    super.key,
    required this.product,
    this.uniqueTag = '0',
    this.pressable = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(SizesManager.roundedCorners),
      onTap: () {
        Navigator.pushNamed(
          context,
          NavigationManager.detailsScreen,
          arguments: [product, uniqueTag],
        );
      },
      child: Row(
        spacing: SizesManager.padding10,
        children: [
          Container(
            width: SizesManager.savedItemSide,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizesManager.roundedCorners),
              color: theme.colorScheme.primaryContainer,
            ),
            child: Hero(
              tag: uniqueTag,
              child: OnlineImageContainer(
                height: SizesManager.savedItemSide,
                imageUrl: product.image,
                padding: 10,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(SizesManager.padding8),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: SizesManager.savedItemContainerMinHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: SizesManager.font15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      product.category,
                      style: TextStyle(
                        fontSize: SizesManager.font12,
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    SizedBox(height: SizesManager.padding5),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontSize: SizesManager.font15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

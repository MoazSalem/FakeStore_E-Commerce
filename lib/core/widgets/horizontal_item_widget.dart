import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/online_image_container.dart';
import 'package:ecommerce/features/details_screen/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:flutter/material.dart';

class HorizontalItemWidget extends StatelessWidget {
  final Product product;
  const HorizontalItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(SizesManager.roundedCorners),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              id: product.id,
              product: product,
              uniqueTag: '00${product.id}',
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizesManager.padding10),
        child: Row(
          spacing: SizesManager.padding10,
          children: [
            Container(
              width: SizesManager.savedItemSide,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SizesManager.roundedCorners,
                ),
                color: theme.colorScheme.primaryContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.all(SizesManager.padding8),
                child: Hero(
                  tag: '00${product.id}',
                  child: OnlineImageContainer(
                    height: SizesManager.savedItemSide,
                    imageUrl: product.image,
                    padding: 0,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        product.category,
                        style: TextStyle(
                          fontSize: SizesManager.font12,
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
      ),
    );
  }
}

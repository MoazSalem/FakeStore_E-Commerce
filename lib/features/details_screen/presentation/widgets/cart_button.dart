import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/cart_screen/presentation/controller/cart_cubit.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CartButton extends StatefulWidget {
  const CartButton({
    super.key,
    required this.product,
    required this.productCount,
  });

  final Product product;
  final int productCount;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomButton(
      onPressed: isAdded
          ? () {
              try {
                GetIt.I<CartCubit>().removeProduct(
                  widget.product.id,
                  quantity: widget.productCount,
                );
                setState(() {
                  isAdded = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Item Removed from Cart"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              } catch (e) {
                SnackBar(
                  content: Text("Something went wrong, item is not removed"),
                  duration: const Duration(seconds: 2),
                );
              }
            }
          : () {
              try {
                GetIt.I<CartCubit>().addProductToCart(
                  widget.product,
                  widget.productCount,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Item Added to Cart"),
                    duration: const Duration(seconds: 2),
                  ),
                );
                setState(() {
                  isAdded = true;
                });
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Something went wrong, item is not added"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: SizesManager.padding,
        children: [
          SvgImage(asset: AssetsManager.cart),
          Text(
            isAdded
                ? 'Remove from Cart'
                : 'Add to Cart | \$${widget.product.price}',
            style: TextStyle(
              fontSize: SizesManager.font16,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/snack_bar.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/cart/presentation/controller/cart_cubit.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
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
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(customSnackBar("Item Removed from Cart"));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                          "Something went wrong, item is not removed from cart",
                        ),
                      );
                    }
                  }
                : () {
                    try {
                      GetIt.I<CartCubit>().addProductToCart(
                        widget.product,
                        widget.productCount,
                      );
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(customSnackBar("Item Added to Cart"));
                      setState(() {
                        isAdded = true;
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                          "Something went wrong, item is not added to cart",
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
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

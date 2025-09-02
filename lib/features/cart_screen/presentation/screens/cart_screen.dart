import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_divider.dart';
import 'package:ecommerce/core/widgets/custom_error_widget.dart';
import 'package:ecommerce/core/widgets/horizontal_item_widget.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/features/cart_screen/presentation/controller/cart_cubit.dart';
import 'package:ecommerce/features/cart_screen/presentation/widgets/cart_amount_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Cart'),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoaded) {
              return state.products.isNotEmpty
                  ? Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: SizesManager.padding20,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  "Checkout | \$${state.totalAmount.toStringAsFixed(2)} ",
                                  style: TextStyle(
                                    fontSize: SizesManager.font16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: SizesManager.padding20),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: SizesManager.padding10,
                              ),
                              child: ListView.builder(
                                itemCount: state.products.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            HorizontalItemWidget(
                                              uniqueTag:
                                                  '01${state.products[index].id}',
                                              product: state.products[index],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: CartAmountRow(
                                                state: state,
                                                index: index,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        child: CustomDivider(),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Expanded(child: Center(child: Text('No Products')));
            } else if (state is CartError) {
              return Expanded(
                child: CustomErrorWidget(
                  message: state.message,
                  statusCode: state.statusCode,
                ),
              );
            } else {
              return Expanded(child: const LoadingWidget());
            }
          },
        ),
      ],
    );
  }
}

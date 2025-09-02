import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/amount_row.dart';
import 'package:ecommerce/features/cart_screen/presentation/controller/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAmountRow extends StatelessWidget {
  const CartAmountRow({super.key, required this.state, required this.index});
  final CartLoaded state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AmountRow(
      amount: state.cart.productsDetails[index].quantity,
      onAdd: () => BlocProvider.of<CartCubit>(context).changeQuantity(
        productId: state.products[index].id,
        state: state,
        isIncrement: true,
      ),
      onRemove: state.cart.productsDetails[index].quantity > 1
          ? () => BlocProvider.of<CartCubit>(context).changeQuantity(
              productId: state.products[index].id,
              state: state,
              isIncrement: false,
            )
          : null,
      amountTextSize: SizesManager.font14,
      iconSize: SizesManager.iconSize14,
      buttonsPadding: SizesManager.padding5,
      spacing: SizesManager.padding10,
    );
  }
}

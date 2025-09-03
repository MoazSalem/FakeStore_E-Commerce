import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/amount_row.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/features/cart_screen/presentation/controller/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAmountRow extends StatelessWidget {
  const CartAmountRow({super.key, required this.state, required this.index});
  final CartLoaded state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RemoveButton(id: state.products[index].id),
        const SizedBox(width: SizesManager.padding),
        AmountRow(
          amount: state.cart.productsDetails[index].quantity,
          onAdd: () => BlocProvider.of<CartCubit>(context).updateItemCount(
            productId: state.products[index].id,
            isIncrement: true,
          ),
          onRemove: state.cart.productsDetails[index].quantity > 1
              ? () => BlocProvider.of<CartCubit>(context).updateItemCount(
                  productId: state.products[index].id,
                  isIncrement: false,
                )
              : null,
          amountTextSize: SizesManager.font14,
          iconSize: SizesManager.iconSize14,
          buttonsPadding: SizesManager.padding5,
          spacing: SizesManager.padding10,
        ),
      ],
    );
  }
}

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      elevation: 0,
      padding: SizesManager.padding5,
      side: const BorderSide(color: Colors.red),
      child: const Icon(
        Icons.delete,
        color: Colors.red,
        size: SizesManager.iconSize16,
      ),
      onTap: () {
        BlocProvider.of<CartCubit>(context).removeProduct(id);
      },
    );
  }
}

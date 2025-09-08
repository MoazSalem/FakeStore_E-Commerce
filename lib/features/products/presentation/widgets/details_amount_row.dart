import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/amount_row.dart';
import 'package:ecommerce/features/products/presentation/controller/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsAmountRow extends StatelessWidget {
  const DetailsAmountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return state is DetailsLoaded
            ? AmountRow(
                spacing: SizesManager.padding10,
                amount: state.productCount,
                onRemove: state.productCount > 1
                    ? () => BlocProvider.of<DetailsCubit>(context)
                          .changeProductCount(
                            state.productCount - 1,
                            state.product,
                          )
                    : null,
                onAdd: () => BlocProvider.of<DetailsCubit>(
                  context,
                ).changeProductCount(state.productCount + 1, state.product),
              )
            : const SizedBox();
      },
    );
  }
}

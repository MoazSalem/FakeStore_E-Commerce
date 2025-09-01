import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/features/details_screen/presentation/controller/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AmountRow extends StatelessWidget {
  const AmountRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return state is DetailsLoaded
            ? Row(
                mainAxisSize: MainAxisSize.min,
                spacing: SizesManager.padding10,
                children: [
                  CircularButton(
                    elevation: 0,
                    side: BorderSide(
                      color: theme.colorScheme.outline,
                      width: 1,
                    ),
                    onTap: state.productCount > 0
                        ? () => BlocProvider.of<DetailsCubit>(context)
                              .changeProductCount(
                                state.productCount - 1,
                                state.product,
                              )
                        : null,
                    child: Icon(
                      fontWeight: FontWeight.bold,
                      Icons.remove,
                      size: SizesManager.iconSize16,
                    ),
                  ),
                  Text(
                    state.productCount.toString(),
                    style: TextStyle(
                      fontSize: SizesManager.font16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CircularButton(
                    elevation: 0,
                    side: BorderSide(
                      color: theme.colorScheme.outline,
                      width: 1,
                    ),
                    child: Icon(
                      fontWeight: FontWeight.bold,
                      Icons.add,
                      size: SizesManager.iconSize16,
                    ),
                    onTap: () => BlocProvider.of<DetailsCubit>(
                      context,
                    ).changeProductCount(state.productCount + 1, state.product),
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }
}

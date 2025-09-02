import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_divider.dart';
import 'package:ecommerce/core/widgets/horizontal_item_widget.dart';
import 'package:ecommerce/core/widgets/amount_row.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Cart'),
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
                "Checkout | \$695.00 ",
                style: TextStyle(
                  fontSize: SizesManager.font16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: SizesManager.padding20),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return state is ProductsLoaded
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SizesManager.padding10,
                      ),
                      child: ListView.builder(
                        itemCount: state.firstList.length,
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
                                          '01${state.firstList[index].id}',
                                      product: state.firstList[index],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AmountRow(
                                        amount: 1,
                                        onAdd: () {},
                                        onRemove: () {},
                                        amountTextSize: SizesManager.font14,
                                        iconSize: SizesManager.iconSize14,
                                        buttonsPadding: SizesManager.padding5,
                                        spacing: SizesManager.padding10,
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
                  )
                : const Expanded(child: Center(child: Text('No Products')));
          },
        ),
      ],
    );
  }
}

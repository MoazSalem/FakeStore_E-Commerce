import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: SizesManager.padding,
        bottom: SizesManager.padding80,
        left: SizesManager.padding,
        right: SizesManager.padding,
      ),
      sliver: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return state is ProductsLoaded
              // the view is split into two lists one taller than the other
              ? SliverCrossAxisGroup(
                  slivers: [
                    SliverFixedExtentList(
                      itemExtent: 344,
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Center(
                          child: DisplayItem(product: state.firstList[index]),
                        );
                      }, childCount: state.firstList.length),
                    ),
                    SliverFixedExtentList(
                      itemExtent: 364,
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Center(
                          child: DisplayItem(
                            isTall: true,
                            product: state.secondList[index],
                          ),
                        );
                      }, childCount: state.secondList.length),
                    ),
                  ],
                )
              : const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
        },
      ),
    );
  }
}

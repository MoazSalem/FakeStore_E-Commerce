import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/display_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: SizesManager.padding,
        horizontal: SizesManager.padding,
      ),
      sliver: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return state is ProductsLoaded
              ? SliverCrossAxisGroup(
                  slivers: [
                    SliverFixedExtentList(
                      itemExtent: 344,
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Center(child: DisplayItem());
                      }, childCount: 12),
                    ),
                    SliverFixedExtentList(
                      itemExtent: 364,
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Center(child: DisplayItem(isTall: true));
                      }, childCount: 11),
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

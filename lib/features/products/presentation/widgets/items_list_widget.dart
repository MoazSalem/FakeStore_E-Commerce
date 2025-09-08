import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ItemsListWidget extends StatelessWidget {
  final List<Product> firstList;
  final List<Product> secondList;

  const ItemsListWidget({
    super.key,
    required this.firstList,
    required this.secondList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: SizesManager.padding,
        bottom: SizesManager.padding80,
        left: SizesManager.padding,
        right: SizesManager.padding,
      ),
      sliver:
          // the view is split into two lists one taller than the other
          SliverCrossAxisGroup(
            slivers: [
              SliverFixedExtentList(
                itemExtent: 344,
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Center(child: ProductItem(product: firstList[index]));
                }, childCount: firstList.length),
              ),
              SliverFixedExtentList(
                itemExtent: 364,
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Center(
                    child: ProductItem(
                      isTall: true,
                      product: secondList[index],
                    ),
                  );
                }, childCount: secondList.length),
              ),
            ],
          ),
    );
  }
}

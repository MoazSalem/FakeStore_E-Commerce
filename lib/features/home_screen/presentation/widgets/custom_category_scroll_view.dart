import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class CustomCategoryScrollView extends StatelessWidget {
  const CustomCategoryScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: false,
      titleSpacing: SizesManager.padding20,
      expandedHeight: 20,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      title: SizedBox(
        height: SizesManager.categoryHeight,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...List.generate(
              8,
              (index) => CategoryItem(isSelected: index == 0),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  const CategoryItem({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.surface;
    final foregroundColor = isSelected
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurface;
    return SizedBox(
      width: 100,
      height: 6,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizesManager.roundedCorners),
          side: BorderSide(
            width: isSelected ? 0 : 1,
            color: theme.colorScheme.outline,
          ),
        ),
        elevation: 0,
        color: color,
        margin: EdgeInsets.only(right: SizesManager.padding),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Icon(
                Icons.gamepad_outlined,
                size: SizesManager.iconSize20,
                color: foregroundColor,
              ),
              Text('Item', style: TextStyle(color: foregroundColor)),
            ],
          ),
        ),
      ),
    );
  }
}

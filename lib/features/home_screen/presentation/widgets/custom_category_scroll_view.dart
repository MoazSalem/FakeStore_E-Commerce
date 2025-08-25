import 'package:flutter/material.dart';

class CustomCategoryScrollView extends StatelessWidget {
  const CustomCategoryScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
        child: SizedBox(
          height: 36,
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
        ? theme.colorScheme.inverseSurface
        : theme.colorScheme.surface;
    final foregroundColor = isSelected
        ? theme.colorScheme.surface
        : theme.colorScheme.inverseSurface;
    return SizedBox(
      width: 100,
      height: 6,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 1,
            color: isSelected ? Colors.transparent : Colors.grey,
          ),
        ),
        elevation: 0,
        color: color,
        margin: EdgeInsets.only(right: 16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Icon(Icons.gamepad_outlined, size: 20, color: foregroundColor),
              Text('Item', style: TextStyle(color: foregroundColor)),
            ],
          ),
        ),
      ),
    );
  }
}

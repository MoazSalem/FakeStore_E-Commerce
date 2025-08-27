import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCategoryScrollView extends StatefulWidget {
  const CustomCategoryScrollView({super.key});

  @override
  State<CustomCategoryScrollView> createState() =>
      _CustomCategoryScrollViewState();
}

class _CustomCategoryScrollViewState extends State<CustomCategoryScrollView> {
  int _currentIndex = 0;
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
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoaded) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    state.categories.length + 1,
                    (index) => GestureDetector(
                      onTap: () => setState(() {
                        _currentIndex = index;
                      }),
                      child: CategoryItem(
                        isSelected: index == _currentIndex,
                        category: index == 0
                            ? 'All'
                            : state.categories.elementAt(index - 1),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String category;
  const CategoryItem({
    super.key,
    this.isSelected = false,
    required this.category,
  });

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
        margin: EdgeInsets.only(right: SizesManager.padding10),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SizesManager.padding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                // Icon(
                //   Icons.gamepad_outlined,
                //   size: SizesManager.iconSize20,
                //   color: foregroundColor,
                // ),
                Text(category, style: TextStyle(color: foregroundColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

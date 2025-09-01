import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCategoryScrollView extends StatefulWidget {
  const CustomCategoryScrollView({super.key, required this.categories});
  final Set<String> categories;

  @override
  State<CustomCategoryScrollView> createState() =>
      _CustomCategoryScrollViewState();
}

class _CustomCategoryScrollViewState extends State<CustomCategoryScrollView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      primary: false,
      titleSpacing: SizesManager.padding20,
      expandedHeight: 20,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      title: SizedBox(
        height: SizesManager.categoryHeight,
        child: ListView(
          key: const PageStorageKey('category_list'),
          scrollDirection: Axis.horizontal,
          children: [
            ...List.generate(
              widget.categories.length + 1,
              (index) => GestureDetector(
                onTap: () => {
                  setState(() {
                    _currentIndex = index;
                  }),
                  GetIt.I.get<ProductsCubit>().filterProducts(
                    index == 0 ? 'All' : widget.categories.elementAt(index - 1),
                  ),
                },
                child: Skeleton.leaf(
                  child: CategoryItem(
                    isSelected: index == _currentIndex,
                    category: index == 0
                        ? 'All'
                        : widget.categories.elementAt(index - 1),
                  ),
                ),
              ),
            ),
          ],
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
                Text(category, style: TextStyle(color: foregroundColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

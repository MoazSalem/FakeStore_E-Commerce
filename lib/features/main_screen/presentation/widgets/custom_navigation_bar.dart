import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/features/main_screen/presentation/controller/main_screen_cubit.dart';
import 'package:ecommerce/features/main_screen/presentation/widgets/navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomNavigationBar extends StatelessWidget {
  final int index;
  const CustomNavigationBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizesManager.padding20,
        vertical: SizesManager.padding20,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Card(
          color: theme.colorScheme.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizesManager.circularBorderRadius,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                4,
                (i) => NavigationItem(
                  index: i,
                  isSelected: i == index,
                  onTap: () => GetIt.I<MainScreenCubit>().changeIndex(i),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

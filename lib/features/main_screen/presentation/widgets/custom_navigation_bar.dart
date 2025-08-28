import 'package:ecommerce/core/utils/helper_functions.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/main_screen/presentation/controller/main_screen_cubit.dart';
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
        height: SizesManager.navigationHeight,
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
                (i) => CircularButton(
                  backgroundColor: theme.colorScheme.onPrimaryContainer,
                  onTap: () => GetIt.I<MainScreenCubit>().changeIndex(i),
                  elevation: 0,
                  child: SvgImage(
                    asset: HelperFunctions.getNavigationItemsSvg(i, index == i),
                    color: theme.colorScheme.surface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

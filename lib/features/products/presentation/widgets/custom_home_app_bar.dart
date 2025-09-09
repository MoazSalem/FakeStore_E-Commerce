import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/products/presentation/widgets/app_bar_user_details.dart';
import 'package:ecommerce/features/products/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      titleSpacing: SizesManager.padding20,
      surfaceTintColor: Colors.transparent,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBarUserDetails(),
          SizedBox(height: SizesManager.padding),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex: 5, child: CustomSearchBar()),
              SizedBox(width: SizesManager.padding),
              SizedBox(
                height: SizesManager.buttonHeight48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizesManager.roundedCorners,
                      ),
                    ),
                    minimumSize: Size(
                      SizesManager.squareButtonSide,
                      SizesManager.squareButtonSide,
                    ),
                  ),
                  child: SvgImage(
                    asset: AssetsManager.setting,
                    color: theme.colorScheme.surface,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floating: true,
      toolbarHeight: SizesManager.appBarHeight,
    );
  }
}

import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/app_bar_user_details.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarUserDetails(),
          SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Flexible(flex: 5, child: CustomSearchBar()),
              Flexible(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: theme.colorScheme.inverseSurface,
                    foregroundColor: theme.colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(55, 52),
                  ),
                  child: SvgPicture(
                    AssetBytesLoader(AssetsManager.setting),
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.surface,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floating: true,
      toolbarHeight: 140,
    );
  }
}

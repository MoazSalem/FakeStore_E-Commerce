import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class AppBarUserDetails extends StatelessWidget {
  const AppBarUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SizesManager.padding5,
          children: [
            Text(
              'Hello, Welcome 👋',
              style: TextStyle(
                fontSize: SizesManager.font12,
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: SizesManager.font18,
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SizesManager.padding10,
          ),
          child: CircleAvatar(
            radius: SizesManager.userRadius,
            backgroundColor: theme.colorScheme.primary,
            child: SvgImage(
              asset: AssetsManager.profile,
              color: theme.colorScheme.surface,
              height: SizesManager.iconSize20,
            ),
          ),
        ),
      ],
    );
  }
}

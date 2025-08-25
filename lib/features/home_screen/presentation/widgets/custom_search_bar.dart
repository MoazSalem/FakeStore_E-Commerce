import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: SizesManager.padding14,
          horizontal: SizesManager.padding14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizesManager.roundedCorners),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        hint: Row(
          spacing: SizesManager.padding10,
          children: [
            SvgPicture(
              AssetBytesLoader(AssetsManager.search),
              colorFilter: ColorFilter.mode(
                theme.colorScheme.outline,
                BlendMode.srcIn,
              ),
            ),
            Text(
              'Search...',
              style: TextStyle(
                color: theme.colorScheme.outline,
                fontSize: SizesManager.font18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

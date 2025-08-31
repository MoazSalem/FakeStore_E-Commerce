import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/save_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class ControlsBar extends StatelessWidget {
  final int productId;
  const ControlsBar({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(SizesManager.padding20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularButton(
            child: SvgImage(asset: AssetsManager.back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SaveButton(
            productId: productId,
            backgroundColor: theme.colorScheme.surface,
            foregroundColor: theme.colorScheme.onSurface,
            padding: SizesManager.padding8,
            size: SizesManager.iconSize,
          ),
        ],
      ),
    );
  }
}

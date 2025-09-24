import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/payment/presentation/widgets/tile_card.dart';
import 'package:flutter/material.dart';

class SelectMethodScreen extends StatelessWidget {
  const SelectMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SizesManager.padding32,
        horizontal: SizesManager.padding20,
      ),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: SizesManager.font18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: SizesManager.padding20),
            TileCard(
              title: 'Card',
              leading: SvgImage(asset: AssetsManager.cards),
              onTap: () {},
            ),
            SizedBox(height: SizesManager.padding8),
            TileCard(
              title: 'Mobile Wallet',
              leading: SvgImage(asset: AssetsManager.wallet),
              onTap: () {},
            ),
            SizedBox(height: SizesManager.padding),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/home_screen/domain/entities/rating.dart';
import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key, required this.theme, required this.rating});
  final Rating rating;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgImage(asset: AssetsManager.star, width: SizesManager.iconSize18),
        const SizedBox(width: SizesManager.padding10),
        Text(
          rating.rate.toString(),
          style: TextStyle(fontSize: 14, color: theme.colorScheme.secondary),
        ),
        const SizedBox(width: SizesManager.padding5),
        Text(
          "(${rating.count} reviews)",
          style: const TextStyle(fontSize: 12, color: Colors.blueAccent),
        ),
      ],
    );
  }
}

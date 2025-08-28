import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class ControlsBar extends StatefulWidget {
  const ControlsBar({super.key});

  @override
  State<ControlsBar> createState() => _ControlsBarState();
}

class _ControlsBarState extends State<ControlsBar> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
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
          CircularButton(
            child: SvgImage(
              asset: isFavorite
                  ? AssetsManager.heartFilled
                  : AssetsManager.heart,
            ),
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
    );
  }
}

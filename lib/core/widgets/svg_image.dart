import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({super.key, required this.asset, this.height, this.color});
  final String asset;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      AssetBytesLoader(asset),
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.onSurface,
        BlendMode.srcIn,
      ),
      height: height ?? SizesManager.iconSize,
    );
  }
}

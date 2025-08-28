import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.child,
    this.color,
    this.radius,
    this.height,
    this.width,
    this.padding,
  });
  final Widget child;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          radius ?? SizesManager.bigRoundedCorners,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding ?? SizesManager.padding14),
        child: child,
      ),
    );
  }
}

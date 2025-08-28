import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.child,
    this.onTap,
    this.backgroundColor,
    this.padding,
  });
  final Widget child;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: backgroundColor ?? Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(SizesManager.circularContainerRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          SizesManager.circularContainerRadius,
        ),
        child: Padding(
          padding: EdgeInsets.all(padding ?? SizesManager.padding8),
          child: child,
        ),
      ),
    );
  }
}

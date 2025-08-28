import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.child,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.elevation,
    this.side,
  });
  final Widget child;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? padding;
  final double? elevation;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 2,
      shape: side == null ? CircleBorder() : CircleBorder(side: side!),
      color: backgroundColor ?? Theme.of(context).colorScheme.surface,
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

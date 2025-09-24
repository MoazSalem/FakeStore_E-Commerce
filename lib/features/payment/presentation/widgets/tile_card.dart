import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final String title;
  final Widget leading;
  final VoidCallback onTap;

  const TileCard({
    super.key,
    required this.title,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(SizesManager.roundedCorners),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: InkWell(
        borderRadius: BorderRadius.circular(SizesManager.roundedCorners),
        onTap: onTap,
        child: ListTile(leading: leading, title: Text(title)),
      ),
    );
  }
}

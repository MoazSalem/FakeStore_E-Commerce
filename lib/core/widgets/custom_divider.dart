import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizesManager.dividerHeight,
      color: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}

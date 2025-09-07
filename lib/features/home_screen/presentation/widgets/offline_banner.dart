import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.error,
      title: const Text(
        'You are currently offline',
        style: TextStyle(
          color: Colors.white,
          fontSize: SizesManager.font14,
          fontWeight: FontWeight.w600,
        ),
      ),
      toolbarHeight: 40,
    );
  }
}

import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.action});
  final String title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: SizesManager.tabBarHeight,
      title: Text(
        title,
        style: TextStyle(
          fontSize: SizesManager.font18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [?action],
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: SizesManager.padding26,
      ),
    );
  }
}

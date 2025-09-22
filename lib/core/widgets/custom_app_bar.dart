import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.action,
    this.leading,
  });

  final String title;
  final Widget? action;
  final Widget? leading;

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
      surfaceTintColor: Colors.transparent,
      leading: leading,
      actions: [?action],
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: SizesManager.padding26,
      ),
    );
  }
}

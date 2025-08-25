import 'package:ecommerce/core/widgets/custom_navigation_bar.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/custom_category_scroll_view.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              CustomHomeAppBar(),
              CustomCategoryScrollView(),
              SliverFillRemaining(),
            ],
          ),
          CustomNavigationBar(),
        ],
      ),
    );
  }
}

import 'package:ecommerce/features/home_screen/presentation/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      child: CustomScrollView(
        slivers: [CustomHomeAppBar(), SliverFillRemaining()],
      ),
    );
  }
}

import 'package:ecommerce/features/cart_screen/presentation/screens/cart_screen.dart';
import 'package:ecommerce/features/home_screen/presentation/screens/home_screen.dart';
import 'package:ecommerce/features/main_screen/presentation/widgets/custom_navigation_bar.dart';
import 'package:ecommerce/features/profile_screen/presentation/screens/profile_screen.dart';
import 'package:ecommerce/features/saved_screen/presentation/screens/saved_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: PageView(
          scrollBehavior: const ScrollBehavior().copyWith(
            physics: NeverScrollableScrollPhysics(),
          ),
          controller: pageController,
          children: [
            HomeScreen(),
            CartScreen(),
            SavedScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(pageController: pageController),
    );
  }
}

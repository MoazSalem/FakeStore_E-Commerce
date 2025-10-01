import 'package:ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce/features/main_screen/presentation/widgets/custom_navigation_bar.dart';
import 'package:ecommerce/features/products/presentation/screens/home_screen.dart';
import 'package:ecommerce/features/saved/presentation/screens/saved_screen.dart';
import 'package:ecommerce/features/user/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showSideBar = false;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // if the width is greater than the height then use the side bar
    showSideBar =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if (showSideBar)
              CustomNavigationBar(
                isDrawer: true,
                pageController: pageController,
              ),
            Expanded(
              child: PageView(
                scrollBehavior: const ScrollBehavior().copyWith(
                  scrollbars: false,
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
          ],
        ),
      ),

      bottomNavigationBar: showSideBar
          ? null
          : CustomNavigationBar(
              isDrawer: false,
              pageController: pageController,
            ),
    );
  }
}

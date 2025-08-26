import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/navigation_item.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final PageController pageController;
  const CustomNavigationBar({super.key, required this.pageController});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizesManager.padding20,
        vertical: SizesManager.padding20,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Card(
          color: theme.colorScheme.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizesManager.circularBorderRadius,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                4,
                (i) => NavigationItem(
                  index: i,
                  isSelected: i == _currentIndex,
                  onTap: () => setState(() {
                    _currentIndex = i;
                    widget.pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

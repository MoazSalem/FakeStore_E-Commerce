import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/save_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class ControlsBar extends StatefulWidget {
  final int productId;

  const ControlsBar({super.key, required this.productId});

  @override
  State<ControlsBar> createState() => _ControlsBarState();
}

class _ControlsBarState extends State<ControlsBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(SizesManager.padding20),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularButton(
              child: SvgImage(asset: AssetsManager.back),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SaveButton(
              productId: widget.productId,
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.colorScheme.onSurface,
              padding: SizesManager.padding8,
              size: SizesManager.iconSize,
            ),
          ],
        ),
      ),
    );
  }
}

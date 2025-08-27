import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class NavigationItem extends StatelessWidget {
  final bool isSelected;
  final int index;
  final Function() onTap;
  const NavigationItem({
    super.key,
    this.isSelected = false,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.onPrimaryContainer,
      borderRadius: BorderRadius.circular(SizesManager.circularBorderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(SizesManager.circularBorderRadius),
        onTap: onTap,
        child: SizedBox(
          width: SizesManager.circularContainerRadius,
          height: SizesManager.circularContainerRadius,
          child: SvgPicture(
            AssetBytesLoader(getNavigationItems(index, isSelected)),
            colorFilter: ColorFilter.mode(
              theme.colorScheme.surface,
              BlendMode.srcIn,
            ),
            height: SizesManager.iconSize20,
            width: SizesManager.iconSize20,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}

String getNavigationItems(int index, bool isSelected) {
  switch (index) {
    case 0:
      return isSelected ? AssetsManager.homeFilled : AssetsManager.home;
    case 1:
      return isSelected ? AssetsManager.cartFilled : AssetsManager.cart;
    case 2:
      return isSelected ? AssetsManager.heartFilled : AssetsManager.heart;
    case 3:
      return isSelected ? AssetsManager.profileFilled : AssetsManager.profile;
    default:
      return '';
  }
}

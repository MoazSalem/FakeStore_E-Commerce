import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            title: "Profile",
            action: CircularButton(
              onTap: () {},
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
                width: SizesManager.dividerHeight,
              ),
              elevation: 0,
              padding: SizesManager.padding10,
              child: SvgImage(
                asset: AssetsManager.brush,
                height: SizesManager.iconSize20,
              ),
            ),
          ),
          const SizedBox(height: SizesManager.padding26),
          CircleAvatar(
            radius: SizesManager.avatarBorderRadius,
            child: SvgImage(
              asset: AssetsManager.profileFilled,
              height: SizesManager.avatarBorderRadius,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: SizesManager.padding26),
          Text(
            "John Doe",
            style: TextStyle(
              fontSize: SizesManager.font24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

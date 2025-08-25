import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AppBarUserDetails extends StatelessWidget {
  const AppBarUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text(
              'Hello, Welcome 👋',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: theme.colorScheme.inverseSurface,
            child: SvgPicture(
              AssetBytesLoader(AssetsManager.profile),
              colorFilter: ColorFilter.mode(
                theme.colorScheme.surface,
                BlendMode.srcIn,
              ),
              height: 20,
            ),
          ),
        ),
      ],
    );
  }
}

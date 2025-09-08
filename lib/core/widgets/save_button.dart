import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/saved/presentation/controller/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.productId,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.size,
  });

  final int productId;
  final double? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        if (state is SavedLoaded) {
          return CircularButton(
            padding: padding ?? SizesManager.padding5,
            backgroundColor: backgroundColor ?? theme.colorScheme.primary,
            onTap: () {
              if (state.savedProductsIds.contains(productId)) {
                BlocProvider.of<SavedCubit>(
                  context,
                ).saveId(productId, remove: true);
              } else {
                BlocProvider.of<SavedCubit>(context).saveId(productId);
              }
            },
            child: SvgImage(
              asset: state.savedProductsIds.contains(productId)
                  ? AssetsManager.heartFilled
                  : AssetsManager.heart,
              color: foregroundColor ?? theme.colorScheme.onPrimary,
              height: size ?? SizesManager.iconSize20,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

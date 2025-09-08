import 'package:ecommerce/core/utils/helper_functions.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/cart/presentation/controller/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigationBar extends StatefulWidget {
  final PageController pageController;

  const CustomNavigationBar({super.key, required this.pageController});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentPage = 0;

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
        height: SizesManager.navigationHeight,
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
                (i) => Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CircularButton(
                      backgroundColor: theme.colorScheme.onPrimaryContainer,
                      onTap: () => {
                        setState(() {
                          currentPage = i;
                        }),
                        widget.pageController.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      },
                      elevation: 0,
                      child: SvgImage(
                        asset: HelperFunctions.getNavigationItemsSvg(
                          i,
                          currentPage == i,
                        ),
                        color: theme.colorScheme.surface,
                      ),
                    ),
                    if (i == 1)
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          if (state is CartLoaded) {
                            return Container(
                              width: SizesManager.iconSize16,
                              height: SizesManager.iconSize16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.colorScheme.primaryContainer,
                              ),
                              child: Center(
                                child: Text(
                                  state.count.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onPrimaryContainer,
                                    fontSize: SizesManager.font10,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

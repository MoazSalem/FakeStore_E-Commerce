import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_divider.dart';
import 'package:ecommerce/core/widgets/custom_error_widget.dart';
import 'package:ecommerce/core/widgets/horizontal_item_widget.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/saved/presentation/controller/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        if (state is SavedLoaded) {
          return state.savedProducts.isNotEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: SizesManager.padding10,
                  children: [
                    const CustomAppBar(title: 'Saved Products'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.savedProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: SizesManager.padding20,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: SizesManager.padding10,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      HorizontalItemWidget(
                                        uniqueTag:
                                            '00${state.savedProducts[index].id}',
                                        product: state.savedProducts[index],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(
                                          SizesManager.padding14,
                                        ),
                                        child: CircularButton(
                                          elevation: 0,
                                          side: BorderSide(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.outline,
                                          ),
                                          onTap: () {
                                            BlocProvider.of<SavedCubit>(
                                              context,
                                            ).saveId(
                                              state.savedProducts[index].id,
                                              remove: true,
                                            );
                                          },
                                          child: SvgImage(
                                            asset: AssetsManager.unsave,
                                            height: SizesManager.iconSize16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // divider
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: SizesManager.padding10,
                                  ),
                                  child: CustomDivider(),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    const CustomAppBar(title: 'Saved Products'),
                    Expanded(
                      child: const Center(child: Text('No Saved Products')),
                    ),
                  ],
                );
        } else if (state is SavedError) {
          return Column(
            children: [
              const CustomAppBar(title: 'Saved Products'),
              Expanded(
                child: CustomErrorWidget(
                  message: state.message,
                  statusCode: state.statusCode,
                ),
              ),
            ],
          );
        } else {
          return Expanded(child: const LoadingWidget());
        }
      },
    );
  }
}

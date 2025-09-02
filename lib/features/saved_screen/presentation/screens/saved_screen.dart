import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/features/saved_screen/presentation/controller/saved_cubit.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/horizontal_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        if (state is SavedLoaded && state.savedProducts == null) {
          // get saved products if not loaded
          BlocProvider.of<SavedCubit>(
            context,
          ).getSavedProducts(state.savedProductsIds);
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: SizesManager.padding10,
          children: [
            const CustomAppBar(title: 'Saved Products'),
            state is SavedLoaded &&
                    state.savedProducts != null &&
                    state.savedProducts!.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: state.savedProducts!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: SizesManager.padding10,
                          ),
                          child: Column(
                            spacing: SizesManager.padding10,
                            children: [
                              HorizontalItemWidget(
                                product: state.savedProducts![index],
                              ),
                              // divider
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: SizesManager.padding10,
                                ),
                                child: Container(
                                  height: SizesManager.dividerHeight,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : state is SavedLoading
                ? Expanded(child: const LoadingWidget())
                : Expanded(
                    child: const Center(child: Text('No Saved Products')),
                  ),
          ],
        );
      },
    );
  }
}

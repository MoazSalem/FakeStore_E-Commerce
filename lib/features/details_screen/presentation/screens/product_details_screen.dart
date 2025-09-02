import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/online_image_container.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/features/details_screen/presentation/controller/details_cubit.dart';
import 'package:ecommerce/features/details_screen/presentation/widgets/details_amount_row.dart';
import 'package:ecommerce/features/details_screen/presentation/widgets/controls_bar.dart';
import 'package:ecommerce/features/details_screen/presentation/widgets/rating_widget.dart';
import 'package:ecommerce/features/home_screen/domain/entities/product.dart';
import 'package:ecommerce/features/saved_screen/presentation/controller/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;
  final Product? product;
  final String? uniqueTag;
  const ProductDetailsScreen({
    super.key,
    required this.id,
    this.product,
    this.uniqueTag,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // create a new instance of details cubit and set the product
          create: (context) => GetIt.I<DetailsCubit>()..setProduct(product, id),
        ),
        // use the saved cubit from the main screen
        BlocProvider.value(value: GetIt.I<SavedCubit>()),
      ],
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return state is DetailsLoaded
              ? Scaffold(
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(SizesManager.padding20),
                          child: Column(
                            spacing: SizesManager.padding20,
                            children: [
                              Stack(
                                children: [
                                  Hero(
                                    tag: uniqueTag ?? state.product.id,
                                    child: OnlineImageContainer(
                                      height: 420,
                                      width: double.infinity,
                                      padding: SizesManager.padding20,
                                      imageUrl: state.product.image,
                                    ),
                                  ),
                                  ControlsBar(productId: state.product.id),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: SizesManager.padding10,
                                children: [
                                  Text(
                                    state.product.title,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RatingRow(
                                        theme: theme,
                                        rating: state.product.rating,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: SizesManager.padding,
                                        ),
                                        child: DetailsAmountRow(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                state.product.description,
                                style: TextStyle(
                                  fontSize: SizesManager.font12,
                                  fontWeight: FontWeight.w400,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                              Container(
                                color: theme.colorScheme.outline.withAlpha(60),
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : LoadingWidget();
        },
      ),
    );
  }
}

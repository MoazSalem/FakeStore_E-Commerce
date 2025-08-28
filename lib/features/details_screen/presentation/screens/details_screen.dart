import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/image_container.dart';
import 'package:ecommerce/core/widgets/online_image.dart';
import 'package:ecommerce/features/details_screen/presentation/controller/details_cubit.dart';
import 'package:ecommerce/features/details_screen/presentation/widgets/amount_row.dart';
import 'package:ecommerce/features/details_screen/presentation/widgets/controls_bar.dart';
import 'package:ecommerce/features/details_screen/presentation/widgets/rating_widget.dart';
import 'package:ecommerce/features/saved_screen/presentation/controller/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DetailsCubit()..getProduct(id: id)),
        BlocProvider(create: (context) => SavedCubit()..getSavedProductsIds()),
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
                                  ImageContainer(
                                    height: 420,
                                    width: double.infinity,
                                    padding: SizesManager.padding20,
                                    child: OnlineImage(
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
                                        child: AmountRow(theme: theme),
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
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

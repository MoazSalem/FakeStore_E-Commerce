import 'package:ecommerce/core/utils/helper_functions.dart';
import 'package:ecommerce/core/widgets/custom_error_widget.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/custom_category_scroll_view.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/custom_home_app_bar.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/items_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () => BlocProvider.of<ProductsCubit>(context).getProducts(),
      child: CustomScrollView(
        slivers: [
          CustomHomeAppBar(),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoaded) {
                // Main widget group
                return SliverMainAxisGroup(
                  slivers: [
                    CustomCategoryScrollView(
                      categories: state.categories,
                      currentIndex: state.currentCategoryIndex,
                    ),
                    ItemsListWidget(
                      firstList: state.firstList,
                      secondList: state.secondList,
                    ),
                  ],
                );
              } else if (state is ProductsError) {
                return SliverToBoxAdapter(
                  child: CustomErrorWidget(
                    message: state.message,
                    statusCode: state.statusCode,
                  ),
                );
              } else {
                // Shimmer Loading Group
                return SliverMainAxisGroup(
                  slivers: [
                    Skeletonizer.sliver(
                      child: CustomCategoryScrollView(
                        categories: HelperFunctions.generateFakeCategories(5),
                        currentIndex: 0,
                      ),
                    ),
                    Skeletonizer.sliver(
                      child: ItemsListWidget(
                        firstList: HelperFunctions.generateFakeProducts(4),
                        secondList: HelperFunctions.generateFakeProducts(4),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

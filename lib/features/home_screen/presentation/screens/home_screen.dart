import 'package:ecommerce/core/utils/helper_functions.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/custom_category_scroll_view.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/custom_home_app_bar.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/items_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
    return CustomScrollView(
      slivers: [
        CustomHomeAppBar(),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return state is ProductsLoaded
                ? CustomCategoryScrollView(categories: state.categories)
                : Skeletonizer.sliver(
                    child: CustomCategoryScrollView(
                      categories: HelperFunctions.generateFakeCategories(5),
                    ),
                  );
          },
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return state is ProductsLoaded
                ? ItemsListWidget(
                    firstList: state.firstList,
                    secondList: state.secondList,
                  )
                : Skeletonizer.sliver(
                    child: ItemsListWidget(
                      firstList: HelperFunctions.generateFakeProducts(4),
                      secondList: HelperFunctions.generateFakeProducts(4),
                    ),
                  );
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

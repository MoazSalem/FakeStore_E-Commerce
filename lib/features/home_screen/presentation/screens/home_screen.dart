import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/custom_category_scroll_view.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/custom_home_app_bar.dart';
import 'package:ecommerce/features/home_screen/presentation/widgets/items_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
    return BlocProvider(
      create: (context) => GetIt.I.get<ProductsCubit>()..getProducts(),
      child: CustomScrollView(
        slivers: [
          CustomHomeAppBar(),
          CustomCategoryScrollView(),
          ItemsListWidget(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

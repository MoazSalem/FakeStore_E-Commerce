import 'package:ecommerce/features/cart_screen/presentation/controller/cart_cubit.dart';
import 'package:ecommerce/features/details_screen/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/main_screen/presentation/screens/main_screen.dart';
import 'package:ecommerce/features/profile_screen/presentation/controller/user_cubit.dart';
import 'package:ecommerce/features/saved_screen/presentation/controller/saved_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class NavigationManager {
  static const String mainScreen = '/mainScreen';
  static const String detailsScreen = '/detailsScreen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    GetIt.I.get<ProductsCubit>()..getProducts(),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.I.get<CartCubit>()..getCart(1),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.I.get<SavedCubit>()..getSavedProducts(),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.I.get<UserCubit>()..signIn(),
              ),
            ],
            child: const MainScreen(),
          ),
        );

      default:
        // Handle dynamic routes
        if (settings.name != null && settings.name!.startsWith(detailsScreen)) {
          final uri = Uri.parse(settings.name!);
          final id = uri.pathSegments.length > 1
              ? int.parse(uri.pathSegments[1])
              : 0;

          return MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(id: id),
          );
        }

        // Fallback
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}

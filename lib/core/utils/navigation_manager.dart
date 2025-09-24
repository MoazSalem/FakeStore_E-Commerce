import 'package:ecommerce/features/cart/presentation/controller/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/screens/checkout_screen.dart';
import 'package:ecommerce/features/main_screen/presentation/screens/main_screen.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/presentation/controller/details_cubit.dart';
import 'package:ecommerce/features/products/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/products/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/features/saved/presentation/controller/saved_cubit.dart';
import 'package:ecommerce/features/user/presentation/controller/user_cubit.dart';
import 'package:ecommerce/features/user/presentation/screens/create_account_screen.dart';
import 'package:ecommerce/features/user/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class NavigationManager {
  static const String mainScreen = '/';
  static const String createAccountScreen = '/createAccount';
  static const String detailsScreen = '/details';
  static const String loginScreen = '/login';
  static const String checkoutScreen = '/checkout';

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
                    GetIt.I.get<CartCubit>()..getCart(5),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.I.get<SavedCubit>()..getSavedProducts(),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.I.get<UserCubit>()..checkUser(),
              ),
            ],
            child: const MainScreen(),
          ),
        );
      case createAccountScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: GetIt.I.get<UserCubit>(),
            child: const CreateAccountScreen(),
          ),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: GetIt.I.get<UserCubit>(),
            child: const LoginScreen(),
          ),
        );
      case checkoutScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: GetIt.I.get<CartCubit>(),
            child: const CheckoutScreen(),
          ),
        );

      default:
        // Handle dynamic routes
        if (settings.name != null && settings.name!.startsWith(detailsScreen)) {
          final uri = Uri.parse(settings.name!);
          final id = uri.pathSegments.length > 1
              ? int.parse(uri.pathSegments[1])
              : 0;
          final args = settings.arguments as List<Object?>?;
          final product = args != null && args.isNotEmpty
              ? args.first as Product
              : null;
          final uniqueTag = args != null && args.length > 1
              ? args.last as String
              : null;

          return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  // create a new instance of details cubit and set the product
                  create: (context) =>
                      GetIt.I<DetailsCubit>()..setProduct(product, id),
                ),
                // use the saved cubit from the main screen
                BlocProvider.value(value: GetIt.I<SavedCubit>()),
                // use the cart cubit from the main screen
                BlocProvider.value(value: GetIt.I<CartCubit>()),
              ],
              child: ProductDetailsScreen(id: id, uniqueTag: uniqueTag),
            ),
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

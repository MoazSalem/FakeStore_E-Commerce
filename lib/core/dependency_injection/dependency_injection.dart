import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/features/cart_screen/data/api/cart_api_client.dart';
import 'package:ecommerce/features/home_screen/data/api/product_api_client.dart';
import 'package:ecommerce/features/profile_screen/data/repositories/user_repo_impl.dart';
import 'package:ecommerce/features/profile_screen/domain/repositories/user_repository.dart';
import 'package:ecommerce/features/profile_screen/presentation/controller/user_cubit.dart';
import 'package:ecommerce/features/cart_screen/data/repositories/cart_repository_impl.dart';
import 'package:ecommerce/features/cart_screen/data/usecases/get_cart_impl.dart';
import 'package:ecommerce/features/cart_screen/domain/repositories/cart_repository.dart';
import 'package:ecommerce/features/cart_screen/domain/usecases/get_cart.dart';
import 'package:ecommerce/features/cart_screen/presentation/controller/cart_cubit.dart';
import 'package:ecommerce/features/details_screen/data/usecases/get_product.dart';
import 'package:ecommerce/features/details_screen/domain/usecases/get_product.dart';
import 'package:ecommerce/features/details_screen/presentation/controller/details_cubit.dart';
import 'package:ecommerce/features/home_screen/data/repositories/product_repo_impl.dart';
import 'package:ecommerce/features/home_screen/data/usecases/get_products_impl.dart';
import 'package:ecommerce/features/home_screen/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/home_screen/domain/usecases/get_products.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/saved_screen/presentation/controller/saved_cubit.dart';

final _getIt = GetIt.instance;

// Register dependencies
Future<void> setupDI() async {
  // Register an instance of shared preferences as a singleton
  final prefs = await SharedPreferences.getInstance();
  _getIt.registerSingleton<SharedPreferences>(prefs);
  // Register dio as a singleton
  _getIt.registerLazySingleton<Dio>(() => Dio());
  // Register product repository as a singleton
  _getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepoImpl(dio: _getIt<Dio>()),
  );
  // Register product use case as a singleton
  _getIt.registerLazySingleton<GetProducts>(
    () => GetProductsImpl(_getIt<ProductRepository>()),
  );
  // Register product use case as a singleton
  _getIt.registerFactoryParam<GetProduct, int, void>(
    (id, _) => GetProductImpl(repository: _getIt<ProductRepository>(), id: id),
  );
  // Register product cubit as a singleton
  _getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit());

  // Register saved screen cubit as a singleton
  _getIt.registerLazySingleton<SavedCubit>(() => SavedCubit());
  // Register details screen cubit as a factory
  _getIt.registerFactory<DetailsCubit>(() => DetailsCubit());
  // Register cart screen cubit as a singleton
  _getIt.registerLazySingleton<CartCubit>(() => CartCubit());
  // Register cart repository as a singleton
  _getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(dio: _getIt<Dio>()),
  );
  // Register cart use case as a singleton
  _getIt.registerLazySingleton<GetCartUseCase>(
    () => GetCartImpl(repository: _getIt<CartRepository>()),
  );
  // Register user cubit as a singleton
  _getIt.registerLazySingleton<UserCubit>(() => UserCubit());
  // Register user repository as a singleton
  _getIt.registerLazySingleton<UserRepository>(() => UserRepoImpl());
  // Register product api client as a singleton
  _getIt.registerLazySingleton<ProductApiClient>(
    () => ProductApiClient(_getIt<Dio>()),
  );
  // Register cart api client as a singleton
  _getIt.registerLazySingleton<CartApiClient>(
    () => CartApiClient(_getIt<Dio>()),
  );
}

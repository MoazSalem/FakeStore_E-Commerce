import 'package:dio/dio.dart';
import 'package:ecommerce/features/cart/data/api/cart_api_client.dart';
import 'package:ecommerce/features/cart/data/datasources/cart_remote_datasource_impl.dart';
import 'package:ecommerce/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:ecommerce/features/cart/data/usecases/get_cart_impl.dart';
import 'package:ecommerce/features/cart/domain/datasources/cart_remote_datasource.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:ecommerce/features/cart/domain/usecases/get_cart.dart';
import 'package:ecommerce/features/cart/presentation/controller/cart_cubit.dart';
import 'package:ecommerce/features/products/data/api/product_api_client.dart';
import 'package:ecommerce/features/products/data/datasources/product_local_datasource_impl.dart';
import 'package:ecommerce/features/products/data/datasources/product_remote_datasource_impl.dart';
import 'package:ecommerce/features/products/data/repositories/product_repo_impl.dart';
import 'package:ecommerce/features/products/data/usecases/get_product.dart';
import 'package:ecommerce/features/products/data/usecases/get_products_impl.dart';
import 'package:ecommerce/features/products/domain/datasources/product_local_datasource.dart';
import 'package:ecommerce/features/products/domain/datasources/product_remote_datasource.dart';
import 'package:ecommerce/features/products/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecases/get_product.dart';
import 'package:ecommerce/features/products/domain/usecases/get_products.dart';
import 'package:ecommerce/features/products/presentation/controller/details_cubit.dart';
import 'package:ecommerce/features/products/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/saved/presentation/controller/saved_cubit.dart';
import 'package:ecommerce/features/user/data/repositories/user_repo_impl.dart';
import 'package:ecommerce/features/user/domain/repositories/user_repository.dart';
import 'package:ecommerce/features/user/presentation/controller/user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;

// Register dependencies
Future<void> setupDI() async {
  // Register an instance of shared preferences as a singleton
  final prefs = await SharedPreferences.getInstance();
  _getIt.registerSingleton<SharedPreferences>(prefs);
  // Register dio as a singleton
  _getIt.registerLazySingleton<Dio>(() => Dio());
  // Register product remote data source as a singleton
  _getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(_getIt<ProductApiClient>()),
  );
  // Register product local data source as a singleton
  _getIt.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(_getIt<SharedPreferences>()),
  );
  // Register product repository as a singleton
  _getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepoImpl(
      remote: _getIt<ProductRemoteDataSource>(),
      local: _getIt<ProductLocalDataSource>(),
    ),
  );
  // Register product use case as a singleton
  _getIt.registerLazySingleton<GetProducts>(
    () => GetProductsImpl(_getIt<ProductRepository>()),
  );
  // Register product use case as a factory
  _getIt.registerFactory<GetProduct>(
    () => GetProductImpl(repository: _getIt<ProductRepository>()),
  );
  // Register product cubit as a singleton
  _getIt.registerLazySingleton<ProductsCubit>(
    () => ProductsCubit(
      localDataSource: _getIt<ProductLocalDataSource>(),
      getProductsUseCase: _getIt<GetProducts>(),
    ),
  );

  // Register saved screen cubit as a singleton
  _getIt.registerLazySingleton<SavedCubit>(
    () => SavedCubit(
      getProductUseCase: _getIt<GetProduct>(),
      sharedPreferences: _getIt<SharedPreferences>(),
    ),
  );
  // Register details screen cubit as a factory
  _getIt.registerFactory<DetailsCubit>(
    () => DetailsCubit(getProductUseCase: _getIt<GetProduct>()),
  );
  // Register cart screen cubit as a singleton
  _getIt.registerLazySingleton<CartCubit>(
    () => CartCubit(
      getCartUseCase: _getIt<GetCartUseCase>(),
      getProductUseCase: _getIt<GetProduct>(),
    ),
  );
  // Register cart remote data source as a singleton
  _getIt.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(_getIt<CartApiClient>()),
  );
  // Register cart repository as a singleton
  _getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      cartRemoteDataSource: _getIt<CartRemoteDataSource>(),
    ),
  );
  // Register cart use case as a singleton
  _getIt.registerLazySingleton<GetCartUseCase>(
    () => GetCartImpl(repository: _getIt<CartRepository>()),
  );
  // Register user cubit as a singleton
  _getIt.registerLazySingleton<UserCubit>(
    () => UserCubit(userRepository: _getIt<UserRepository>()),
  );
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

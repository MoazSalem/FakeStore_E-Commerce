import 'package:dio/dio.dart';
import 'package:ecommerce/features/details_screen/data/usecases/get_product.dart';
import 'package:ecommerce/features/details_screen/domain/usecases/get_product.dart';
import 'package:ecommerce/features/details_screen/presentation/controller/details_cubit.dart';
import 'package:ecommerce/features/home_screen/data/repositories/product_repo_impl.dart';
import 'package:ecommerce/features/home_screen/data/usecases/get_products_impl.dart';
import 'package:ecommerce/features/home_screen/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/home_screen/domain/usecases/get_products.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/saved_screen/presentation/controller/saved_cubit.dart';
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
  // Add pretty dio logger to dio
  //getIt<Dio>().interceptors.add(PrettyDioLogger());
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
}

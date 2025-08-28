import 'package:dio/dio.dart';
import 'package:ecommerce/features/details_screen/data/usecases/get_product.dart';
import 'package:ecommerce/features/details_screen/domain/usecases/get_product.dart';
import 'package:ecommerce/features/home_screen/data/repositories/product_repo_impl.dart';
import 'package:ecommerce/features/home_screen/data/usecases/get_products_impl.dart';
import 'package:ecommerce/features/home_screen/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/home_screen/domain/usecases/get_products.dart';
import 'package:ecommerce/features/home_screen/presentation/controller/products_cubit.dart';
import 'package:ecommerce/features/main_screen/presentation/controller/main_screen_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

// Register dependencies
void setupDI() {
  // Register main screen cubit as a singleton
  getIt.registerLazySingleton<MainScreenCubit>(() => MainScreenCubit());
  // Register dio as a singleton
  getIt.registerLazySingleton<Dio>(() => Dio());
  // Add pretty dio logger to dio
  getIt<Dio>().interceptors.add(PrettyDioLogger());
  // Register product repository as a singleton
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepoImpl(dio: getIt<Dio>()),
  );
  // Register product use case as a singleton
  getIt.registerLazySingleton<GetProducts>(
    () => GetProductsImpl(getIt<ProductRepository>()),
  );
  // Register product use case as a singleton
  getIt.registerFactoryParam<GetProduct, int, void>(
    (id, _) => GetProductImpl(repository: getIt<ProductRepository>(), id: id),
  );
  // Register product cubit as a singleton
  getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit());
}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/core/dependency_injection/dependency_injection.dart'
    as _i1069;
import 'package:ecommerce/features/cart/data/api/cart_api_client.dart' as _i438;
import 'package:ecommerce/features/cart/data/datasources/cart_remote_datasource_impl.dart'
    as _i156;
import 'package:ecommerce/features/cart/data/repositories/cart_repository_impl.dart'
    as _i222;
import 'package:ecommerce/features/cart/data/usecases/get_cart_impl.dart'
    as _i273;
import 'package:ecommerce/features/cart/domain/datasources/cart_remote_datasource.dart'
    as _i118;
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart'
    as _i487;
import 'package:ecommerce/features/cart/domain/usecases/get_cart.dart' as _i407;
import 'package:ecommerce/features/cart/presentation/controller/cart_cubit.dart'
    as _i323;
import 'package:ecommerce/features/products/data/api/product_api_client.dart'
    as _i271;
import 'package:ecommerce/features/products/data/datasources/product_local_datasource_impl.dart'
    as _i1021;
import 'package:ecommerce/features/products/data/datasources/product_remote_datasource_impl.dart'
    as _i807;
import 'package:ecommerce/features/products/data/repositories/product_repo_impl.dart'
    as _i875;
import 'package:ecommerce/features/products/data/usecases/get_product.dart'
    as _i369;
import 'package:ecommerce/features/products/data/usecases/get_products_impl.dart'
    as _i258;
import 'package:ecommerce/features/products/domain/datasources/product_local_datasource.dart'
    as _i523;
import 'package:ecommerce/features/products/domain/datasources/product_remote_datasource.dart'
    as _i363;
import 'package:ecommerce/features/products/domain/repositories/product_repository.dart'
    as _i1023;
import 'package:ecommerce/features/products/domain/usecases/get_product.dart'
    as _i520;
import 'package:ecommerce/features/products/domain/usecases/get_products.dart'
    as _i191;
import 'package:ecommerce/features/products/presentation/controller/details_cubit.dart'
    as _i477;
import 'package:ecommerce/features/products/presentation/controller/products_cubit.dart'
    as _i286;
import 'package:ecommerce/features/saved/presentation/controller/saved_cubit.dart'
    as _i139;
import 'package:ecommerce/features/user/data/repositories/user_repo_impl.dart'
    as _i524;
import 'package:ecommerce/features/user/domain/repositories/user_repository.dart'
    as _i824;
import 'package:ecommerce/features/user/presentation/controller/user_cubit.dart'
    as _i919;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i523.ProductLocalDataSource>(
      () => _i1021.ProductLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i824.UserRepository>(() => _i524.UserRepoImpl());
    gh.lazySingleton<_i438.CartApiClient>(
      () => _i438.CartApiClient.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i271.ProductApiClient>(
      () => _i271.ProductApiClient.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i118.CartRemoteDataSource>(
      () => _i156.CartRemoteDataSourceImpl(gh<_i438.CartApiClient>()),
    );
    gh.lazySingleton<_i363.ProductRemoteDataSource>(
      () => _i807.ProductRemoteDataSourceImpl(gh<_i271.ProductApiClient>()),
    );
    gh.lazySingleton<_i919.UserCubit>(
      () => _i919.UserCubit(userRepository: gh<_i824.UserRepository>()),
    );
    gh.lazySingleton<_i1023.ProductRepository>(
      () => _i875.ProductRepoImpl(
        remote: gh<_i363.ProductRemoteDataSource>(),
        local: gh<_i523.ProductLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i520.GetProduct>(
      () => _i369.GetProductImpl(repository: gh<_i1023.ProductRepository>()),
    );
    gh.factory<_i477.DetailsCubit>(
      () => _i477.DetailsCubit(getProductUseCase: gh<_i520.GetProduct>()),
    );
    gh.lazySingleton<_i487.CartRepository>(
      () => _i222.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i118.CartRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i139.SavedCubit>(
      () => _i139.SavedCubit(
        sharedPreferences: gh<_i460.SharedPreferences>(),
        getProductUseCase: gh<_i520.GetProduct>(),
      ),
    );
    gh.lazySingleton<_i191.GetProducts>(
      () => _i258.GetProductsImpl(gh<_i1023.ProductRepository>()),
    );
    gh.lazySingleton<_i407.GetCartUseCase>(
      () => _i273.GetCartImpl(repository: gh<_i487.CartRepository>()),
    );
    gh.lazySingleton<_i323.CartCubit>(
      () => _i323.CartCubit(
        getCartUseCase: gh<_i407.GetCartUseCase>(),
        getProductUseCase: gh<_i520.GetProduct>(),
      ),
    );
    gh.lazySingleton<_i286.ProductsCubit>(
      () => _i286.ProductsCubit(
        localDataSource: gh<_i523.ProductLocalDataSource>(),
        getProductsUseCase: gh<_i191.GetProducts>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i1069.SharedPreferencesModule {}

class _$DioModule extends _i1069.DioModule {}

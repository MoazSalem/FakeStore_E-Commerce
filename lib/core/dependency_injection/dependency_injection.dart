import 'package:dio/dio.dart';
import 'package:ecommerce/core/utils/consts_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependency_injection.config.dart';

final _getIt = GetIt.instance;

// Register dependencies
@InjectableInit()
Future<void> configureDependencies() async => await _getIt.init();

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      baseUrl: ConstsManager.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

import 'package:ecommerce/features/main_screen/presentation/controller/main_screen_cubit.dart';
import 'package:ecommerce/features/main_screen/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class NavigationManager {
  static const String mainScreen = '/mainScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    mainScreen: (context) => BlocProvider(
      create: (BuildContext context) => GetIt.I.get<MainScreenCubit>()..init(),
      child: const MainScreen(),
    ),
  };
}

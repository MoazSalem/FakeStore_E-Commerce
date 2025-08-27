import 'package:ecommerce/features/main_screen/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

class NavigationManager {
  static const String mainScreen = '/mainScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    mainScreen: (context) => const MainScreen(),
  };
}

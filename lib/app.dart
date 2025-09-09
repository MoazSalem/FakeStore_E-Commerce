import 'dart:ui';

import 'package:ecommerce/core/utils/navigation_manager.dart';
import 'package:ecommerce/core/utils/theme_manager.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeManager.lightTheme,
      initialRoute: NavigationManager.mainScreen,
      onGenerateRoute: NavigationManager.onGenerateRoute,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: false,
        overscroll: false,
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
    );
  }
}

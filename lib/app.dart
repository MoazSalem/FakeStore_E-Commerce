import 'package:ecommerce/core/utils/theme_manager.dart';
import 'package:ecommerce/features/main_screen/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeManager.lightTheme,
      home: const MainScreen(),
    );
  }
}

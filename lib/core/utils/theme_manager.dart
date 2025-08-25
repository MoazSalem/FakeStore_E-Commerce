import 'package:ecommerce/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: ColorsManager.primary,
      onPrimary: ColorsManager.onPrimary,
      primaryContainer: ColorsManager.primaryContainer,
      surface: ColorsManager.surface,
      onSurface: ColorsManager.onSurface,
      secondary: ColorsManager.subtitleColor,
      outline: ColorsManager.disabledColor,
    ),
  );
}

import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

SnackBar customSnackBar(String message) {
  return SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(SizesManager.padding)),
    ),
    behavior: SnackBarBehavior.floating,
  );
}

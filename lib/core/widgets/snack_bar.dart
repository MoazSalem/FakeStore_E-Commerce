import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:flutter/material.dart';

SnackBar customSnackBar(String message, {int duration = 2}) {
  return SnackBar(
    content: Text(message),
    duration: Duration(seconds: duration),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(SizesManager.padding)),
    ),
    behavior: SnackBarBehavior.floating,
  );
}

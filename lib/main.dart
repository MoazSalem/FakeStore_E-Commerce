import 'package:ecommerce/app.dart';
import 'package:ecommerce/core/dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(const App());
}

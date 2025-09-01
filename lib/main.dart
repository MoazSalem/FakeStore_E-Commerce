import 'package:ecommerce/app.dart';
import 'package:flutter/material.dart';
import 'core/dependency_injection/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(const App());
}

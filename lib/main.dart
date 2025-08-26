import 'package:ecommerce/app.dart';
import 'package:flutter/material.dart';
import 'core/dependency_injection/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  runApp(const App());
}

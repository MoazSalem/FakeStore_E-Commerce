import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:ecommerce/app.dart';
import 'package:ecommerce/core/dependency_injection/dependency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    DevicePreview(
      defaultDevice: Devices.ios.iPhone13,
      enabled: kIsWeb,
      builder: (context) => const App(),
    ),
  );
}

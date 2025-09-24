import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/app.dart';
import 'package:ecommerce/core/dependency_injection/dependency_injection.dart';
import 'package:ecommerce/features/payment/presentation/controller/payment_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await PaymentCubit.initPaymob();
  runApp(
    DevicePreview(
      defaultDevice: Devices.ios.iPhone16Pro,
      enabled: kIsWeb,
      builder: (context) => const App(),
    ),
  );
}

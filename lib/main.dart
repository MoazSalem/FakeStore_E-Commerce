import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/app.dart';
import 'package:ecommerce/core/dependency_injection/dependency_injection.dart';
import 'package:ecommerce/core/utils/consts_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paymob/flutter_paymob.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await FlutterPaymob.instance.initialize(
    apiKey: ConstsManager.paymobApiKey,
    integrationID: int.parse(ConstsManager.integrationID),
    walletIntegrationId: int.parse(ConstsManager.walletIntegrationId),
    iFrameID: int.parse(ConstsManager.iFrameID),
  );
  runApp(
    DevicePreview(
      defaultDevice: Devices.ios.iPhone16Pro,
      enabled: kIsWeb,
      builder: (context) => const App(),
    ),
  );
}

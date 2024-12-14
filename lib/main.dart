import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/core/services/services.dart';
import 'package:rezaqi_ecommerce/routs.dart';
import 'binding/initialbinding.dart';
import 'core/localization/app_translation.dart';
import 'core/localization/change_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
        locale: controller.languge,
        debugShowCheckedModeBanner: false,
        translations: AppTranslation(),
        getPages: routs,
        initialBinding: InitialBinding(),
        theme: controller.appTheme);
  }
}

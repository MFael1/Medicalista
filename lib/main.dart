import 'package:flutter/material.dart';
import 'package:medicalista/bindings/initial_binding.dart';
import 'package:medicalista/core/localization/changelocale.dart';
import 'package:medicalista/core/localization/translation.dart';
import 'package:medicalista/core/services/services.dart';
import 'package:medicalista/route.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(Medicalista());
}

class Medicalista extends StatelessWidget {
  const Medicalista({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: localeController.language,
      theme: localeController.appTheme,
      translations: MyTranslation(),
      initialBinding: InitialBindings(),
      // routes: routes,
      getPages: routes,
      // home: const Language(),
    );
  }
}

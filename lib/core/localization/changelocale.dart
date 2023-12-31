import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/core/constant/app_theme.dart';
import 'package:medicalista/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyService myService = Get.find();

  ThemeData appTheme = englishTheme;

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myService.sharedPreferences.setString('lang', langCode);
    appTheme = langCode == 'ar' ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myService.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
      appTheme = arabicTheme;
    } else if (sharedPrefLang == 'en') {
      language = const Locale('en');
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }
}

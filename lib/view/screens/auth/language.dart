import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/localization/changelocale.dart';
import 'package:medicalista/view/components/language_widget/custom_button_lang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9d9d9),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '1.0'.tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButtonLang(
            textbutton: 'Arabic',
            onPressed: () {
              controller.changeLanguage('ar');
              Get.offAllNamed(AppRoutes.onBoarding);
            },
          ),
          CustomButtonLang(
            textbutton: 'English',
            onPressed: () {
              controller.changeLanguage('en');
              Get.offAllNamed(AppRoutes.onBoarding);
            },
          )
        ]),
      ),
    );
  }
}

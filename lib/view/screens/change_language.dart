import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/core/constant/color.dart';
import 'package:medicalista/core/localization/changelocale.dart';
import 'package:medicalista/view/components/language_widget/custom_button_lang.dart';

class ChangeLanguage extends GetView<LocaleController> {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.egradientApp),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                Get.back();
              },
            ),
            CustomButtonLang(
              textbutton: 'English',
              onPressed: () {
                controller.changeLanguage('en');
                Get.back();
              },
            )
          ]),
        ),
      ),
    );
  }
}

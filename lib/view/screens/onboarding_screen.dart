import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/controller/onboarding_controller.dart';
import 'package:medicalista/view/components/onboarding/custom_onboarding_button.dart';
import 'package:medicalista/view/components/onboarding/dot_controller.dart';
import 'package:medicalista/view/components/onboarding/onboarding_slider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingContrllerImpliment());
    return const Scaffold(
        backgroundColor: Color(0xffd9d9d9),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: OnboardingSlider(),
            ),
            OnboardingControllerMove(),
            CustomOnboardingButton()
          ],
        )));
  }
}

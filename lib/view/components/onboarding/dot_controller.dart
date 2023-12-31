import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/controller/onboarding_controller.dart';
import 'package:medicalista/core/constant/color.dart';

class OnboardingControllerMove extends StatelessWidget {
  const OnboardingControllerMove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingContrllerImpliment>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            3,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: controller.current == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      );
    });
  }
}

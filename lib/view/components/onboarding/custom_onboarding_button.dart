import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/controller/onboarding_controller.dart';
import 'package:medicalista/core/constant/color.dart';

class CustomOnboardingButton extends GetView<OnboardingContrllerImpliment> {
  const CustomOnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      margin: EdgeInsets.only(bottom: 40, top: 40),
      decoration: BoxDecoration(
          color: AppColor.kPrimaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        child: Text('Continue', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/services/services.dart';
import 'package:medicalista/data/source/static/static.dart';

abstract class OnboardingController extends GetxController {
  next();
  onChangedPage(int index);
}

class OnboardingContrllerImpliment extends OnboardingController {
  int current = 0;

  late PageController pageController;

  MyService myService = Get.find();

  @override
  next() {
    current++;
    if (current >= onBoardingList.length) {
      myService.sharedPreferences.setString('step', '1');
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(current,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onChangedPage(int index) {
    current = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}

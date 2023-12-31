import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/controller/onboarding_controller.dart';
import 'package:medicalista/data/source/static/static.dart';

class OnboardingSlider extends GetView<OnboardingContrllerImpliment> {
  const OnboardingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onChangedPage(value);
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              onBoardingList[index].title!,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            // const SizedBox(height: 20),
            Image.asset(onBoardingList[index].image!),
            // const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                onBoardingList[index].body!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}

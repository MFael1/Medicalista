import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalista/controller/auth/success_controller.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/core/constant/color.dart';
import 'package:medicalista/view/components/auth_widget/custom_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessControllerImp controller = Get.put(SuccessControllerImp());
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff9c9c9c),
            Color(0xffaaaaaa),
            Color(0xffbbbbbb),
            Color(0xffcccccc),
            Color(0xffdddddd),
            Color(0xffeeeeee),
            Color(0xffffffff)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Lottie.asset(AppImageAssets.success,
                    repeat: false, height: 500),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '4.0'.tr,
                      style:
                          const TextStyle(fontSize: 40, color: AppColor.grey),
                    ),
                  ],
                ),
                // Spacer(
                //   flex: 1,
                // ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    name: '4.1'.tr,
                    func: () {
                      controller.goToLogin();
                    })
              ],
            )),
      ),
    );
  }
}

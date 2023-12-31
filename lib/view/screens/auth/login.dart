import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalista/controller/auth/login_controller.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/core/constant/color.dart';
import 'package:medicalista/core/functions/alertexit.dart';
import 'package:medicalista/core/functions/valid_input.dart';
import 'package:medicalista/view/components/auth_widget/custom_button.dart';
import 'package:medicalista/view/components/auth_widget/custom_text_feild_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.gradientApp),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (didPop) {
              return;
            }
            alertExitApp();
          },
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) {
              return controller.statusRequest == StatusRequest.loading
                  ? Center(
                      child: Lottie.asset(AppImageAssets.loadingImage),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/images/logo.png',
                              height: 200,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2.0'.tr,
                                  style: const TextStyle(
                                      fontSize: 24, color: Color(0xff444444)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '2.1'.tr,
                                  style: const TextStyle(
                                      color: Color(0xff333333), fontSize: 24),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextWidgetLogin(
                              validat: (value) {
                                return validInput(value!, 5, 50, "email");
                              },
                              textEditingController: controller.email,
                              hint: '2.2'.tr,
                              icon: const Icon(Icons.email_outlined),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextWidgetLogin(
                              validat: (value) {
                                return validInput(value!, 8, 50, "password");
                              },
                              textEditingController: controller.password,
                              hint: '2.3'.tr,
                              icon: IconButton(
                                icon: Icon(controller.isHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  controller.makeItHidden();
                                },
                              ),
                              obsecure: controller.isHidden,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                                name: '2.1'.tr,
                                func: () {
                                  controller.login();
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('2.4'.tr),
                                GestureDetector(
                                  onTap: () {
                                    controller.goToSignUp();
                                  },
                                  child: Text(
                                    '2.5'.tr,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}

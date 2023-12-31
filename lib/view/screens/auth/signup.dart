import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalista/controller/auth/sign_up_controller.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/core/constant/color.dart';
import 'package:medicalista/core/functions/alertexit.dart';
import 'package:medicalista/core/functions/valid_input.dart';
import 'package:medicalista/view/components/auth_widget/custom_button.dart';
import 'package:medicalista/view/components/auth_widget/custom_text_feild_signup.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.gradientApp),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
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
            child: GetBuilder<SignUpControllerImp>(
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
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3.0'.tr,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Color(0xff444444),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '2.5'.tr,
                                    style: const TextStyle(
                                        color: Color(0xff333333), fontSize: 24),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                validat: (value) {
                                  return validInput(value!, 3, 50, "username");
                                },
                                hint: '3.1'.tr,
                                icon: const Icon(Icons.perm_identity_outlined),
                                textEditingController: controller.firstName,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                validat: (value) {
                                  return validInput(value!, 3, 50, "username");
                                },
                                hint: '3.2'.tr,
                                icon: const Icon(Icons.perm_identity_outlined),
                                textEditingController: controller.lastName,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                validat: (value) {
                                  return validInput(value!, 2, 50, "country");
                                },
                                hint: '3.3'.tr,
                                icon:
                                    const Icon(Icons.add_location_alt_outlined),
                                textEditingController: controller.country,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                validat: (value) {
                                  return validInput(value!, 2, 50, "state");
                                },
                                hint: '3.4'.tr,
                                icon: const Icon(Icons.location_city),
                                textEditingController: controller.state,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                validat: (value) {
                                  return validInput(value!, 2, 50, "street");
                                },
                                hint: '3.5'.tr,
                                icon: const Icon(Icons.streetview_outlined),
                                textEditingController: controller.street,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                validat: (value) {
                                  return validInput(value!, 5, 50, "email");
                                },
                                keyboard: 'email',
                                hint: '2.2'.tr,
                                icon: const Icon(Icons.email_outlined),
                                textEditingController: controller.email,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                validat: (value) {
                                  return validInput(value!, 10, 10, "phone");
                                },
                                keyboard: 'phone',
                                hint: '3.6'.tr,
                                icon: const Icon(Icons.phone),
                                textEditingController: controller.phone,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                validat: (value) {
                                  return validInput(value!, 8, 50, "password");
                                },
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
                                textEditingController: controller.password,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomButton(
                                  name: '3.7'.tr,
                                  func: () {
                                    controller.goToSuccessPage();
                                  }),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('3.8'.tr),
                                  GestureDetector(
                                      onTap: () {
                                        controller.goToLogin();
                                      },
                                      child: Text(
                                        '2.1'.tr,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
              },
            )),
      ),
    );
  }
}

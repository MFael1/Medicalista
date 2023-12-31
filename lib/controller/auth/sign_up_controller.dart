import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/functions/handling_data.dart';
import 'package:medicalista/data/source/remote/auth/sign_up_data.dart';

abstract class SignUpController extends GetxController {
  goToLogin();
  goToSuccessPage();
  makeItHidden();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController country;
  late TextEditingController state;
  late TextEditingController street;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;

  final GlobalKey<FormState> formstate = GlobalKey();

  bool isHidden = true;

  SignUpData signUpData = SignUpData(Get.find());
  List data = [];
  StatusRequest? statusRequest;

  @override
  makeItHidden() {
    isHidden = !isHidden;
    update();
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  goToSuccessPage() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          //response will be either Map or status request
          firstName.text,
          lastName.text,
          country.text,
          state.text,
          street.text,
          email.text,
          phone.text,
          password.text);
      statusRequest = handlingData(
          response); // if Map status request will be statusrequest.success else will be status reque
      if (statusRequest == StatusRequest.success) {
        if (response['token'] != null) {
          print(response['token']);
          // here the response should be map contain the token only
          data.add(response['token']);
          Get.offAllNamed(AppRoutes.login);
        } else {
          //server failure 422
          Get.defaultDialog(
              title: "Error", middleText: 'Email is already exist');
          statusRequest = StatusRequest.failure;
        }
      } else {
        Get.defaultDialog(title: "Error", middleText: 'Email is already exist');
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    country = TextEditingController();
    state = TextEditingController();
    street = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    country.dispose();
    state.dispose();
    street.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}

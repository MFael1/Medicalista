import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/functions/handling_data.dart';
import 'package:medicalista/core/services/services.dart';
import 'package:medicalista/data/source/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  makeItHidden();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isHidden = true;

  MyService myService = Get.find();

  LoginData loginData = LoginData(Get.find());
  StatusRequest? statusRequest;
  List data = [];
  @override
  goToSignUp() {
    Get.offAllNamed(AppRoutes.signUp);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
          //response will be either Map or status request
          email.text,
          password.text);
      statusRequest = handlingData(
          response); // if Map status request will be statusrequest.success else will be status request

      if (statusRequest == StatusRequest.success) {
        if (response['token'] != null) {
          // here the response should be map contain the token only
          data.add(response['token']);
          myService.sharedPreferences.setString('token', response['token']);
          myService.sharedPreferences
              .setString('firstname', response['client']['first_name']);
          myService.sharedPreferences
              .setString('lastname', response['client']['last_name']);
          myService.sharedPreferences
              .setString('email', response['client']['email']);
          myService.sharedPreferences
              .setString('phone', response['client']['contact_number']);
          myService.sharedPreferences
              .setString('country', response['client']['address']['country']);
          myService.sharedPreferences
              .setString('state', response['client']['address']['state']);
          myService.sharedPreferences.setString(
              'street', response['client']['address']['neighbourhood']);
          myService.sharedPreferences.setString('step', '2');
          Get.offAllNamed(AppRoutes.success);
        } else {
          //serverfailure 422
          Get.defaultDialog(
              title: "Error", middleText: 'Email or password is already exist');
          statusRequest = StatusRequest.failure;
        }
      } else {
        // server failure 422
        Get.defaultDialog(
            title: "Error", middleText: 'Email or password is not correct');
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }

  @override
  makeItHidden() {
    isHidden = !isHidden;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

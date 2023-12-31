import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  MyService myService = Get.find();

  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myService.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: AppRoutes.homePage);
    } else if (myService.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: AppRoutes.login);
    }
    return const RouteSettings(name: AppRoutes.language);
  }
}

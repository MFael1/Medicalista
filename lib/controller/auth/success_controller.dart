import 'package:get/get.dart';
import 'package:medicalista/core/constant/routes_names.dart';

abstract class SuccessController extends GetxController {
  goToLogin();
}

class SuccessControllerImp extends SuccessController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.homePage);
  }
}

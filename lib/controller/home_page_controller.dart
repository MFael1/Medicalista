import 'package:get/get.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/services/services.dart';

abstract class HomeController extends GetxController {
  goToSectionItems();
  goToProfile();
  goToFavorites();
  goToHistory();
  goToSetting();
  goToAbout();
  goToOrderes();
}

class HomeControllerImp extends HomeController {
  MyService myService = Get.find();
  String? username;

  @override
  goToSectionItems() {
    Get.toNamed(AppRoutes.secItems);
  }

  @override
  goToAbout() {}

  @override
  goToFavorites() {}

  @override
  goToHistory() {}

  @override
  goToOrderes() {}

  @override
  goToProfile() {}

  @override
  goToSetting() {}
}

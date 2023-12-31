import 'package:get/get.dart';
import 'package:medicalista/core/classes/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}

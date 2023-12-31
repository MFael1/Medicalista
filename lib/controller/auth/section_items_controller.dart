import 'package:get/get.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/functions/handling_data.dart';
import 'package:medicalista/data/source/remote/sections/sec1.dart';

abstract class SectionItemsController extends GetxController {
  getItems();
}

class SectionItemsControllerImp extends SectionItemsController {
  StatusRequest? statusRequest;
  List data = [];
  SecData secData = SecData(Get.find());
  String secName = '';
  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await secData.getData(secName);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data.clear();
      data.addAll(response);
    } else {
      Get.defaultDialog(
          title: "not found", middleText: 'there are no medicines');
      statusRequest = StatusRequest.failure;
    }
    print('hello world');
    update();
  }
}

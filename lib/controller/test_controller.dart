import 'package:get/get.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/functions/handling_data.dart';
import 'package:medicalista/data/source/remote/remote.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      data.addAll(response[data]);
    }
  }
}

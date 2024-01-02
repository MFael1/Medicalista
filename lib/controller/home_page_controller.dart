import 'package:get/get.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/functions/handling_data.dart';
import 'package:medicalista/core/services/services.dart';
import 'package:medicalista/data/source/remote/order_data.dart';
import 'package:medicalista/data/source/remote/sections/my_orders.dart';

abstract class HomeController extends GetxController {
  goToSectionItems();
  goToProfile();
  goToFavorites();
  goToHistory();
  goToSetting();
  goToAbout();
  goToOrderes();
  addProduct();
  goToCart();
  makeAnOrder();
}

class HomeControllerImp extends HomeController {
  MyService myService = Get.find();
  Order order = Order(Get.find());
  MyOrdersData myOrdersData = MyOrdersData(Get.find());
  String? username;
  List<Map> cart = [];

  List myOrders = [];
  StatusRequest? ordersStatus;

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
  goToOrderes() async {
    ordersStatus = StatusRequest.loading;
    update();
    var response = await myOrdersData.getData();
    ordersStatus = handlingData(response);
    if (ordersStatus == StatusRequest.success) {
      myOrders.clear();
      myOrders.addAll(response);
      print(myOrders.length);
    } else {
      Get.defaultDialog(
          title: "not found", middleText: 'there are no medicines');
      ordersStatus = StatusRequest.failure;
    }
    update();
    Get.toNamed(AppRoutes.ordersPage);
  }

  @override
  goToProfile() {}

  @override
  goToSetting() {}

  @override
  addProduct() {}

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cartPage);
  }

  @override
  makeAnOrder() {
    order.sendOrder(cart);
    cart.clear();
  }
}

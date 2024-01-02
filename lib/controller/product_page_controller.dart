import 'package:get/get.dart';
import 'package:medicalista/controller/home_page_controller.dart';

abstract class ProductPageController extends GetxController {
  addToCart();
}

class ProductPageControllerImp extends ProductPageController {
  HomeControllerImp homeControllerImp = Get.find();
  Map? product;
  int cnt = 0;

  @override
  addToCart() {
    print(product);
    homeControllerImp.cart.add(
      {
        "warehouse_id": product!['warehouse_id'],
        "medicine_id": product!['id'],
        "quantity": cnt,
        "name": product!['generic_name']
      },
    );
    cnt = 0;
  }
}

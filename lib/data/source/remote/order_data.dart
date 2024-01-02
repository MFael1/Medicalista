import 'package:medicalista/api_links.dart';
import 'package:medicalista/core/classes/crud.dart';

class Order {
  Crud crud;

  Order(this.crud);

  sendOrder(List data) async {
    var response = await crud.postData(AppLinks.makeOrder, data);
    return response.fold((l) => l, (r) => r);
  }
}

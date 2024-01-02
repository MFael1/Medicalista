import 'package:medicalista/api_links.dart';
import 'package:medicalista/core/classes/crud.dart';

class MyOrdersData {
  Crud crud;

  MyOrdersData(this.crud);

  getData() async {
    var response = await crud.getMyOrdersData(AppLinks.makeOrder);
    return response.fold((l) => l, (r) => r);
  }
}

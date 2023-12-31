import 'package:medicalista/api_links.dart';
import 'package:medicalista/core/classes/crud.dart';

class SecData {
  Crud crud;

  SecData(this.crud);

  getData(String secName) async {
    var response = await crud.getData(AppLinks.sectionMed, secName);
    return response.fold((l) => l, (r) => r);
  }
}

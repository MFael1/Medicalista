import 'package:medicalista/core/classes/crud.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData('', {});
    return response.fold((l) => l, (r) => r);
  }
}

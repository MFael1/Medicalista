import 'package:medicalista/api_links.dart';
import 'package:medicalista/core/classes/crud.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postData(
    String email,
    String password,
  ) async {
    var response = await crud.postData(
      AppLinks.login,
      {
        "username": email,
        "password": password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

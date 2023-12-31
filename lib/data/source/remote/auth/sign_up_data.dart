import 'package:medicalista/api_links.dart';
import 'package:medicalista/core/classes/crud.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postData(
    String firstname,
    String lastname,
    String country,
    String state,
    String street,
    String email,
    String phone,
    String password,
  ) async {
    var response = await crud.postData(
      AppLinks.signUP,
      {
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "password": password,
        "contact_number": phone,
        "address": {
          "country": country,
          "state": state,
          "neighbourhood": street,
        }
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}

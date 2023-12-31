import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:http/http.dart' as http;
import 'package:medicalista/core/services/services.dart';

class Crud {
  MyService myService = Get.find();
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      var response = await http.post(Uri.parse(linkurl),
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"});
      print(response.body);
      if (response.statusCode - 200 < 100) {
        Map responsebody = jsonDecode(response.body);
        return right(responsebody);
      } else {
        return left(StatusRequest.serverfailure);
      }
    } catch (e) {
      return left(StatusRequest.serverexception);
    }
  }

  Future<Either<StatusRequest, List>> getData(
      String linkurl, String secName) async {
    try {
      var response = await http.get(Uri.parse(linkurl), headers: {
        "Content-Type": "application/json",
        "category": secName,
        "Authorization":
            "Bearer ${myService.sharedPreferences.getString('token')}"
      });
      print(response.statusCode);
      print(secName);
      if (response.statusCode - 200 < 100) {
        print('completeddddddddd');
        List responsebody = jsonDecode(response.body);
        return right(responsebody);
      } else {
        return left(StatusRequest.serverfailure);
      }
    } catch (e) {
      return left(StatusRequest.serverexception);
    }
  }
}

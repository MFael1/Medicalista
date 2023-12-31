import 'package:get/get.dart';

validInput(String value, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(value)) {
      return 'Not valid username';
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(value)) {
      return "Not valid Email";
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Not valid Email";
    }
  }

  if (value.length < min) {
    return "Can't be less than $min";
  }

  if (value.length > max) {
    return "Can't be less than $max";
  }

  if (value.isEmpty) {
    return "Can't be empty";
  }
}

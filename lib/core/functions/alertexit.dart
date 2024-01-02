import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() {
  Get.defaultDialog(title: '8.0'.tr, middleText: '8.1'.tr, actions: [
    ElevatedButton(
      onPressed: () {
        exit(0);
      },
      child: Text('Confirm'),
    ),
    ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: Text('Cancel'),
    )
  ]);
}

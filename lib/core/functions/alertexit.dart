import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp() {
  Get.defaultDialog(
      title: 'تنبيه',
      middleText: 'هل تريد الخروح من التطبيق؟',
      actions: [
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

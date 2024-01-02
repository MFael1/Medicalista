import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalista/controller/product_page_controller.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/core/constant/color.dart';
import 'package:medicalista/view/components/auth_widget/custom_text_feild_login.dart';
import 'package:medicalista/view/components/product_widgets/product_attribute.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductPageControllerImp controller = Get.find();
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.egradientApp),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Card(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProductAttribute(
                        name: '7.0'.tr,
                        detail: controller.product!['generic_name'] ?? 'empty'),
                    ProductAttribute(
                        name: '7.1'.tr,
                        detail: controller.product!['brand'] ?? 'empty'),
                    ProductAttribute(
                        name: '7.2'.tr,
                        detail: controller.product!['manufacturer'] ?? 'empty'),
                    ProductAttribute(
                        name: '7.3'.tr,
                        detail:
                            controller.product!['available_amount'] ?? 'empty'),
                    ProductAttribute(
                        name: '7.4'.tr,
                        detail:
                            controller.product!['expiration_date'] ?? 'empty'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '7.5'.tr,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${controller.product!['price_after_discount'].toString()} S.P'
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              '${controller.product!['price'].toString()} S.P',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ), //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('7.6'.tr),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.star,
                          color: Color(0xffC1C23C),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (controller.cnt == 0) {
                        Get.defaultDialog(
                            title: '9.0'.tr, middleText: '9.1'.tr);
                      } else {
                        Get.defaultDialog(
                            title: '9.2'.tr, middleText: '9.3'.tr);
                        controller.addToCart();
                      }
                    },
                    child: Row(
                      children: [
                        Text('7.7'.tr),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.add_shopping_cart,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text('7.8'.tr),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                        // gradient: AppColor.gradientApp,
                        borderRadius: BorderRadius.circular(12)),
                    width: 50,
                    child: TextField(
                      onChanged: (value) {
                        controller.cnt = int.parse(value);
                      },
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

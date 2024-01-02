import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalista/controller/home_page_controller.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/core/constant/color.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.find();
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.egradientApp),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Lottie.asset(AppImageAssets.packingMed,
                  repeat: false, height: 300),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '10.1'.tr,
                      style: const TextStyle(
                          color: AppColor.grey,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '10.0'.tr,
                      style: const TextStyle(
                          color: AppColor.grey,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                height: 300,
                child: Card(
                  child: ListView.builder(
                    itemCount: homeControllerImp.cart.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Table(
                            columnWidths: const {1: FractionColumnWidth(.2)},
                            children: [
                              TableRow(children: [
                                Text(
                                  homeControllerImp.cart[index]['name'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(
                                //   height: 1,
                                //   width: 10,
                                // ),
                                Text(
                                  homeControllerImp.cart[index]['quantity']
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ])
                            ],
                          ));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  if (homeControllerImp.cart.isEmpty) {
                    Get.defaultDialog(title: '11.0'.tr, middleText: '11.1'.tr);
                  } else {
                    Get.defaultDialog(title: '11.2'.tr, middleText: '11.3'.tr);
                    homeControllerImp.makeAnOrder();
                  }
                },
                child: Text(
                  '10.2'.tr,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

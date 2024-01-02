import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalista/controller/home_page_controller.dart';
import 'package:medicalista/controller/order_controller.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/core/constant/color.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/view/components/home_page_widgets/custom_section_listtile.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.find();
    OrderControllerImp orderControllerImp = Get.put(OrderControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.eFifthColor,
      ),
      body: Container(child: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return homeControllerImp.ordersStatus == StatusRequest.loading
              ? Center(
                  child: Lottie.asset(AppImageAssets.loadingImage),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: homeControllerImp.myOrders.length,
                    itemBuilder: (context, index) {
                      return CustomSectionListTile(
                        title: 'Order ${(index + 1).toString()}',
                        subtitle: homeControllerImp.myOrders[index]['state'] ??
                            'none',
                        onTap: () {
                          // orderControllerImp.data.addAll(homeControllerImp
                          //     .myOrders[index]['order_details']);
                          // print(homeControllerImp.myOrders[0]['order_details']);
                          // orderControllerImp.data.add(homeControllerImp
                          //     .myOrders[index]['order_details']);
                          // print(orderControllerImp.data);
                          // Get.toNamed(AppRoutes.orderDetails);
                        },
                      );
                    },
                  ),
                );
        },
      )),
    );
  }
}

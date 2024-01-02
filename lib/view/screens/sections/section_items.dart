import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalista/controller/auth/section_items_controller.dart';
import 'package:medicalista/controller/product_page_controller.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/core/constant/color.dart';
import 'package:medicalista/view/components/home_page_widgets/custom_section_listtile.dart';

class SectionItems extends StatelessWidget {
  const SectionItems({super.key});

  @override
  Widget build(BuildContext context) {
    SectionItemsControllerImp contorller = Get.find();
    ProductPageControllerImp productController =
        Get.put(ProductPageControllerImp());
    return Container(
      decoration: BoxDecoration(gradient: AppColor.egradientApp),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              contorller.secName,
              style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: GetBuilder<SectionItemsControllerImp>(
            builder: (controller) {
              return contorller.statusRequest == StatusRequest.loading
                  ? Center(
                      child: Lottie.asset(AppImageAssets.loadingImage),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                        itemCount: contorller.data.length,
                        itemBuilder: (context, index) {
                          return CustomSectionListTile(
                            title: contorller.data[index]['generic_name'],
                            subtitle: contorller.data[index]['manufacturer'],
                            onTap: () {
                              productController.product =
                                  controller.data[index];
                              print(productController.product);
                              controller.goToProduct();
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

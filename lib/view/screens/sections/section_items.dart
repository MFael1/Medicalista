import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalista/controller/auth/section_items_controller.dart';
import 'package:medicalista/core/classes/status_request.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/view/components/home_page_widgets/custom_section_listtile.dart';

class SectionItems extends StatelessWidget {
  const SectionItems({super.key});

  @override
  Widget build(BuildContext context) {
    SectionItemsControllerImp contorller = Get.find();
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<SectionItemsControllerImp>(
          builder: (controller) {
            return contorller.statusRequest == StatusRequest.loading
                ? Center(
                    child: Lottie.asset(AppImageAssets.loadingImage),
                  )
                : ListView.builder(
                    itemCount: contorller.data.length,
                    itemBuilder: (context, index) {
                      return CustomSectionListTile(
                        title: contorller.data[index]['generic_name'],
                        subtitle: contorller.data[index]['manufacturer'],
                        onTap: () {},
                      );
                    },
                  );
          },
        ));
  }
}

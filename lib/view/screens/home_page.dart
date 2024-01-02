import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicalista/controller/auth/section_items_controller.dart';
import 'package:medicalista/controller/home_page_controller.dart';
import 'package:medicalista/core/constant/app_images.dart';
import 'package:medicalista/core/constant/color.dart';
import 'package:medicalista/core/constant/routes_names.dart';
import 'package:medicalista/core/services/services.dart';
import 'package:medicalista/view/components/home_page_widgets/custom_section_listtile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    SectionItemsControllerImp seccontorller =
        Get.put(SectionItemsControllerImp());

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: AppColor.eFifthColor,
        title: Text('5.0'.tr,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                controller.goToCart();
                print(controller.cart.length);
              },
              icon: const Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
          ),
        ],
      ),
      //_______________________________drawer____________________________________
      drawer: Drawer(
        // width: 250,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(color: AppColor.eFirstColor),
                padding: const EdgeInsets.only(top: 60, bottom: 24),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 52,
                      child: Icon(
                        Icons.person,
                        size: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      controller.myService.sharedPreferences
                          .getString('firstname')!,
                      style: const TextStyle(
                          fontSize: 28,
                          color: AppColor.eFourthColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.myService.sharedPreferences
                          .getString('email')!,
                      style: const TextStyle(
                          fontSize: 16, color: AppColor.eFourthColor),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.view_list,
                        color: AppColor.eFifthColor,
                      ),
                      title: Text('6.0'.tr),
                      onTap: () {
                        controller.goToOrderes();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_outline,
                          color: AppColor.eFifthColor),
                      title: Text('6.1'.tr),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite_border,
                          color: AppColor.eFifthColor),
                      title: Text('6.2'.tr),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.history,
                          color: AppColor.eFifthColor),
                      title: Text('6.3'.tr),
                      onTap: () {},
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.settings,
                          color: AppColor.eFifthColor),
                      title: Text('6.4'.tr),
                      onTap: () {
                        Get.toNamed(AppRoutes.changeLanguage);
                      },
                    ),
                    ListTile(
                        leading: const Icon(Icons.logout,
                            color: AppColor.eFifthColor),
                        title: Text('6.5'.tr),
                        onTap: () {
                          controller.myService.sharedPreferences.clear();
                          controller.myService.sharedPreferences
                              .setString('step', '1');

                          Get.offAllNamed(AppRoutes.login);
                        }),
                    ListTile(
                      leading: const Icon(Icons.medication,
                          color: AppColor.eFifthColor),
                      title: Text('6.6'.tr),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ////////////////////////body//////////////////////////////////////////
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Lottie.asset(AppImageAssets.girlLieOnCouch,
                height: 280, repeat: false),
            CustomSectionListTile(
                title: '5.1'.tr,
                subtitle: '5.2'.tr, //Analgesics
                onTap: () {
                  seccontorller.secName = 'Analgesics';
                  seccontorller.getItems();
                  controller.goToSectionItems();
                }),
            CustomSectionListTile(
                title: '5.3'.tr,
                subtitle: '5.4'.tr,
                onTap: () {
                  seccontorller.secName = 'Antibiotics';
                  seccontorller.getItems();
                  controller.goToSectionItems();
                }),
            CustomSectionListTile(
                title: '5.5'.tr,
                subtitle: '5.6'.tr,
                onTap: () {
                  seccontorller.secName = 'Vaccines';
                  seccontorller.getItems();
                  controller.goToSectionItems();
                }),
            CustomSectionListTile(
                title: '5.7'.tr,
                subtitle: '5.8'.tr,
                onTap: () {
                  seccontorller.secName = 'Ophthalmic Medications';
                  seccontorller.getItems();
                  controller.goToSectionItems();
                }),
            // SizedBox(
            //   height: 30,
            // ),
            // IconButton(
            //     onPressed: () {
            //       controller.goToCart();
            //       print(controller.cart.length);
            //     },
            //     icon: Icon(
            //       Icons.shopping_cart_rounded,
            //       color: AppColor.eFifthColor,
            //       size: 50,
            //     )),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Cart',
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 22,
            //           color: AppColor.eFourthColor),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
